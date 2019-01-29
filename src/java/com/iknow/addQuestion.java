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

@WebServlet(name = "addQuestion", urlPatterns = {"/addQuestion"})
public class addQuestion extends HttpServlet {
        
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("dashboard.jsp");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String title = request.getParameter("title");
            String content = request.getParameter("content");
            int categoryId = Integer.parseInt(request.getParameter("categoryId"));
            
            Connection con = connectionDb.connect();
            Statement st = con.createStatement();
            int resp = st.executeUpdate("insert into questions(title, content, categoryId) values('"+title+"', '"+content+"', '"+categoryId+"')");
            if(resp != 1)
                response.sendRedirect("dashboard?err=addQuestion");
            else
                response.sendRedirect("dashboard.jsp");
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(addQuestion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}