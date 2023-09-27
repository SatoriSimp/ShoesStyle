/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet.registration.account;

/**
 *
 * @author Dell
 */
public class Account {
    private String strUsername, strPassword, strUserID;
    private Cart UserCartID;

    public Account(String strUsername, String strPassword, String strUserID, Cart UserCartID) {
        this.strUsername = strUsername;
        this.strPassword = strPassword;
        this.strUserID = strUserID;
        this.UserCartID = UserCartID;
    }
    
    public Account() {}
    
    public String getStrUsername() {
        return strUsername;
    }

    public void setStrUsername(String strUsername) {
        this.strUsername = strUsername;
    }

    public String getStrPassword() {
        return strPassword;
    }

    public void setStrPassword(String strPassword) {
        this.strPassword = strPassword;
    }

    public String getStrUserID() {
        return strUserID;
    }

    public void setStrUserID(String strUserID) {
        this.strUserID = strUserID;
    }

    public Cart getUserCartID() {
        return UserCartID;
    }

    public void setUserCartID(Cart UserCartID) {
        this.UserCartID = UserCartID;
    }
}
