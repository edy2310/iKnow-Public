<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <%@include file="includes/head.jsp" %>
</head>

<body>
    <%  
        HttpSession loginSession = request.getSession();
        if(loginSession.getAttribute("loginID") != "edgar")
            response.sendRedirect("login.jsp");
    %>

    <%@include file="includes/navbar.jsp" %>

    <div id="wrapper">
        <ul class="sidebar navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="dashboard.jsp">
                    <i class="fas fa-plus-circle"></i>
                    <span>Add FAQ</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="categories.jsp">
                    <i class="fas fa-folder-open"></i>
                    <span>Categories</span>
                </a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="questions.jsp">
                   <i class="fas fa-database"></i>
                   <span>Manage FAQ's</span>
                </a>
            </li>
        </ul>


        <div id="content-wrapper">
            <div class="container-fluid">
                <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-pencil-alt"></i>
                            Update question
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="card">
                                        <div class="card-header">                                                
                                            <strong>Question: </strong>
                                            <%
                                                  String title = request.getParameter("title");
                                                  out.println(title);
                                                  
                                                  Connection con = com.iknow.connectionDb.connect();
                                                  Statement st = con.createStatement();
                                                  ResultSet rs = st.executeQuery("select content, questionId from questions where title='"+ title +"'");
                                                  rs.next();
                                                  String content = rs.getString(1);
                                                  String id  = rs.getString(2);
                                            %>
                                          </div>
                                        <div class="card-body">
                                            <form action="updateQuestion" method="POST">
                                                    <div class="form-group">
                                                        <label for="questionId">Id</label>
                                                        <input type="text" class="form-control" name="questionId" id="questionId" value="<%=id%>" readonly>
                                                   </div>
                                                    <div class="form-group">
                                                        <label for="questionTitle">Title:</label>
                                                        <input type="text" class="form-control" name="questionTitle" id="questionTitle" value="<%=title%>">
                                                   </div>
                                                   <div class="form-group">
                                                        <label for="questionTitle">Content:</label>
                                                         <textarea class="form-control" id="questionContent" rows="5" name="questionContent"><%=content%></textarea>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Update</button>
                                                </form> 
                                        </div>
                                    </div>
                                </div>
                                    
                                </div>
                        </div>
                </div>
            </div>
        </div>
    </div>


<%@include file="includes/scripts.jsp" %>

</body>

</html>