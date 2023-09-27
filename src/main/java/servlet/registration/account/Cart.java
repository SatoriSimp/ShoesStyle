/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet.registration.account;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dell
 */
public class Cart {
    private String strCartID, strUserID;
    private final List<Item> lstItems = new ArrayList<>();

    public String getStrCartID() {
        return strCartID;
    }

    public void setStrCartID(String strCartID) {
        this.strCartID = strCartID;
    }

    public String getStrUserID() {
        return strUserID;
    }

    public void setStrUserID(String strUserID) {
        this.strUserID = strUserID;
    }
}
