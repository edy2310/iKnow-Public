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
        String user = request.getParameter("user");
        String pass = request.getParameter("password");
    %>

    <jsp:useBean id="connectDB" scope="session" class="com.iknow.loginAuth"></jsp:useBean>
    <jsp:setProperty name="connectDB" property="user" value="<%= user %>" />
    <jsp:setProperty name="connectDB" property="password" value="<%= pass %>" />

    <%  
        HttpSession loginSession = request.getSession();
        if(loginSession.getAttribute("loginID") == null){
            boolean auth = connectDB.authLogin();
            if (!auth) {
                response.sendRedirect("login.jsp?auth=false");
            }
            else{
                loginSession.setAttribute("loginID", "edgar");
            }
        }
    %>

    <%@include file="includes/navbar.jsp" %>

    <div id="wrapper">
        <ul class="sidebar navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="dashboard.jsp">
                    <i class="fas fa-plus-circle"></i>
                    <span>Add FAQ</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="categories.jsp">
                    <i class="fas fa-fw fa-folder"></i>
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

        <jsp:useBean id="allCategories" scope="request" class="com.iknow.category"></jsp:useBean>

        <div id="content-wrapper">
            <div class="container-fluid">
                <div class="card mb-3">
                    <div class="card-header">
                        <i class="fas fa-plus-circle"></i>
                        Add FAQ
                    </div>
                    <div class="card-body">

                            <form action="addQuestion" method="POST">
                                <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label for="categoryName">Category</label>
                                        <select class="form-control" id="categoryName" name="categoryId">
                                            <option disabled selected hidden>Category</option>
                                            <%
                                            HashMap<String, String> categories;
                                            categories = allCategories.getallCategories();
                                            for(Map.Entry<String, String> categoryDb : categories.entrySet()){
                                                out.println("<option value='"+ categoryDb.getKey() +"'>" + categoryDb.getValue() + "</option>");
                                            }
                                        %>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-md-9">
                                    <div class="form-group">
                                        <label for="title-question">Title</label>
                                        <input type="text" class="form-control" id="title-question" aria-describedby="emailHelp"
                                            placeholder="Title" name="title">
                                    </div>
                                    <div class="form-group">
                                        <label for="content-question">Question content</label>
                                        <textarea class="form-control" id="content-question" rows="5" name="content"></textarea>
                                    </div>
                                    <button type="submit" class="btn btn-primary">Submit</button>
                                </div>
                            </div>
                            </form>

                        

                    </div>
                </div>
            </div>
        </div>
    </div>


    <%@include file="includes/scripts.jsp" %>
</body>

</html>