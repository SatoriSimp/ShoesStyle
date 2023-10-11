/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet.registration.account;

/**
 *
 * @author Dell
 */
public class Shoes extends Item {
    private String Model;
    private String 
            Midsole, 
            Socklining, 
            Collar, 
            UpperEyestay, 
            Eyestay, 
            LowerEyestay, 
            Heel, 
            ToeBox, 
            Tip,
            Quarter,
            Swoosh,
            Lace,
            Tongue,
            TongueRim, 
            TongueTag, 
            Outsole;
    
    public Shoes() { this.name = "Shoes"; }

    public Shoes(String Model, String Midsole, String Socklining, String Collar, String UpperEyestay, String Eyestay, String LowerEyestay, String Heel, String ToeBox, String Tip, String Quarter, String Swoosh, String Lace, String Tongue, String TongueRim, String TongueTag, String Outsole) {
        this.Model = Model;
        this.Midsole = Midsole;
        this.Socklining = Socklining;
        this.Collar = Collar;
        this.UpperEyestay = UpperEyestay;
        this.Eyestay = Eyestay;
        this.LowerEyestay = LowerEyestay;
        this.Heel = Heel;
        this.ToeBox = ToeBox;
        this.Tip = Tip;
        this.Quarter = Quarter;
        this.Swoosh = Swoosh;
        this.Lace = Lace;
        this.Tongue = Tongue;
        this.TongueRim = TongueRim;
        this.TongueTag = TongueTag;
        this.Outsole = Outsole;
    }

    public String getModel() {
        return Model;
    }

    public void setModel(String Model) {
        this.Model = Model;
    }

    public String getMidsole() {
        return Midsole;
    }

    public void setMidsole(String Midsole) {
        this.Midsole = Midsole;
    }

    public String getSocklining() {
        return Socklining;
    }

    public void setSocklining(String Socklining) {
        this.Socklining = Socklining;
    }

    public String getCollar() {
        return Collar;
    }

    public void setCollar(String Collar) {
        this.Collar = Collar;
    }

    public String getUpperEyestay() {
        return UpperEyestay;
    }

    public void setUpperEyestay(String UpperEyestay) {
        this.UpperEyestay = UpperEyestay;
    }

    public String getEyestay() {
        return Eyestay;
    }

    public void setEyestay(String Eyestay) {
        this.Eyestay = Eyestay;
    }

    public String getLowerEyestay() {
        return LowerEyestay;
    }

    public void setLowerEyestay(String LowerEyestay) {
        this.LowerEyestay = LowerEyestay;
    }

    public String getHeel() {
        return Heel;
    }

    public void setHeel(String Heel) {
        this.Heel = Heel;
    }

    public String getToeBox() {
        return ToeBox;
    }

    public void setToeBox(String ToeBox) {
        this.ToeBox = ToeBox;
    }

    public String getTip() {
        return Tip;
    }

    public void setTip(String Tip) {
        this.Tip = Tip;
    }

    public String getQuarter() {
        return Quarter;
    }

    public void setQuarter(String Quarter) {
        this.Quarter = Quarter;
    }

    public String getSwoosh() {
        return Swoosh;
    }

    public void setSwoosh(String Swoosh) {
        this.Swoosh = Swoosh;
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

    public String getTongueRim() {
        return TongueRim;
    }

    public void setTongueRim(String TongueRim) {
        this.TongueRim = TongueRim;
    }

    public String getTongueTag() {
        return TongueTag;
    }

    public void setTongueTag(String TongueTag) {
        this.TongueTag = TongueTag;
    }

    public String getOutsole() {
        return Outsole;
    }

    public void setOutsole(String Outsole) {
        this.Outsole = Outsole;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
