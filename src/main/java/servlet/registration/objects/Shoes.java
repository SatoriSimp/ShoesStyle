/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet.registration.objects;

/**
 *
 * @author Dell
 */
public class Shoes {
    protected String Name;
    protected String Model;
    protected String ID;
    protected String Size;
    protected int Price;
    protected String Material;
    protected String Lace, Tongue;

    public String getMaterial() {
        return Material;
    }

    public void setMaterial(String Material) {
        this.Material = Material;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }
    
    public String getModel() {
        return Model;
    }

    public void setModel(String Model) {
        this.Model = Model;
    }

    public String getSize() {
        return this.Size;
    }

    public void setSize(String Size) {
        this.Size = Size;
    }
    
    public String getLace() {
        return Lace;
    }

    public void setLace(String Lace) {
        this.Lace = Lace;
    }

    public String getTongue() {
        return Tongue;
    }

    public void setTongue(String Tongue) {
        this.Tongue = Tongue;
    }
    
    public String getID() {
        return this.ID;
    }
    
    public void setID(String ID) {
        this.ID = ID;
    }
}
