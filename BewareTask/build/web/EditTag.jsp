<%-- 
    Document   : EditTag
    Created on : Nov 27, 2020, 3:59:56 PM
    Author     : feral
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Tag</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
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
        
        <%  System.out.println("SESSION REQ NOW: " + request.getParameter("taskid"));
            System.out.println("SESSION REQ NOW: " + session.getAttribute("userID"));%>
        
        <sql:query var="TagList" dataSource="${bewaretaskasp}">
            SELECT * FROM tag where idUser = <%=session.getAttribute("userID")%>;
        </sql:query>
        <sql:query var="ConfirmedTagList" dataSource="${bewaretaskasp}">
            SELECT distinct tt.task_id, tt.tag_id, t.TagName FROM tag_task tt, tag t where tt.tag_id = t.id and (task_id = <%=session.getAttribute("EditedTasktag")%> or task_id = <%=request.getParameter("taskid")%>);
        </sql:query>
       
        
        <div class="container my-5">
            <div class="row">
                <div class="col-sm-6">
                    <div class="card">
                            <div class="card-header" style="border: 0px; background-color: #ff8559">
                                <div class="card-title" id="loginTitle">
                                    <h3>Add New Tag</h3>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="form-group">
                                    <form action="<%=request.getContextPath()%>/AddTaskTagServlet" method="post">
                                        <h5 class="mt-3">Available Tag(s) list:</h5>
                                        <% if(request.getParameter("taskid") == null) { %>
                                        <input type="text"  name="taskid" value="<%=session.getAttribute("EditedTasktag")%>">
                                        <% } else { %>
                                        <input type="text"  name="taskid" value="<%=request.getParameter("taskid")%>">
                                        <% } %>
                                        <select name="tag">
                                            <c:forEach var="data" items="${TagList.rows}">
                                                <option value="${data.id}"><c:out value="${data.TagName}" /></option>
                                            </c:forEach>

                                        </select>
                                        <button class="btn btn-primary">Add Tag</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">  
                        <div class="card">
                            <div class="card-header" style="border: 0px; background-color: #ff8559">
                                <div class="card-title" id="loginTitle">
                                    <h3>Delete Tag</h3>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="form-group">
                                    <form action="<%=request.getContextPath()%>/DeleteTagServlet" method="post">
                                        <h5 class="mt-3">Available Tag(s) list:</h5>
                                        <% if(request.getParameter("taskid") == null) { %>
                                        <input type="text" hidden name="taskid" value="<%=session.getAttribute("EditedTasktag")%>">
                                        <% } else { %>
                                        <input type="text" hidden name="taskid" value="<%=request.getParameter("taskid")%>">
                                        <% } %>
                                        <select name="tag">
                                            <c:forEach var="data" items="${TagList.rows}">
                                                <option value="${data.id}"><c:out value="${data.TagName}" /></option>
                                            </c:forEach>

                                        </select>
                                        <button class="btn btn-primary">Delete Tag</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>                 
            </div>
                                        <br>
            <div class="row">
                <div class="col-sm-6">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#ModalCenter">New tag</button>
                </div>
            </div>                            
                                         
        </div>                    
            
                            
        
        
        
        <div class="container">           
        <table class="table table-bordered">
            <thead style="background-color:#ff8559">
                <tr>
                    <th>Task's Tag</th>
                </tr>
            </thead>
            <tbody>
                <% int counter = 1;%>
                <c:forEach var="data" items="${ConfirmedTagList.rows}">
                <tr>
                    <td><%=counter%>. <c:out value="${data.TagName}" /></td>
                    
                </tr>
                <%counter++;%>
                </c:forEach>
            </tbody>
        </table>

        
        
        <div class="modal fade" id="ModalCenter" tabindex="-1" role="dialog" aria-labelledby="ModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ModalCenterTitle">Add New Tag</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="<%=request.getContextPath()%>/addnewtag" method="POST">
                            <div class="form-group">
                                <h6>New Tag:</h6>
                                <input type="text" class="form-control" name="tagname">
                            </div>
                            <% if(request.getParameter("taskid") == null) { %>
                            <input type="text" hidden name="taskid" value="<%=session.getAttribute("EditedTasktag")%>">
                            <% } else { %>
                            <input type="text" hidden name="taskid" value="<%=request.getParameter("taskid")%>">
                            <% } %>
                            <button class="btn btn-primary mt-3">Add New Tag</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        </div>                     
                            
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>
    
    </body>
</html>
