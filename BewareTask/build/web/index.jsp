<%-- 
    Document   : index
    Created on : Nov 26, 2020, 9:27:52 PM
    Author     : Ignatius Dwiki I
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>BewareTask!</title>
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
        <style>
            #containerFeatures{
                position:center;
                margin-top:90px;
                text-align: center;

            }

            #headingFeatures {
                font-weight: bold;
                font-family: Tokyo;
                margin-bottom:20px;
            }

            #features {
                border-radius: 10px;
                margin-top:50px;



            }

            #features i {
                    color: #d9653c;
            }

            #features h3 {
                    margin: 5px;
                    color: #ff8559;
                    font-family: Tokyo;
            }

            #features div p {
                  margin: 10px;
                  color: black;

            }

            #headingTitle{
                padding-left: 30px;
                padding-top: 35%;
                font-weight: bold;
                font-family: Tokyo;
                text-align: left;
            }

            #subheadingTitle{
                padding-top:3px;
                padding-left: 30px;
                text-align: left;
            }

            .footer {
                position: fixed;
                left: 0;
                bottom: 0;
                width: 100%;
                height: 50px;
            }

            .btnActionLink {
                background-color: #fff568;
                padding: 10px;
                border-radius: 5px;
                color:black;
            }

            #loginTitle {
                font-size:30px;
                font-family:Tokyo;
            }

            #loginContainer {
                margin-left: 120px;
                margin-right: 25px;
                margin-top: 100px;
                padding: 10px;
                background-color: #ffebe2;
                border-radius: 5px;
            }

            #btnLogin {
                background-color: #d9653c;
                border: 0px;
            }

            .navbar-brand {
                color: #ff8559;
            }

            .navbar-inverse .navbar-brand {
                color: #ff8559;
            }
          
        </style>
    
     
    </head>
    <body>
        
        <% if ( session.getAttribute("username")==null) {
            
        %>
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                 <a class="navbar-brand" href="#">BewareTask!</a>
                 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                   <span class="navbar-toggler-icon"></span>
                 </button>
                 <div class="collapse navbar-collapse" id="navbarNavDropdown">
                   <ul class="nav navbar-nav navbar-left" style = "margin-left: 50px">
                     <li class="nav-item active">
                       <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                     </li>
                     
                   </ul>
                     <ul class="nav navbar-nav navbar-right" style="margin-left: 1000px">
                         <li class="nav-item ">
                            <a class="nav-link" href="Login.jsp">Login</a>
                         </li>
                         <li class="nav-item ">
                            <a class="nav-link" href="Register.jsp">Register</a>
                          </li>
                   </ul>
                 </div>
               </nav>
         <% } else { %>
          <nav class="navbar navbar-expand-lg navbar-light bg-light">
                 <a class="navbar-brand" href="#">BewareTask!</a>
                 <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                   <span class="navbar-toggler-icon"></span>
                 </button>
                 <div class="collapse navbar-collapse" id="navbarNavDropdown">
                   <ul class="nav navbar-nav navbar-left" style = "margin-left: 50px">
                     <li class="nav-item active">
                       <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                     </li>
                     <li class="nav-item">
                       <a class="nav-link" href="Task.jsp">Task</a>
                     </li>
                   </ul>
                   <ul class="nav navbar-nav navbar-right" style="margin-left: 1000px">
                        <li class="nav-item dropdown ">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                User 
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                             <form action="<%=request.getContextPath()%>/logout" method="post">
                                    <input class="dropdown-item" type="submit" value="Logout"/>
                              </form>
                            </div>
                       </li>
                   </ul>
                 </div>
               </nav>
        <% } %>
        
        
        
        
        
        
        
        
            <div class="container" style="        
                height: 500px;
                background-color: #ff8559;
                border-radius: 10px;
                margin-top: 80px">
            <div class="row align-items-center justify-content-center" style="height:500px;overflow:hidden;">
                <div class="col-md-6" style="height:500px">
                    <h2 class="heading mb-3" id="headingTitle">
                        A Quick & Effective
                        To-Do List
                    </h2>
                    <div class="sub-heading" id="subheadingTitle">
                        <p>Beware Task! is a simple to-do list web for your task management</p>
                        <% if ( session.getAttribute("username")==null) {%>
                            <a class="btnActionLink" id="btnLogin" href="Login.jsp" style="background-color: #ffebe2">Login</a>
                            <a class="btnActionLink" id="btnLogin"  href="Register.jsp" style="background-color: #ffebe2">Register</a>   
                        <%  } else {
                        %>
                          <a class="btnActionLink" id="btnLogin" href="Task.jsp" style="background-color: #ffebe2">Add Task!</a>
                        <%  } %>
                    </div>
                </div>

                <div class="col-md-6" style=";background-image: url('/BewareTask/Home.png'); background-size:contain; height:500px; background-repeat:no-repeat">

                </div>
            </div>
        </div>


        <div class="container" style="height:500px;"id="containerFeatures" >
            <small style="font-size: 20px;">features</small> 
            <div class="row align-items-center justify-content-center" id="headingFeatures">
                <h1 style="margin-block-start:0; margin-block-end:0;">BEWARE TASKS!</h1>
            </div>
            <div class="row align-items-center justify-content-center" >
                <div class="col-md-6" id="features">
                    <i class='fas fa-clipboard-list' style='font-size:50px'></i>
                    <h3>Task</h3>
                    <div>
                        <p>Add task and manage your task easily!</p>
                    </div>
                </div>
                <div class="col-md-6" id="features">
                    <i class='fas fa-calendar-alt' style='font-size:50px'></i>
                    <h3>Date</h3>
                    <div>
                        <p>Add due date to your task, so you can manage what task should you do first!</p>
                    </div>
                </div>
            </div>
            <div class="row align-items-center justify-content-center" id="headingHomepage">
                <div class="col-md-6" id="features">
                    <i class='fas fa-mouse-pointer' style='font-size:50px'></i>
                    <h3>Easy to Use</h3>
                    <div>
                        <p>The task management designed so the user can use it as easy as possible</p>
                    </div>
                </div>
                <div class="col-md-6" id="features">
                    <i class='fas fa-money-bill' style='font-size:50px'></i>
                    <h3>Free</h3>
                    <div>
                        <p>No need to worry! Our service is free</p>
                    </div>
                </div>
            </div>
        </div>
        <br>
        <br>
         <footer class="footer" style="background-color: black">
            <div class="row" style="padding-top:10px">
                 <div class="col-md-2">
                    <h5 style="color:#ff8559;text-align:left">Beware Task!</h5>
                </div>
                <div class="col-md-8"></div>
                <div class="col-md-2">
                <h5 style="color:#ff8559;text-align:right">2020</h5>
                </div>
            </div>
        </footer>
    </body>
</html>
