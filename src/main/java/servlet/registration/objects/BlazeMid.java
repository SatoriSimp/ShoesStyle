/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet.registration.objects;

/**
 *
 * @author Dell
 */
public class BlazeMid extends Shoes {
    private String 
            Body,
            Swoosh,
            Suade,
            Heel,
            ToeBox,
            Eyestay,
            Socklining,
            TongueTag,
            TongueRim,
            Midsole;

    public BlazeMid() {
        this.Model = "Blazer Mid";
        this.Name = "Blazer Mid";
        this.Price = 2_350_000;
    }
    
    public String getBody() {
        return Body;
    }

    public void setBody(String Body) {
        this.Body = Body;
    }

    public String getSwoosh() {
        return Swoosh;
    }

    public void setSwoosh(String Swoosh) {
        this.Swoosh = Swoosh;
    }

    public String getSuade() {
        return Suade;
    }

    public void setSuade(String Suade) {
        this.Suade = Suade;
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

    public String getEyestay() {
        return Eyestay;
    }

    public void setEyestay(String Eyestay) {
        this.Eyestay = Eyestay;
    }

    public String getSocklining() {
        return Socklining;
    }

    public void setSocklining(String Socklining) {
        this.Socklining = Socklining;
    }

    public String getTongueTag() {
        return TongueTag;
    }

    public void setTongueTag(String TongueTag) {
        this.TongueTag = TongueTag;
    }

    public String getTongueRim() {
        return TongueRim;
    }

    public void setTongueRim(String TongueRim) {
        this.TongueRim = TongueRim;
    }

    public String getMidsole() {
        return Midsole;
    }

    public void setMidsole(String Midsole) {
        this.Midsole = Midsole;
    }
}
