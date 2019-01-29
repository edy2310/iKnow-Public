package com.iknow;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "getQuestion", urlPatterns = {"/getQuestion"})
public class getQuestion extends HttpServlet {
    
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
            String questionReq = request.getParameter("questionReq");
            List<String>  finalList= new ArrayList<>();
                    
            Connection con = connectionDb.connect();
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("select * from questions q left join categories c on q.categoryId = c.id where q.questionId=' "+questionReq+" ' ");            
            rs.next();
            
            String questionTitle = rs.getString(2);
            String questionContent = rs.getString(3);
            String categoryName = rs.getString(6);
            String categoryIcon = rs.getString(7);
                
            questionRespModel questionModel = new questionRespModel(questionTitle, questionContent, categoryName, categoryIcon);
             String finalJson = gson.toJson(questionModel);
            finalList.add(finalJson);
           
            PrintWriter out = response.getWriter();
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            out.print(finalJson);
            out.flush();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(getQuestion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
