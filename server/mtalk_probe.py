#!/usr/bin/env python3
"""MTalk / MCS 服务器探针。

第一阶段目标：完成 TLS 握手并原样打印客户端发来的字节，
用于确认帧格式与 protobuf 内容。
"""
import socket
import ssl
import sys
import threading
import time
import binascii
import os

HOST = '0.0.0.0'
PORT = 5228
_HERE = os.path.dirname(os.path.abspath(__file__))
CERT = os.path.join(os.path.dirname(_HERE), 'certs', 'server.crt')
KEY = os.path.join(os.path.dirname(_HERE), 'certs', 'server.key')

LOG_LOCK = threading.Lock()


def log(msg):
    with LOG_LOCK:
        print('[%s] %s' % (time.strftime('%H:%M:%S'), msg), flush=True)


def hexdump(data, prefix=''):
    for i in range(0, len(data), 16):
        chunk = data[i:i + 16]
        hexs = ' '.join('%02x' % b for b in chunk)
        text = ''.join(chr(b) if 32 <= b < 127 else '.' for b in chunk)
        log('%s%04x  %-47s  %s' % (prefix, i, hexs, text))


def read_exact(sock, n):
    buf = b''
    while len(buf) < n:
        chunk = sock.recv(n - len(buf))
        if not chunk:
            raise EOFError('closed')
        buf += chunk
    return buf


def read_varint(sock):
    value = 0
    shift = 0
    raw = b''
    while True:
        b = read_exact(sock, 1)
        raw += b
        value |= (b[0] & 0x7f) << shift
        if not (b[0] & 0x80):
            break
        shift += 7
        if shift > 35:
            raise ValueError('varint too long')
    return value, raw


def handle(conn, addr):
    log('connection from %s' % (addr,))
    try:
        ctx = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
        ctx.minimum_version = ssl.TLSVersion.TLSv1
        ctx.maximum_version = ssl.TLSVersion.TLSv1_2
        # Android 2.1 (Harmony JSSE) 只支持较老的密码套件与签名算法，
        # 这里放宽到 RSA 密钥交换 + SHA1 MAC，并降低 OpenSSL 安全等级。
        ctx.set_ciphers('AES128-SHA:AES256-SHA:DES-CBC3-SHA:@SECLEVEL=0')
        ctx.load_cert_chain(CERT, KEY)
        tls = ctx.wrap_socket(conn, server_side=True)
        log('TLS established: %s %s' % (tls.version(), tls.cipher()))
    except Exception as e:
        log('TLS failed: %r' % (e,))
        try:
            conn.close()
        except Exception:
            pass
        return

    try:
        while True:
            tag = read_exact(tls, 1)[0]
            length, rawlen = read_varint(tls)
            payload = read_exact(tls, length) if length else b''
            log('FRAME tag=%d len=%d varint=%s' % (tag, length, binascii.hexlify(rawlen).decode()))
            hexdump(payload)
    except Exception as e:
        log('connection ended: %r' % (e,))
    finally:
        try:
            tls.close()
        except Exception:
            pass


def main():
    srv = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    srv.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
    srv.bind((HOST, PORT))
    srv.listen(8)
    log('listening on %s:%d' % (HOST, PORT))
    while True:
        conn, addr = srv.accept()
        threading.Thread(target=handle, args=(conn, addr), daemon=True).start()


if __name__ == '__main__':
    main()
