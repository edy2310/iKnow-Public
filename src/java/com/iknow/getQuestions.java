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

@WebServlet(name = "getQuestions", urlPatterns = {"/getQuestions"})
public class getQuestions extends HttpServlet {
    
    private Gson gson = new Gson();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("/");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            String reqCategory = request.getParameter("category");
            Map<String, Object> questionsFinal = new HashMap<>();
            
            Connection con = connectionDb.connect();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from questions q left join categories c on q.categoryId = c.id where c.name='"+reqCategory+"'");
            while(rs.next()){
                String questionId = rs.getString(1);
                String title = rs.getString(2);
                String content = rs.getString(3);
                String categoryId = rs.getString(4);
                String categoryName = rs.getString(6);
                String iconCode = rs.getString(7);
                
                questionModel question = new questionModel(questionId, title, content, categoryId, categoryName, iconCode);
                questionsFinal.put(title, question);
            }           

            String finalJson = this.gson.toJson(questionsFinal);
            
            PrintWriter out = response.getWriter();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            out.print(finalJson);
            out.flush();
            
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(getQuestions.class.getName()).log(Level.SEVERE, null, ex);
        }        
    }

}