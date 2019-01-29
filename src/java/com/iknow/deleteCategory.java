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

@WebServlet(name = "deleteCategory", urlPatterns = {"/deleteCategory"})
public class deleteCategory extends HttpServlet {
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("categories.jsp");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String nameCategory = request.getParameter("name");
            if(nameCategory == null)
                response.sendRedirect("categories.jsp");
            Connection con = connectionDb.connect();
            Statement st = con.createStatement();
            int resp = st.executeUpdate("delete from categories where name='"+ nameCategory +"'");
            con.close();
            if(resp == 1)
                response.sendRedirect("categories.jsp");
            else
                response.sendRedirect("categories.jsp?err=delete");
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(deleteCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
