package com.google.android.googleapps;

import com.google.android.googleapps.LoginData;
import com.google.android.googleapps.GoogleLoginCredentialsResult;

interface IGoogleLoginService {
    String[] getAccounts();
    String getPrimaryAccount();
    String getAccount(boolean requireGoogle);
    String peekCredentials(String username, String service);
    GoogleLoginCredentialsResult blockingGetCredentials(String username, String service, boolean requireGoogle);
    void invalidateAuthToken(String authToken);
    long getAndroidId();
    void tryNewAccount(in LoginData data);
    void saveNewAccount(in LoginData data);
    void saveAuthToken(String username, String service, String authToken);
    void updatePassword(in LoginData data);
    boolean verifyStoredPassword(String username, String password);
    void saveUsernameAndPassword(String username, String password, int flags);
    void deleteOneAccount(String username);
    void deleteAllAccounts();
    int waitForAndroidId();
}
