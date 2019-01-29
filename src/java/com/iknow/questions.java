package com.iknow;

import java.beans.*;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;

public class questions implements Serializable {
    private Map<String, HashMap<String, String>> categoryQuestion= new HashMap<>();
        
    public questions() {
    }
    
    public Map<String, HashMap<String, String>> getQuestions(){
        try {
            Connection con = connectionDb.connect();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from questions");            
            
            while(rs.next()){
                String title = rs.getString(2);
                String content = rs.getString(3);
                
                HashMap<String, String> question = new HashMap<>();
                question.put(title, content);
                
                categoryQuestion.put(rs.getString(4), (HashMap<String, String>) question);
            }
            con.close();
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(questions.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categoryQuestion;
    }
    
}
