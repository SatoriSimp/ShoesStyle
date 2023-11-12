/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet.registration.objects;

/**
 *
 * @author Dell
 */
public class Jordan1 extends Shoes {
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
            TongueRim, 
            TongueTag, 
            Outsole;
    
    public Jordan1() {
        this.Model = "Jordan1";
        this.Name = "Jordan1";
        this.Price = 1_700_000;
    }
    
    public Jordan1(String Model, String Midsole, String Socklining, String Collar, String UpperEyestay, String Eyestay, String LowerEyestay, String Heel, String ToeBox, String Tip, String Quarter, String Swoosh, String Lace, String Tongue, String TongueRim, String TongueTag, String Outsole) {
        this.Name = "Jordan1";
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
}
