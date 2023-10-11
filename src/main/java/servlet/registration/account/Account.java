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
    private String strUsername, strPassword;
    private Cart UserCart;

    public Account(String strUsername, String strPassword, String strUserID, Cart UserCart) {
        this.strUsername = strUsername;
        this.strPassword = strPassword;
        this.UserCart = UserCart;
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

    public Cart getUserCart() {
        return UserCart;
    }

    public void setUserCart(Cart UserCart) {
        this.UserCart = UserCart;
    }
}
