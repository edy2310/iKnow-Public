<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="includes/head.jsp" %>

<body class="bg-dark">
  <%
      HttpSession loginSession = request.getSession();
      if(loginSession.getAttribute("loginID") != null ){
          response.sendRedirect("dashboard.jsp");
      }
  %>
  <div class="container login_main">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header">Login</div>
      <div class="card-body">
        <form action="dashboard.jsp" method="POST">
          <div class="form-group">
            <div class="form-label-group">
              <input type="email" id="user" class="form-control" placeholder="Email address" required="required" name="user">
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
              <input type="password" id="password" class="form-control" placeholder="Password" required="required" name="password">
            </div>
          </div>
          <button type="submit" class="btn btn-primary login_btn">Login</button>
        </form>
        <%
            String name = (request.getParameter("auth") != null) ? request.getParameter("auth") : "null";
            String alertStyle;
            if(name.equals("false")){
                alertStyle = "block";
            }
            else{
                alertStyle = "d-none";
            }
        %>
        <div class="alert alert-danger mt-4 <%=alertStyle%>" role="alert">
          User or Password incorrect
        </div>
      </div>
    </div>
  

  
  
  </div>
 <%@include file="includes/scripts.jsp" %>
</body>

</html>