<%-- 
    Document   : Task.jsp
    Created on : Nov 27, 2020, 10:51:15 AM
    Author     : Mystery-PC
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Task</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <style>
            #del:hover{
                background-color : red;
            }
        </style>
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
        <%
            String uid = request.getParameter("user");
            session.removeAttribute("EditedTasktag");
        %>
        <sql:setDataSource
            var="bewaretaskasp"
            driver="com.mysql.cj.jdbc.Driver"
            url="jdbc:mysql://localhost:3306/bewaretaskasp"
            user="root" password=""
        />
        <sql:query var="taskList"   dataSource="${bewaretaskasp}">
            SELECT * FROM task WHERE idUser = <%=session.getAttribute("userID")%>;
        </sql:query>
        <nav class="navbar navbar-expand-md navbar-light shadow-sm navbar-custom">
            
        </nav>
        <div class="container my-5">
            <div class="card">
                <div class="card-header">
                    <div class="card-title" id="loginTitle">
                        <h3>Add new task</h3>
                    </div>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <form action="<%=request.getContextPath()%>/TaskServlet" method="post">
                            <input type="text" name="taskname" /><br>
                            <input type="submit" name="submit" class="btn btn-success mt-3" id="btnLogin" value="AddTask" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="container">
            <h1>Your Tasks List</h1>
            <table class="table table-bordered">
                <thead style="background-color:#ff8559">
                    <tr>
                        <th>No.</th>
                        <th>Task name</th>
                        <th>Due Date</th>
                        <th>Tag(s)</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% int counter = 1;%>
                    <% int lineid = 0;%>
                    <c:forEach var="data" items="${taskList.rows}">
                    <tr>
                        <td><%=counter%></td>
                        <td><c:out value="${data.TaskName}" />
                        </td>
                        <td><c:out value="${data.deadline == null ? '-' : data.deadline}" /></td>
                        <td>
                            <sql:query var="tagVar" dataSource="${bewaretaskasp}">
                                SELECT tg.TagName FROM tag tg, tag_task tt, task ta WHERE ta.id = ${data.id} and tg.id = tt.tag_id and tt.task_id = ta.id;
                            </sql:query>
                            <c:forEach var="data2" items="${tagVar.rows}">
                                <c:out value="${data2.TagName == null ? '' : data2.TagName}" />
                                <c:out value=" | " />
                            </c:forEach>
                        </td>
                        <td>
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenu2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                  
                                </button>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                    <form action="<%=request.getContextPath()%>/EditTag.jsp" method="post">
                                        <input type="text" hidden name="taskid" value="${data.id}" />
                                        <input class="dropdown-item" type="submit" value="Add Tag"/>
                                    </form>
                                    <form action="<%=request.getContextPath()%>/EditTask.jsp" method="post">
                                        <input type="text" name="taskid" hidden value="${data.id}" />
                                        <input class="dropdown-item" type="submit" value="Edit"/>
                                    </form>
                                    <form action="<%=request.getContextPath()%>/DeleteTaskServlet" method="post">
                                        <input type="text" name="taskid" hidden value="${data.id}" />
                                        <input id="del" class="dropdown-item" type="submit" value="Delete"/>
                                    </form>
                                    </div>
                            </div>
                            
                        </td>
                    </tr>
                    <%counter++;%>
                    </c:forEach>
                </tbody>
            </table>
        </div>
            
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    </body>
</html>
