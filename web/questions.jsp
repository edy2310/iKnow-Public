<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <%@include file="includes/head.jsp" %>
    <style>
        #questionsMainTable_filter, #questionsMainTable_paginate {
            float: right;
            margin-right: 1.2em;
        }
        #questionsMainTable_length label {
            display: flex;
        }
        #questionsMainTable_length label select{
            width: 10%;
            margin: 0 0.5em;
        }
        .fas.fa-sort {
            float: right;
            margin-top: 0.3em;
        }
        .table_mainHeader th{
            cursor: pointer;
        }
        .table_mainHeader-control{
            cursor: context-menu !important;
        }
    </style>
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
                    <i class="fas fa-fw fa-folder"></i>
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
                        <i class="fas fa-database"></i>
                        Manage FAQ's
                    </div>
                    <div class="card-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <table class="table table-striped" id="questionsMainTable" cellspacing="0" width="100%">
                                        <thead>
                                            <tr class="table_mainHeader">
                                            <th scope="col">Category <i class="fas fa-sort"></i></th>
                                            <th scope="col">Title <i class="fas fa-sort"></i></th>
                                            <th scope="col">Content <i class="fas fa-sort"></i></th>
                                            <th scope="col" class="table_mainHeader-control">Edit</th>
                                            <th scope="col" class="table_mainHeader-control">Delete</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            
                                        <jsp:useBean id="allQuestions" scope="request" class="com.iknow.questions"></jsp:useBean>
                                        <%
                                            Map<String, HashMap<String, String>> questions;
                                            questions = allQuestions.getQuestions();

                                            for(Map.Entry<String, HashMap<String, String>> questionDb : questions.entrySet()){
                                                HashMap<String, String> questionBuff = questionDb.getValue();
                                                String titleBuff = questionBuff.keySet().toString();
                                                titleBuff = titleBuff.replace("[", "");
                                                titleBuff = titleBuff.replace("]", "");
                                                String contentBuff = questionBuff.values().toString();
                                                contentBuff = contentBuff.replace("[", "");
                                                contentBuff = contentBuff.replace("]", "");
                                                
                                                out.println("<tr>");
                                                 out.println("<td>" + questionDb.getKey()+ "</td>");
                                                out.println("<td>" + titleBuff  + "</td>");
                                                out.println("<td>" + contentBuff + "</td>");
                                                out.println("<td class='edit_category'><a href='updateQuestion.jsp?title="+titleBuff + "'><i class='fas fa-edit'></i></a></td>");
                                                out.println("<td class='delete_category'><a href='deleteQuestion?title="+ titleBuff + "'><i class='fas fa-trash'></i></a></td>");
                                                out.println("</tr>");
                                            }
                                        %>
                                        </tbody>
                                        </table>
                                </div>
                            </div>
                             
                            <h5>
                                <%
                                    String category = request.getParameter("categoryId");
                                    if(category != null)
                                        out.println(category);
                                %>
                            </h5>
                        

                    </div>
                </div>
            </div>
        </div>
    </div>


<%@include file="includes/scripts.jsp" %>
<%@include file="includes/dataTableScript.jsp" %>
<script>
    $(document).ready(function () {
        console.log("leido");
        $('#questionsMainTable').DataTable();
        $('.dataTables_length').addClass('bs-select');
    });
</script>
</body>

</html>