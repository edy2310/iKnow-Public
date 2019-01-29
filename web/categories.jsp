<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
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
                            <i class="fas fa-folder-open"></i>
                            Categories
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-12 col-md-4">
                                    <div class="card">
                                        <button class="btn_card" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample">
                                            <div class="card-header">                                                
                                                <i class="fas fa-plus-circle"></i> Add Category
                                            </div>
                                        </button>
                                        <div class="collapse" id="collapseExample">
                                            <div class="card-body">
                                                <form action="addCategory" method="POST">
                                                    <div class="form-group">
                                                        <label for="categoryName">New category name:</label>
                                                        <input type="text" class="form-control" name="categoryName" id="categoryName" required="required" autocomplete="off">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="iconCode">Icon class:</label>
                                                        <input type="text" class="form-control" name="iconCode" id="iconCode" required="required" autocomplete="off">
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Add</button>
                                                </form> 
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-12 col-md-8">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                            <th scope="col">Name</th>
                                            <th scope="col">Edit</th>
                                            <th scope="col">Delete</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <%
                                            HashMap<String, String> categories;
                                            categories = allCategories.getallCategories();
                                            
                                            for(Map.Entry<String, String> categoryDb : categories.entrySet()){
                                                out.println("<tr>");
                                                out.println("<td>" + categoryDb.getValue() + "</td>");
                                                out.println("<td class='edit_category'><a href='updateCategory.jsp?name="+categoryDb.getValue() + "'><i class='fas fa-edit'></i></a></td>");
                                                out.println("<td class='delete_category'><a href='deleteCategory?name="+categoryDb.getValue() + "'><i class='fas fa-trash'></i></a></td>");
                                                out.println("</tr>");
                                            }
                                        %>
                                        </tbody>
                                        </table>
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