/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet.registration.objects;

import java.util.ArrayList;

/**
 *
 * @author Dell
 */
public class Account {
    private String strUsername, strPassword;
    private String strPhonenumber, strAddress;
    private String role;
    private final ArrayList<Order> UserOrders = new ArrayList<>();
    private Cart UserCart;

    public Account(String strUsername, String strPassword, String strPhone, String strAddress, String role) {
        this.strUsername = strUsername;
        this.strPassword = strPassword;
        this.strPhonenumber = strPhone;
        this.strAddress = strAddress;
        this.role = role;
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

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    public Cart getUserCart() {
        return UserCart;
    }
    
    public void setUserCart(Cart UserCart) {
        this.UserCart = UserCart;
    }
    
    public void addToOrder(Order UserCart) {
        if (!UserOrders.contains(UserCart)) this.UserOrders.add(UserCart);
    }

    public ArrayList<Order> getUserOrders() {
        return UserOrders;
    }

    public String getStrPhonenumber() {
        return strPhonenumber;
    }

    public void setStrPhonenumber(String strPhonenumber) {
        this.strPhonenumber = strPhonenumber;
    }

    public String getStrAddress() {
        return strAddress;
    }

    public void setStrAddress(String strAddress) {
        this.strAddress = strAddress;
    }
}
