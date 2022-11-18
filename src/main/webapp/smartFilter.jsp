<%--
  Created by IntelliJ IDEA.
  User: elbah
  Date: 08/11/2022
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>List</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"/>

    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>

<div class="wrapper d-flex align-items-stretch" >
    <nav id="sidebar">
        <div class="p-4 pt-5">
            <a href="#" class="img logo rounded-circle mb-5"></a>
            <ul class="list-unstyled components mb-5">
                <li class="">
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
                            <a href="addUniversity.jsp">Add University</a>
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

        <table id="example" class="table table-striped table-bordered">

            <thead class="table-primary">
            <tr>
                <th>id</th>
                <th>First name</th>
                <th>last name</th>
                <th>Age</th>
                <th>Gender</th>
                <th>date</th>
                <th>University</th>
            </tr>
            </thead>
            <tbody id="containerr">
            <%
                ResultSet rse;
                Connection con;

                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/project","root","");

                String queryy = "select * from users";

                Statement stt = con.createStatement();




                rse =  stt.executeQuery(queryy);


            %><%
                while(rse.next())
                {
                    String id = rse.getString("id");
            %>
            <tr>
                <td><%=rse.getString("id") %></td>
                <td><%=rse.getString("first_name") %></td>
                <td><%=rse.getString("last_name") %></td>
                <td><%=rse.getString("age") %></td>
                <td><%=rse.getString("gender") %></td>
                <td><%=rse.getString("date") %></td>
                <td><%=rse.getString("ecole") %></td>
            </tr>
            <%}%>
            </tbody>
        </table>

        <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
        <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#example').DataTable();
            });
        </script>

    </div>
</div>

<script src="js/popper.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>
