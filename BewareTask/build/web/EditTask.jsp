<%-- 
    Document   : EditTask
    Created on : Nov 27, 2020, 11:25:50 AM
    Author     : Mystery-PC
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Task</title>
        
         <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <% if ( session.getAttribute("username")==null) {
                response.sendRedirect("Login.jsp");
            }
        %>
        
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
        
        <sql:setDataSource
            var="bewaretaskasp"
            driver="com.mysql.cj.jdbc.Driver"
            url="jdbc:mysql://localhost:3306/bewaretaskasp"
            user="root" password=""
        />
        <sql:query var="taskVar" dataSource="${bewaretaskasp}">
            SELECT * FROM task where id = <%= request.getParameter("taskid")%> LIMIT 1;
        </sql:query>
       
        <%--ini pop up window harusnya?--%>
         <div class="container my-5">
            <div class="card">
                <div class="card-header" style="border: 0px; background-color: #ff8559;">
                    <div class="card-title" id="loginTitle" >
                        <h3 style="padding-top: 10px">Edit Task</h3>
                    </div>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <form action="<%=request.getContextPath()%>/EditTaskServlet" method="post">
                            <input type="text" hidden name="taskid" value="${taskVar.rows[0].id}" />
                            <td> Task Name   </td> <br>
                            <input  type="text" name="editedTaskName" value ="${taskVar.rows[0].TaskName}" /><br><br>
                            <td> Due Date </td> <br>
                            <input type="date" name="deadline"><br>
                            <input type="submit" name="submit" class="btn btn-success mt-3" id="btnLogin" value="Edit task" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
