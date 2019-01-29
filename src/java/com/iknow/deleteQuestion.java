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
@WebServlet(name = "deleteQuestion", urlPatterns = {"/deleteQuestion"})
public class deleteQuestion extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String title = request.getParameter("title");
            Connection con = connectionDb.connect();
            Statement st = con.createStatement();
            int resp = st.executeUpdate("delete from questions where title='"+title+"'");
            if(resp == 1)
                response.sendRedirect("questions.jsp");
            else
                response.sendRedirect("questions.jsp?err=delQue");
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(deleteQuestion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("questions.jsp");
    }
}
