package com.iknow;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.*;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "getCategories", urlPatterns = {"/getCategories"})
public class getCategories extends HttpServlet {
    
    private Gson gson = new Gson();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.sendRedirect("/");
        try {
            Connection con = connectionDb.connect();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from categories order by name ASC");

            Map<String, String> categoryMap = new HashMap<>();
          
          while(rs.next()){
              String title = rs.getString(2);
              String iconCode = rs.getString(3);              
              categoryMap.put(title, iconCode);
          }

          con.close();
          String categoryToJson = this.gson.toJson(categoryMap);

            PrintWriter out = response.getWriter();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            out.print(categoryToJson);
            out.flush();
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(getQuestions.class.getName()).log(Level.SEVERE, null, ex);
        }        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection con = connectionDb.connect();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from categories");

            Map<String, String> categoryMap = new HashMap<>();
          
          while(rs.next()){
              String title = rs.getString(2);
              String iconCode = rs.getString(3);              
              categoryMap.put(title, iconCode);
          }

          con.close();
          String categoryToJson = this.gson.toJson(categoryMap);

            PrintWriter out = response.getWriter();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            out.print(categoryToJson);
            out.flush();
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(getQuestions.class.getName()).log(Level.SEVERE, null, ex);
        }        
    }

}