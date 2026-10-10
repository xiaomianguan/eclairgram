#!/bin/bash
# 私有 MTalk/XMPP 服务器启停脚本。
# 用法:
#   server.sh start [额外参数...]     启动（默认开启控制文件）
#   server.sh stop | restart | log [n]
#   server.sh cmd '<json>'            向控制文件追加一条命令
#   server.sh chat <jid> <文本>       让某好友发一条消息（截聊天界面用）
#   server.sh presence <jid> on|off [状态文本]
#   server.sh roster                  重新下发花名册
source "$(dirname "$0")/env.sh"
PIDFILE=$WORKSPACE/logs/server.pid
LOG=$WORKSPACE/logs/server.log
CONTROL=$WORKSPACE/logs/server_control.jsonl

stop_server() {
  if [ -f "$PIDFILE" ]; then
    kill -9 "$(cat $PIDFILE)" 2>/dev/null
    rm -f "$PIDFILE"
    echo stopped
  else
    echo 'not running'
  fi
}

case "$1" in
  start)
    shift || true
    if [ -f "$PIDFILE" ] && kill -0 "$(cat $PIDFILE)" 2>/dev/null; then
      echo "already running pid=$(cat $PIDFILE)"; exit 0
    fi
    mkdir -p "$WORKSPACE/logs"
    # 若调用方没有自带 --control，则补一个默认控制文件
    has_control=0
    for a in "$@"; do [ "$a" = "--control" ] && has_control=1; done
    if [ "$has_control" = "0" ]; then
      set -- "$@" --control "$CONTROL"
    fi
    # 默认走明文（与交付 APK 一致）；显式传 --cert/--key 时才用 TLS
    has_plain=0; has_cert=0
    for a in "$@"; do
      [ "$a" = "--plain" ] && has_plain=1
      [ "$a" = "--cert" ] && has_cert=1
    done
    if [ "$has_plain" = "0" ] && [ "$has_cert" = "0" ]; then
      set -- "$@" --plain
    fi
    # macOS 没有 setsid；退回普通后台进程即可（nohup 已能脱离终端）
    if command -v setsid >/dev/null 2>&1; then
      setsid nohup python3 "$WORKSPACE/server/mtalk_server.py" "$@" > "$LOG" 2>&1 < /dev/null &
    else
      nohup python3 "$WORKSPACE/server/mtalk_server.py" "$@" > "$LOG" 2>&1 < /dev/null &
    fi
    echo $! > "$PIDFILE"
    sleep 1
    echo "started pid=$(cat $PIDFILE) log=$LOG control=$CONTROL"
    ;;
  stop) stop_server ;;
  restart) stop_server; sleep 1; shift || true; "$0" start "$@" ;;
  log) tail -n "${2:-50}" "$LOG" ;;
  cmd)
    shift
    [ -z "$1" ] && { echo "usage: $0 cmd '<json>'"; exit 1; }
    echo "$*" >> "$CONTROL"
    echo "queued: $*"
    ;;
  chat)
    [ -z "$2" ] && { echo "usage: $0 chat <jid> <text>"; exit 1; }
    python3 - "$2" "$3" >> "$CONTROL" <<'PY'
import json, sys
print(json.dumps({"cmd": "chat", "from": sys.argv[1], "text": sys.argv[2]},
                 ensure_ascii=False))
PY
    echo "queued chat from=$2"
    ;;
  presence)
    [ -z "$2" ] && { echo "usage: $0 presence <jid> on|off [status]"; exit 1; }
    python3 - "$2" "$3" "$4" >> "$CONTROL" <<'PY'
import json, sys
online = (sys.argv[2] == "on")
cmd = {"cmd": "presence", "jid": sys.argv[1], "online": online}
if len(sys.argv) > 3 and sys.argv[3]:
    cmd["status"] = sys.argv[3]
print(json.dumps(cmd, ensure_ascii=False))
PY
    echo "queued presence $2 $3"
    ;;
  roster) echo '{"cmd": "roster"}' >> "$CONTROL"; echo queued ;;
  batch)  echo '{"cmd": "batch"}'  >> "$CONTROL"; echo queued ;;
  ping)   echo '{"cmd": "ping"}'   >> "$CONTROL"; echo queued ;;
  *) echo "usage: $0 {start [args]|stop|restart|log [n]|cmd|chat|presence|roster|batch|ping}" ;;
esac
