package com.google.android.googleapps;

import android.content.Context;
import android.os.RemoteException;
import android.util.Log;

/**
 * IGoogleLoginService 的最小实现。
 *
 * 关键点（已通过反编译确认）：GTalkService.getAccount() 会先调用
 *   gls.peekCredentials(username, "mail")
 * 只要返回**非空**字符串，就会直接把它当作认证令牌使用，
 * 完全不会走 AccountManager。
 * 因此本应用无需注册 com.google 账户认证器，也就不会与预装的 GSF 冲突。
 */
public class PrivateLoginService extends IGoogleLoginService.Stub {

    private static final String TAG = TokenStore.TAG;
    private static final long ANDROID_ID = 0x1122334455667788L;

    private final Context mContext;

    public PrivateLoginService(Context context) {
        mContext = context;
    }

    private String username() {
        return TokenStore.configuredUsername(mContext);
    }

    public String[] getAccounts() throws RemoteException {
        String name = username();
        Log.i(TAG, "GLS.getAccounts -> " + name);
        return new String[] { name };
    }

    public String getPrimaryAccount() throws RemoteException {
        String name = username();
        Log.i(TAG, "GLS.getPrimaryAccount -> " + name);
        return name;
    }

    public String getAccount(boolean requireGoogle) throws RemoteException {
        String name = username();
        Log.i(TAG, "GLS.getAccount requireGoogle=" + requireGoogle + " -> " + name);
        return name;
    }

    /** 返回非空令牌即可让 GTalkService 跳过 AccountManager。 */
    public String peekCredentials(String username, String service) throws RemoteException {
        String token = TokenStore.tokenFor(username, service);
        Log.i(TAG, "GLS.peekCredentials user=" + username + " service=" + service
                + " -> " + token);
        return token;
    }

    public GoogleLoginCredentialsResult blockingGetCredentials(
            String username, String service, boolean requireGoogle) throws RemoteException {
        Log.i(TAG, "GLS.blockingGetCredentials user=" + username + " service=" + service);
        GoogleLoginCredentialsResult result = new GoogleLoginCredentialsResult();
        result.setAccount(username);
        result.setCredentialsString(TokenStore.tokenFor(username, service));
        return result;
    }

    public void invalidateAuthToken(String authToken) throws RemoteException {
    }

    public long getAndroidId() throws RemoteException {
        return ANDROID_ID;
    }

    public void tryNewAccount(LoginData data) throws RemoteException {
    }

    public void saveNewAccount(LoginData data) throws RemoteException {
    }

    public void saveAuthToken(String username, String service, String authToken)
            throws RemoteException {
    }

    public void updatePassword(LoginData data) throws RemoteException {
    }

    public boolean verifyStoredPassword(String username, String password) throws RemoteException {
        return true;
    }

    public void saveUsernameAndPassword(String username, String password, int flags)
            throws RemoteException {
    }

    public void deleteOneAccount(String username) throws RemoteException {
    }

    public void deleteAllAccounts() throws RemoteException {
    }

    public int waitForAndroidId() throws RemoteException {
        return 0;
    }
}
