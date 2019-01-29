package com.iknow;

public class categoryModel{
    
    private String id;

    private String title;
    
    private String iconCode;

    public categoryModel(String id, String title, String iconCode) {
        this.id = id;
        this.title = title;
        this.iconCode = iconCode;
    }
       
    public String getIconCode() {
        return iconCode;
    }
    
    public void setIconCode(String iconCode) {
        this.iconCode = iconCode;
    }

    public String getTitle() {
        return title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }

    public String getId() {
        return id;
    }
    
    public void setId(String id) {
        this.id = id;
    }

}