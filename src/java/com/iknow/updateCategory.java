package com.iknow;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet(name = "updateCategory", urlPatterns = {"/updateCategory"})
public class updateCategory extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("categories.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String newNameCategory = request.getParameter("newCategoryName");
            String currentName = request.getParameter("categoryName");
            String newIconCode = request.getParameter("newIconCode");
            
            Connection con = connectionDb.connect();
            Statement st = con.createStatement();
            int resp = st.executeUpdate("update categories set name='"+newNameCategory+"', iconCode='"+newIconCode+"' where name='"+currentName+"'");
            con.close();
            if(resp == 1)
                response.sendRedirect("categories.jsp");
            else
                response.sendRedirect("categories.jsp?err=update");
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(updateCategory.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
