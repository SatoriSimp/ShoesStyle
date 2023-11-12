/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet.registration.objects;

import java.util.HashMap;

/**
 *
 * @author Dell
 */
public class Cart {
    private String strCartID, strUserID;
    private String status;
    private final HashMap<Shoes, Integer> lstItems = new HashMap<>();

    public Cart() {
        status = "Not requested";
    }
    
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public void addItem(Shoes i) {
        lstItems.put(i, 1);
    }
    
    public void addItem(Shoes i, int quan) {
        lstItems.put(i, quan);
    }
    
    public int getQuantity() {
        int quant = 0;
        for (HashMap.Entry<Shoes, Integer> k : lstItems.entrySet()) {
            quant += k.getValue();
        }
        return quant;
    }
    
    public int getQuantityOf(Shoes s) {
        if (!lstItems.containsKey(s)) return 0;
        return lstItems.get(s);
    }    
    
    public long getTotalPrice() {
        long quant = 0;
        for (HashMap.Entry<Shoes, Integer> k : lstItems.entrySet()) {
            quant += k.getKey().getPrice() * k.getValue();
        }
        return quant;
    }
    
    public HashMap<Shoes, Integer> getItemList() {
        return lstItems;
    }
}
