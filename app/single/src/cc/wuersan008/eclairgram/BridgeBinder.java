package cc.wuersan008.eclairgram;

import android.content.Context;
import android.os.RemoteException;
import android.util.Log;

import com.google.android.googleapps.GoogleLoginCredentialsResult;
import com.google.android.googleapps.IGoogleLoginService;
import com.google.android.googleapps.LoginData;

/**
 * IGoogleLoginService 的实现。
 *
 * GTalkService.getAccount() 会先调用 peekCredentials(username, "mail")，
 * 只要返回非空即直接当令牌使用，完全不经过 AccountManager。
 * 因此本应用不需要注册任何账户认证器。
 */
public class BridgeBinder extends IGoogleLoginService.Stub {

    private static final long ANDROID_ID = 0x1122334455667788L;
    private final Context mContext;

    public BridgeBinder(Context ctx) {
        mContext = ctx;
    }

    private String user() {
        return Config.username(mContext);
    }

    public String[] getAccounts() throws RemoteException {
        return new String[] { user() };
    }

    public String getPrimaryAccount() throws RemoteException {
        return user();
    }

    public String getAccount(boolean requireGoogle) throws RemoteException {
        Log.i(Config.TAG, "getAccount -> " + user());
        return user();
    }

    public String peekCredentials(String username, String service) throws RemoteException {
        String t = Config.token(username, service);
        Log.i(Config.TAG, "peekCredentials " + username + "/" + service + " -> " + t);
        return t;
    }

    public GoogleLoginCredentialsResult blockingGetCredentials(
            String username, String service, boolean requireGoogle) throws RemoteException {
        GoogleLoginCredentialsResult r = new GoogleLoginCredentialsResult();
        r.setAccount(username);
        r.setCredentialsString(Config.token(username, service));
        return r;
    }

    public void invalidateAuthToken(String authToken) throws RemoteException { }

    public long getAndroidId() throws RemoteException { return ANDROID_ID; }

    public void tryNewAccount(LoginData data) throws RemoteException { }

    public void saveNewAccount(LoginData data) throws RemoteException { }

    public void saveAuthToken(String u, String s, String t) throws RemoteException { }

    public void updatePassword(LoginData data) throws RemoteException { }

    public boolean verifyStoredPassword(String u, String p) throws RemoteException { return true; }

    public void saveUsernameAndPassword(String u, String p, int f) throws RemoteException { }

    public void deleteOneAccount(String username) throws RemoteException { }

    public void deleteAllAccounts() throws RemoteException { }

    public int waitForAndroidId() throws RemoteException { return 0; }
}
