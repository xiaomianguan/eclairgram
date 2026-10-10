package com.google.android.googleapps;

import android.os.Parcel;
import android.os.Parcelable;

/**
 * GoogleLoginService 的凭据返回对象。
 * 这里只保留 AIDL 需要的可序列化形态，用于满足 GTalkService 的绑定调用。
 */
public class GoogleLoginCredentialsResult implements Parcelable {

    private String mAccount;
    private String mCredentialsString;
    private android.content.Intent mCredentialsIntent;

    public GoogleLoginCredentialsResult() {
    }

    private GoogleLoginCredentialsResult(Parcel in) {
        mAccount = in.readString();
        mCredentialsString = in.readString();
        if (in.readInt() != 0) {
            mCredentialsIntent = android.content.Intent.CREATOR.createFromParcel(in);
        }
        in.readInt();
    }

    public String getAccount() {
        return mAccount;
    }

    public void setAccount(String account) {
        mAccount = account;
    }

    public String getCredentialsString() {
        return mCredentialsString;
    }

    public void setCredentialsString(String value) {
        mCredentialsString = value;
    }

    public android.content.Intent getCredentialsIntent() {
        return mCredentialsIntent;
    }

    public void setCredentialsIntent(android.content.Intent intent) {
        mCredentialsIntent = intent;
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel out, int flags) {
        out.writeString(mAccount);
        out.writeString(mCredentialsString);
        if (mCredentialsIntent == null) {
            out.writeInt(0);
        } else {
            out.writeInt(1);
            mCredentialsIntent.writeToParcel(out, 0);
        }
        out.writeInt(0);
    }

    public static final Parcelable.Creator<GoogleLoginCredentialsResult> CREATOR =
            new Parcelable.Creator<GoogleLoginCredentialsResult>() {
                public GoogleLoginCredentialsResult createFromParcel(Parcel in) {
                    return new GoogleLoginCredentialsResult(in);
                }

                public GoogleLoginCredentialsResult[] newArray(int size) {
                    return new GoogleLoginCredentialsResult[size];
                }
            };
}
