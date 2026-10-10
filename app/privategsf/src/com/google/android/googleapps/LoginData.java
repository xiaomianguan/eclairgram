package com.google.android.googleapps;

import android.os.Parcel;
import android.os.Parcelable;

/**
 * GoogleLoginService 的登录数据对象。
 * 仅实现 AIDL 所需的 Parcelable 形态。
 */
public class LoginData implements Parcelable {

    public String mUsername;
    public String mEncryptedPassword;
    public String mPassword;
    public String mService;
    public String mCaptchaToken;
    public byte[] mCaptchaData;
    public String mCaptchaMimeType;
    public String mCaptchaAnswer;
    public int mFlags;
    public String mJsonString;
    public String mSid;
    public String mAuthtoken;

    public LoginData() {
    }

    private LoginData(Parcel in) {
        mUsername = in.readString();
        mEncryptedPassword = in.readString();
        mPassword = in.readString();
        mService = in.readString();
        mCaptchaToken = in.readString();
        in.readInt();
        mCaptchaMimeType = in.readString();
        mCaptchaAnswer = in.readString();
        mFlags = in.readInt();
        in.readString();
        mJsonString = in.readString();
        mSid = in.readString();
        mAuthtoken = in.readString();
        in.readInt();
        mCaptchaData = in.createByteArray();
        in.readString();
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel out, int flags) {
        out.writeString(mUsername);
        out.writeString(mEncryptedPassword);
        out.writeString(mPassword);
        out.writeString(mService);
        out.writeString(mCaptchaToken);
        out.writeInt(mCaptchaData == null ? 0 : mCaptchaData.length);
        out.writeString(mCaptchaMimeType);
        out.writeString(mCaptchaAnswer);
        out.writeInt(mFlags);
        out.writeString(null);
        out.writeString(mJsonString);
        out.writeString(mSid);
        out.writeString(mAuthtoken);
        out.writeInt(mCaptchaData == null ? 0 : mCaptchaData.length);
        out.writeByteArray(mCaptchaData);
        out.writeString(null);
    }

    public static final Parcelable.Creator<LoginData> CREATOR =
            new Parcelable.Creator<LoginData>() {
                public LoginData createFromParcel(Parcel in) {
                    return new LoginData(in);
                }

                public LoginData[] newArray(int size) {
                    return new LoginData[size];
                }
            };
}
