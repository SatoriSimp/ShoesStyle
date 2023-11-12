/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package servlet.registration.objects;

import java.util.List;

/**
 *
 * @author VanHieu
 */
public class Article {
    private String articleID;
    private String title;
    private String discrip;
    private String link;
    private String image;
    private String releaseDate;

    public Article() {
    }

    public Article(String articleID, String title, String discrip, String link, String image, String releaseDate) {
        this.articleID = articleID;
        this.title = title;
        this.discrip = discrip;
        this.link = link;
        this.image = image;
        this.releaseDate = releaseDate;
    }

    public String getArticleID() {
        return articleID;
    }

    public void setArticleID(String articleID) {
        this.articleID = articleID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDiscrip() {
        return discrip;
    }

    public void setDiscrip(String discrip) {
        this.discrip = discrip;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }
    


    
}
