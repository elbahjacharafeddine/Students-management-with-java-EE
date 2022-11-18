<%@page import="java.sql.*" %>


<%
  String id = request.getParameter("id");
  Connection con;
  PreparedStatement pst;
  ResultSet rs;

  Class.forName("com.mysql.jdbc.Driver");
  con = DriverManager.getConnection("jdbc:mysql://localhost/project","root","");
  pst = con.prepareStatement("delete from users where id = ?");
  pst.setString(1, id);

  pst.executeUpdate();

  RequestDispatcher dispatcher = request.getRequestDispatcher("showStudent.jsp");
  dispatcher.forward(request,response);

%>
