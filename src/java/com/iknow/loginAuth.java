package com.iknow;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class loginAuth implements Serializable{    
    private String user;
    private String password;
    
    public loginAuth() {
    }
    
    public String getUser() {
        return user;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setUser(String user) {
        this.user = user;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public boolean authLogin() throws SQLException, ClassNotFoundException{
        Connection con = connectionDb.connect();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from admins where user='"+ this.user +"' and password ='"+ this.password + "'");
        if(rs.first()){
            con.close();
            return true;
        }
        else{
            con.close();
            return false;
        }
    }
    
}
