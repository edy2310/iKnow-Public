<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.iknow.connectionDb"%>
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
            <li class="nav-item active">
                <a class="nav-link" href="categories.jsp">
                    <i class="fas fa-folder-open"></i>
                    <span>Categories</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="questions.jsp">
                   <i class="fas fa-database"></i>
                   <span>Manage FAQ's</span>
                </a>
            </li>
        </ul>

        <jsp:useBean id="allCategories" scope="session" class="com.iknow.category"></jsp:useBean>

        <div id="content-wrapper">
            <div class="container-fluid">
                <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-pencil-alt"></i>
                            Update category
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12 col-md-6">
                                    <div class="card">
                                        <div class="card-header">                                                
                                            <strong>Category: </strong>
                                            <%
                                                String nameToUpdate = request.getParameter("name");
                                                String iconCode = request.getParameter("iconCode");
                                                Connection con = connectionDb.connect();
                                                Statement st = con.createStatement();
                                                ResultSet rs = st.executeQuery("select iconCode from categories where name='"+ nameToUpdate +"'");
                                                rs.next();
                                                String actualicon = rs.getString(1);
                                                con.close();

                                                out.println(nameToUpdate);
                                            %>
                                          </div>
                                        <div class="card-body">
                                            <form action="updateCategory" method="POST">
                                                <div class="form-group">
                                                    <label for="categoryName">Current name:</label>
                                                    <input type="text" class="form-control" name="categoryName" id="categoryName" value="<%=nameToUpdate%>" readonly>
                                                </div>
                                                <div class="form-group">
                                                    <label for="newCategoryName">New name:</label>
                                                    <input type="text" class="form-control" name="newCategoryName" id="newCategoryName" required="required" autocomplete="off" value="<%=nameToUpdate%>">
                                                </div>
                                                <div class="form-group">
                                                    <label for="newIconCode">New icon code:</label>
                                                    <input type="text" class="form-control" name="newIconCode" id="newIconCode" required="required" autocomplete="off" value='<%=actualicon%>'>
                                                </div>
                                                <button type="submit" class="btn btn-primary">Update</button>
                                            </form> 
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12 col-md-8">
                                    
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