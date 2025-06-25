/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.uef.model;

/**
 *
 * @author ADMIN
 */
public class Volunteer {
    private int id;
    private String name;
    private String role;
    private String imageUrl;
    private String facebookUrl;
    private String pinterestUrl;
    private String linkedinUrl;
    private String twitterUrl;

    public Volunteer(int id, String name, String role, String imageUrl, String facebookUrl, String pinterestUrl, String linkedinUrl, String twitterUrl) {
        this.id = id;
        this.name = name;
        this.role = role;
        this.imageUrl = imageUrl;
        this.facebookUrl = facebookUrl;
        this.pinterestUrl = pinterestUrl;
        this.linkedinUrl = linkedinUrl;
        this.twitterUrl = twitterUrl;
    }
    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getFacebookUrl() {
        return facebookUrl;
    }

    public void setFacebookUrl(String facebookUrl) {
        this.facebookUrl = facebookUrl;
    }

    public String getPinterestUrl() {
        return pinterestUrl;
    }

    public void setPinterestUrl(String pinterestUrl) {
        this.pinterestUrl = pinterestUrl;
    }

    public String getLinkedinUrl() {
        return linkedinUrl;
    }

    public void setLinkedinUrl(String linkedinUrl) {
        this.linkedinUrl = linkedinUrl;
    }

    public String getTwitterUrl() {
        return twitterUrl;
    }

    public void setTwitterUrl(String twitterUrl) {
        this.twitterUrl = twitterUrl;
    }
}
