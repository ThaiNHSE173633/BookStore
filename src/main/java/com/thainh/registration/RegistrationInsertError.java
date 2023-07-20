package com.thainh.registration;

import java.io.Serializable;

public class RegistrationInsertError implements Serializable {

    private String usernameLengthErr;
    private String passwordLengthErr;
    private String confirmNotMatch;
    private String fullnameLengthErr;
    private String usernameIsExisted;

    public RegistrationInsertError() {
    }

    public RegistrationInsertError(String usernameLengthErr, String passwordLengthErr, String confirmNotMatch, String fullnameLengthErr, String usernameIsExisted) {
        this.usernameLengthErr = usernameLengthErr;
        this.passwordLengthErr = passwordLengthErr;
        this.confirmNotMatch = confirmNotMatch;
        this.fullnameLengthErr = fullnameLengthErr;
        this.usernameIsExisted = usernameIsExisted;
    }

    public String getUsernameLengthErr() {
        return usernameLengthErr;
    }

    public void setUsernameLengthErr(String usernameLengthErr) {
        this.usernameLengthErr = usernameLengthErr;
    }

    public String getPasswordLengthErr() {
        return passwordLengthErr;
    }

    public void setPasswordLengthErr(String passwordLengthErr) {
        this.passwordLengthErr = passwordLengthErr;
    }

    public String getConfirmNotMatch() {
        return confirmNotMatch;
    }

    public void setConfirmNotMatch(String confirmNotMatch) {
        this.confirmNotMatch = confirmNotMatch;
    }

    public String getFullnameLengthErr() {
        return fullnameLengthErr;
    }

    public void setFullnameLengthErr(String fullnameLengthErr) {
        this.fullnameLengthErr = fullnameLengthErr;
    }

    public String getUsernameIsExisted() {
        return usernameIsExisted;
    }

    public void setUsernameIsExisted(String usernameIsExisted) {
        this.usernameIsExisted = usernameIsExisted;
    }

}
