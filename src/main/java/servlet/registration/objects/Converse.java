/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet.registration.objects;

/**
 *
 * @author Dell
 */
public class Converse extends Shoes {
    private String 
            Body,
            Logo,
            StarAndText,
            HeelPatch,
            Midsole,
            MidsoleLine,
            ToeCap,
            Eyeholes;

    public Converse() {
        this.Model = "Converse";
        this.Name = "Converse";
        this.Price = 1_050_000;
    }
    
    public String getBody() {
        return Body;
    }

    public void setBody(String Body) {
        this.Body = Body;
    }

    public String getLogo() {
        return Logo;
    }

    public void setLogo(String Logo) {
        this.Logo = Logo;
    }

    public String getStarAndText() {
        return StarAndText;
    }

    public void setStarAndText(String StarAndText) {
        this.StarAndText = StarAndText;
    }

    public String getHeelPatch() {
        return HeelPatch;
    }

    public void setHeelPatch(String HeelPatch) {
        this.HeelPatch = HeelPatch;
    }

    public String getMidsole() {
        return Midsole;
    }

    public void setMidsole(String Midsole) {
        this.Midsole = Midsole;
    }

    public String getMidsoleLine() {
        return MidsoleLine;
    }

    public void setMidsoleLine(String MidsoleLine) {
        this.MidsoleLine = MidsoleLine;
    }

    public String getToeCap() {
        return ToeCap;
    }

    public void setToeCap(String ToeCap) {
        this.ToeCap = ToeCap;
    }

    public String getEyeholes() {
        return Eyeholes;
    }

    public void setEyeholes(String Eyeholes) {
        this.Eyeholes = Eyeholes;
    }
}
