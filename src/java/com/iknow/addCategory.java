package com.iknow;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "addCategory", urlPatterns = {"/addCategory"})
public class addCategory extends HttpServlet {
        
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("categories.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        try {
            String nameCategory = request.getParameter("categoryName");
            String iconCode = request.getParameter("iconCode");

            Connection con  = connectionDb.connect();
            Statement st = con.createStatement();
            int resp = st.executeUpdate("insert into categories(name, iconCode) values('" + nameCategory +"', '"+ iconCode +"')");
            if(resp == 1){
                con.close();
                response.sendRedirect("categories.jsp");
            }                
            else{
                con.close();
                response.sendRedirect("categories.jsp?err=add");
            }                
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(addCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
