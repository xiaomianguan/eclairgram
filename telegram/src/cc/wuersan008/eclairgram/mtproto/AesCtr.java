package cc.wuersan008.eclairgram.mtproto;

import javax.crypto.Cipher;

/**
 * AES-CTR（连续缓冲）：obfuscated2 传输层把整条 TCP 流当成一个 CTR 流加密。
 *
 * 计数器初值就是 16 字节 IV，按大端 +1 递增；每块用 AES-ECB 生成密钥流。
 * 加密与解密是同一个操作（XOR 密钥流）。
 *
 * 性能：Cipher 只在构造时初始化一次（key schedule 一次），密钥流按多块批量
 * 生成（一次 doFinal 出数百字节）。原实现每 16 字节就 getInstance + init 一次，
 * 在老设备上这几乎就是全部的网络延迟来源。
 *
 * 线程安全：Cipher 有状态，本类实例不应被多线程同时使用。传输层对
 * send/recv 各自加锁，故收发各持一个实例即可。
 */
public final class AesCtr {

    /** 每次批量生成的密钥流块数（32 × 16 = 512 字节）。 */
    private static final int BATCH_BLOCKS = 32;

    private final Cipher cipher;
    private final byte[] counter = new byte[16];
    private final byte[] keystream = new byte[BATCH_BLOCKS * 16];
    private final byte[] batch = new byte[BATCH_BLOCKS * 16];
    private int ksPos;   // 当前密钥流已消费到的位置
    private int ksLen;   // 当前密钥流的有效长度

    public AesCtr(byte[] key, byte[] iv) {
        System.arraycopy(iv, 0, counter, 0, 16);
        this.cipher = Crypto.aesEncryptor(key);
    }

    public byte[] process(byte[] data) {
        byte[] out = new byte[data.length];
        int i = 0;
        while (i < data.length) {
            if (ksPos >= ksLen) refill();
            int n = Math.min(ksLen - ksPos, data.length - i);
            for (int k = 0; k < n; k++) {
                out[i + k] = (byte) (data[i + k] ^ keystream[ksPos + k]);
            }
            ksPos += n;
            i += n;
        }
        return out;
    }

    private void refill() {
        for (int b = 0; b < BATCH_BLOCKS; b++) {
            System.arraycopy(counter, 0, batch, b * 16, 16);
            increment();
        }
        Crypto.aesBlocks(cipher, batch, 0, batch.length, keystream, 0);
        ksPos = 0;
        ksLen = batch.length;
    }

    private void increment() {
        for (int i = 15; i >= 0; i--) {
            counter[i]++;
            if (counter[i] != 0) {
                break;
            }
        }
    }
}
