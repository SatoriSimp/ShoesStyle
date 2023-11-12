/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet.utility;
import java.io.Serializable;

/**
 *
 * @author Admin
 */
public class RegistrationDTO implements Serializable{
    
    private String email;
    private String password;   
    private String phone;
    private String address;

    public RegistrationDTO() {
    }

    public RegistrationDTO(String email, String password, String phone, String address) {
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
}