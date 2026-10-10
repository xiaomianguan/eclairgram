package com.google.android.net;

import android.content.Context;

import org.apache.http.impl.client.DefaultHttpClient;

/**
 * 旧版 GSF 里的 {@code com.google.android.net.GoogleHttpClient}。
 *
 * 原版 Talk 用它做图片缓存（PictureCache）与推送注册（PushMessagingRegistrar）。
 * 合并成单一 APK 时没有打包 GSF，Android 2.2/2.3 的 Dalvik 校验器会在
 * {@code PictureCache.initialize()} 处因缺类抛
 * {@code NoClassDefFoundError}（2.1 上是延迟解析，所以碰巧没崩）。
 *
 * 这里给出一个最小可用的实现：继承框架自带的 {@link DefaultHttpClient}，
 * 补齐原类被调用的方法。它只在需要联网取头像/注册推送时才会用到，
 * 本项目的私有服务器用不到，因此不会影响任何界面。
 *
 * 与 Google Talk 的 UI 完全无关。
 */
public class GoogleHttpClient extends DefaultHttpClient {

    public GoogleHttpClient(Context context, String userAgent, boolean gzip) {
        super();
    }

    /** 原类用于按 curl 风格打印请求日志；这里留空。 */
    public void enableCurlLogging(String name, int level) {
    }

    public void disableCurlLogging() {
    }

    /** 原类会重写部分 URI；这里原样返回。 */
    public String rewriteURI(String uri) {
        return uri;
    }

    /** 关闭底层连接管理器（DefaultHttpClient 本身没有 close()）。 */
    public void close() {
        getConnectionManager().shutdown();
    }
}
