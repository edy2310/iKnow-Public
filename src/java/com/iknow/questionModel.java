package com.iknow;

public class questionModel {
    
    private String questionId;
    
    private String title;
    
    private String content;
    
    private String categoryId;
    
    private String categoryName;
    
    private String iconCode;

    public questionModel(String questionId, String title, String content, String categoryId, String categoryName, String iconCode) {
        this.questionId = questionId;
        this.title = title;
        this.content = content;
        this.categoryId = categoryId;
        this.categoryName = categoryName;
        this.iconCode = iconCode;
    }

    public String getIconCode() {
        return iconCode;
    }

    public void setIconCode(String iconCode) {
        this.iconCode = iconCode;
    }  
    
    public String getCategoryName() {
        return categoryName;
    }
    
    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryId() {
        return categoryId;
    }
    
    public void setCategoryId(String categoryId) {
        this.categoryId = categoryId;
    }
    
    public String getContent() {
        return content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }
    
    public String getTitle() {
        return title;
    }
        
    public void setTitle(String title) {
        this.title = title;
    }

    public String getQuestionId() {
        return questionId;
    }
    
    public void setQuestionId(String questionId) {
        this.questionId = questionId;
    }

}
