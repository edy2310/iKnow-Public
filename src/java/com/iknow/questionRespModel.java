package com.iknow;

public class questionRespModel {
    
    private String questionTitle ;
    private String questionContent;
    private String categoryName;
    private String categoryIcon;

    public questionRespModel(String questionTitle, String questionContent, String categoryName, String categoryIcon) {
        this.questionTitle = questionTitle;
        this.questionContent = questionContent;
        this.categoryName = categoryName;
        this.categoryIcon = categoryIcon;
    }
    
    public String getQuestionTitle() {
        return questionTitle;
    }

    public void setQuestionTitle(String questionTitle) {
        this.questionTitle = questionTitle;
    }

    public String getQuestionContent() {
        return questionContent;
    }

    public void setQuestionContent(String questionContent) {
        this.questionContent = questionContent;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryIcon() {
        return categoryIcon;
    }

    public void setCategoryIcon(String categoryIcon) {
        this.categoryIcon = categoryIcon;
    }
    
    
    
}
