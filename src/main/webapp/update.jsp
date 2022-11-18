<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"/>

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">

</head>
<body>



<div class="wrapper d-flex align-items-stretch">
    <nav id="sidebar">
        <div class="p-4 pt-5">
            <a href="#" class="img logo rounded-circle mb-5"></a>
            <ul class="list-unstyled components mb-5">
                <li class="active">
                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Students</a>
                    <ul class="collapse list-unstyled" id="homeSubmenu">
                        <li>
                            <a href="index.jsp">Add Student</a>
                        </li>
                        <li>
                            <a href="#">Remove Student</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">University</a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li>
                            <a href=addUniversity.jsp>Add University</a>
                        </li>
                        <li>
                            <a href="allUniversity.jsp">All university</a>
                        </li>
                    </ul>
                </li>
            </ul>

            <div class="footer">
                <p>
                    Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | ELBAHJA CHARAFEDDINE | 2ITE
                </p>
            </div>

        </div>
    </nav>

    <!-- Page Content  -->
    <div id="content" class="p-4 p-md-5">

        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">

                <button type="button" id="sidebarCollapse" class="btn btn-primary">
                    <i class="fa fa-bars"></i>
                    <span class="sr-only">Toggle Menu</span>
                </button>
                <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class="fa fa-bars"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="nav navbar-nav ml-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="index.jsp">Main Menu</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="showStudent.jsp">Show Student</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="smartFilter.jsp">Smart Filter</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>


        <section class="mt-4">
            <div class="row">
                <div class="col-md-12 mb-4">
                    <div class="card mb-4">
                        <div class="card-header py-3">
                            <h6 class="text-center">You are the visitor number :</h6>
                        </div>
                        <div class="card-body">
                            <form action="UpdateServlet" method="post">
                                <!-- 2 column grid layout with text inputs for the first and last names -->
                                <%
                                    String id = request.getParameter("id");
                                    String url = "jdbc:mysql://localhost:3306/project";
                                    String username = "root";
                                    String password = "";
                                    Connection connection;
                                    ResultSet res = null;
                                    try {
                                        Class.forName("com.mysql.jdbc.Driver");
                                        connection = DriverManager.getConnection(url, username, password);
                                        PreparedStatement pt = connection.prepareStatement("SELECT * FROM users where id = ?");
                                        pt.setString(1,id);

                                        res = pt.executeQuery();

                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }

                                    while (res.next()){
                                        String idd = res.getString("id");
                                %>

                                <div>
                                    <input type="text" hidden class="form-control" placeholder="Student Name" value="<%= res.getString("id")%>" name="id" id="f" required >
                                </div>
                                <div class="row mb-4">
                                    <div class="col">
                                        <div class="form-outline">
                                            <label class="form-label" for="form6Example1">First name</label>
                                            <input type="text" id="form6Example1" class="form-control" name="first_name" value="<%=res.getString("first_name")%>"/>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-outline">
                                            <label class="form-label" for="form6Example2">Last name</label>
                                            <input type="text" id="form6Example2" class="form-control" name="last_name" value="<%=res.getString("last_name")%>" />
                                        </div>
                                    </div>
                                </div>


                                <div class="row mb-4">
                                    <div class="col">
                                        <div class="form-outline">
                                            <label class="form-label" >Age :</label>
                                            <input type="text"  class="form-control" name="age" value="<%=res.getString("age")%>" />
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="form-outline">
                                            <label class="form-label" >Gender :</label>
                                            <select name="gender" class="form-control">
                                                <%
                                                if (res.getString("gender").equals("M")){
                                                %>
                                                <option value="M" selected>M</option>
                                                <option value="F">F</option>
                                                <%} else {%>
                                                <option value="M" >M</option>
                                                <option value="F" selected>F</option>
                                                <%}%>
                                            </select>
                                        </div>
                                    </div>
                                </div>


                                <!-- Text input -->
                                <div class="form-outline mb-4">
                                    <label class="form-label">Select date :</label>
                                    <input type="date"  name="date" class="form-control"  value="<%=res.getString("date")%>"/>
                                </div>

                                <!-- Text input -->
                                <div class="form-outline mb-4">
                                    <label class="form-label" >University :</label>
                                    <select class="form-control" name="ecole">
                                        <option value="<%=res.getString("ecole")%>" ><%=res.getString("ecole")%> </option>
                                    </select>
                                </div>

                                <%}%>


                                <button class="btn btn-primary " type="submit">
                                    Save
                                </button>
                                <button class="btn btn-warning "> Cancel</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </div>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>