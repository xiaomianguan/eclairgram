/* Eclairgram JNI wrapper around libwebp's decoder.
 * Decodes a WebP image to an int[] of ARGB colors, prefixed with width/height:
 *   result[0]=width, result[1]=height, result[2..]=ARGB pixels (row-major).
 * Returns null on failure. Works on ARMv6 (armeabi) where Android has no WebP. */
#include <jni.h>
#include <stdlib.h>
#include "webp/decode.h"

JNIEXPORT jintArray JNICALL
Java_cc_wuersan008_eclairgram_WebpNative_decodeRgba(JNIEnv* env, jclass clazz, jbyteArray data) {
    if (data == NULL) return NULL;
    jsize len = (*env)->GetArrayLength(env, data);
    jbyte* buf = (*env)->GetByteArrayElements(env, data, NULL);
    if (buf == NULL) return NULL;

    int w = 0, h = 0;
    uint8_t* rgba = WebPDecodeRGBA((const uint8_t*) buf, (size_t) len, &w, &h);
    (*env)->ReleaseByteArrayElements(env, data, buf, JNI_ABORT);
    if (rgba == NULL || w <= 0 || h <= 0) return NULL;

    long n = (long) w * (long) h;
    jintArray out = (*env)->NewIntArray(env, (jsize) (n + 2));
    if (out == NULL) { WebPFree(rgba); return NULL; }
    jint* arr = (*env)->GetIntArrayElements(env, out, NULL);
    if (arr == NULL) { WebPFree(rgba); return NULL; }
    arr[0] = w;
    arr[1] = h;
    for (long i = 0; i < n; i++) {
        uint8_t r = rgba[i * 4 + 0];
        uint8_t g = rgba[i * 4 + 1];
        uint8_t b = rgba[i * 4 + 2];
        uint8_t a = rgba[i * 4 + 3];
        arr[2 + i] = (jint) ((a << 24) | (r << 16) | (g << 8) | b);
    }
    (*env)->ReleaseIntArrayElements(env, out, arr, 0);
    WebPFree(rgba);
    return out;
}

/* Cheap capability probe: returns 1 if libwebp is present and working. */
JNIEXPORT jint JNICALL
Java_cc_wuersan008_eclairgram_WebpNative_version(JNIEnv* env, jclass clazz) {
    return (jint) WebPGetDecoderVersion();
}

/* bionic doesn't export the unsigned float->int helper; provide it via the
 * signed one (which bionic does export) to avoid a missing symbol at load. */
unsigned int __aeabi_f2uiz(float f) {
    if (f <= 0.0f) return 0u;
    if (f >= 4294967295.0f) return 0xFFFFFFFFu;
    if (f < 2147483648.0f) return (unsigned int) (int) f;
    return 0x80000000u + (unsigned int) (int) (f - 2147483648.0f);
}
