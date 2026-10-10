package cc.wuersan008.eclairgram.mtproto;

/**
 * AES-CTR（连续缓冲）：obfuscated2 传输层把整条 TCP 流当成一个 CTR 流加密。
 *
 * 计数器初值就是 16 字节 IV，按大端 +1 递增；每块用 AES-ECB 生成密钥流。
 * 加密与解密是同一个操作（XOR 密钥流）。
 */
public final class AesCtr {

    private final byte[] key;
    private final byte[] counter = new byte[16];
    private byte[] keystream = new byte[0];
    private int ksPos;

    public AesCtr(byte[] key, byte[] iv) {
        this.key = key;
        System.arraycopy(iv, 0, counter, 0, 16);
    }

    public byte[] process(byte[] data) {
        byte[] out = new byte[data.length];
        for (int i = 0; i < data.length; i++) {
            if (ksPos >= keystream.length) {
                keystream = new byte[16];
                Crypto.aesEncryptBlock(key, counter, 0, keystream, 0);
                ksPos = 0;
                increment();
            }
            out[i] = (byte) (data[i] ^ keystream[ksPos++]);
        }
        return out;
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
