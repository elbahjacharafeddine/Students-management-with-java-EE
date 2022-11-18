<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
  <title>Add University</title>
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
        <li class="active">
          <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">University</a>
          <ul class="collapse list-unstyled" id="pageSubmenu">
            <li>
              <a href="addUniversity.jsp">Add University</a>
            </li>
            <li>
              <a href="#">All university</a>
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

    <div class="card">
      <div class="card-header">
        <h5>Add University</h5>
      </div>
      <form action="UniversityServlet" method="post">
        <div class="card-body">
          <label>Name :</label>
          <input type="text" name="name" placeholder="Name" class="mt-2 form-control"/>
          <button class="btn btn-primary mt-4">Save</button>
        </div>
      </form>

    </div>




  </div>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
</body>
</html>