/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet.utility;

/**
 *
 * @author Admin
 */
public class RegistrationInsertError {
    private String email;
    private String passwordLengErr;
    private String confirmNotMatch;
    private String  phoneLengErr;
    private String address;
    private String userIsExisted;

    public RegistrationInsertError() {
    }

    public RegistrationInsertError(String email, String passwordLengErr, String confirmNotMatch, String phoneLengErr, String address, String userIsExisted) {
        this.email = email;
        this.passwordLengErr = passwordLengErr;
        this.confirmNotMatch = confirmNotMatch;
        this.phoneLengErr = phoneLengErr;
        this.address = address;
        this.userIsExisted = userIsExisted;
    }
    
    public String getEmail(){
        return email;
    }
    
    public void setEmail(String email){
        this.email = email;
    }

    public String getPasswordLengErr() {
        return passwordLengErr;
    }

    public void setPasswordLengErr(String passwordLengErr) {
        this.passwordLengErr = passwordLengErr;
    }

    public String getConfirmNotMatch() {
        return confirmNotMatch;
    }

    public void setConfirmNotMatch(String confirmNotMatch) {
        this.confirmNotMatch = confirmNotMatch;
    }

    public String getPhoneLengErr() {
        return phoneLengErr;
    }

    public void setPhoneLengErr(String phoneLengErr) {
        this.phoneLengErr = phoneLengErr;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUserIsExisted() {
        return userIsExisted;
    }

    public void setUserIsExisted(String userIsExisted) {
        this.userIsExisted = userIsExisted;
    }
}
