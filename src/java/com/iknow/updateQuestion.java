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

@WebServlet(name = "updateQuestion", urlPatterns = {"/updateQuestion"})
public class updateQuestion extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("questions.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id = request.getParameter("questionId");
            String title = request.getParameter("questionTitle");
            String content = request.getParameter("questionContent");
            
            Connection con = connectionDb.connect();
            Statement st = con.createStatement();
            int resp = st.executeUpdate("update questions set title='"+title+"', content='"+content+"' where questionId='"+id+"'");
            if(resp == 1)
                response.sendRedirect("questions.jsp");
            else
                response.sendRedirect("questions.jsp?err=updQue");
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(updateQuestion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
