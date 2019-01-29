package com.iknow;

import java.beans.*;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.SQLException;
import java.util.HashMap;

public class category implements Serializable {
    
    public category() {
    }
    
    public HashMap<String, String> getallCategories() throws SQLException, ClassNotFoundException{
        Connection con = connectionDb.connect();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from categories");
        
        HashMap<String, String> allCategories = new HashMap<>();
        while(rs.next()){
            allCategories.put(rs.getString(1), rs.getString(2));
        }        
        con.close();
        return allCategories;        
    }
    
}