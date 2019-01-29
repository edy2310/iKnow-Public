<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.iknow.connectionDb"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>

<head>
    <title>iKnow Search</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="../assets/img/favicon.png" />
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/css/styles.css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
        crossorigin="anonymous">

</head>

<body>
    <nav class="navbar navbar-light bg-light">
        <a class="navbar-brand" href="../">
            <img src="../assets/img/logo.png" class="d-inline-block align-top">
        </a>
        <div class="form-inline">
            <a href="../login.jsp"><button class="btn btn-outline-success my-2 my-sm-0" >Login</button></a>
          </form>
    </nav>

    <div id="searchIntern">
        <div v-if="loading" class="loading">
                <img src="../assets/img/loading.gif" alt="Loading">
        </div>

        <div class="not-found" v-if="found">
            <span>
                <strong>We can't find what you are looking for</strong>
            </span>            
            <span>
                But you can search in the categories we have <a href="/">here</a>
            </span>
        </div>

        <div class="search-container"> 
            <form class="form-inline" method="GET">
                <div class="form-group mb-2"> 
                    <input type="text" class="form-control" id="questionAsked" name="questionAsked" placeholder="Any question?">
                </div>
                <button type="submit" class="btn btn-primary mb-2">Search</button>
            </form>
        </div>

        <div class="container question-main_content mt-4" v-if="!loading">
            <div class="row questionTitle mb-3">
                    
                        <% 
                            String searchReq = request.getParameter("questionAsked");
                            Connection con = connectionDb.connect();
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery("select * from questions where content like '"+searchReq+"%' or content like '%"+searchReq+"' or content like '%"+searchReq+"%' order by content ASC");
                            if(!rs.first())
                                out.println("<h1> Not found </h1>");
                            else{
                                out.println("<h1>" + rs.getString(3) + "</h1>");
                                while(rs.next()){
                                    out.println("<h1>" + rs.getString(3) + "</h1>");
                                }
                            }
                            
                            
                        %> 
            </div>
        </div>

    </div>  

    <div class="question-footer">
        <div class="question-footer_content">
            <i class="fas fa-question-circle"></i>
            <p>Still have questions?</p>
            <span>
                Contact us if you still have a question about us <br>
                <a href="https://twitter.com/Edy2310" target="_blank">Talk with us!</a>
            </span>
        </div>
    </div>
     
    <footer>
        <div class="developed">
            Developed by <a href="https://twitter.com/Edy2310" target="_blank">@Edy2310</a>
        </div>
        <div class="social">
            <div>Follow me in this journey</div>
            <div class="social-icons">
                <ul>
                    <li>
                        <a href="https://twitter.com/edy2310" target="_blank"><i class="fab fa-twitter"></i></a>
                    </li>
                    <li>
                        <a href="https://www.linkedin.com/in/edgar-mu%C3%B1oz-332624b6/" target="_blank"><i class="fab fa-linkedin-in"></i></a>
                    </li>
                    <li>
                        <a href="https://medium.com/@edgarmuvaz" target="_blank"><i class="fab fa-medium-m"></i></a>
                    </li>
                </ul>
            </div>
        </div>
    </footer>

    <script src="../assets/js/bundleSearch.js"></script>
</body>

</html>