package controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.*;

@WebServlet(name = "UpdateServlet", value = "/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher= request.getRequestDispatcher("/showStudent.jsp");
        dispatcher.forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String id = request.getParameter("id");
            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String age = request.getParameter("age");
            String gender = request.getParameter("gender");
            String date = request.getParameter("date");
            String ecole = request.getParameter("ecole");

            Connection con;
            PreparedStatement pst;
            ResultSet rs;

        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost/project","root","");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        try {
                pst = con.prepareStatement("update users set first_name = ?,last_name = ?,age =?, gender = ?,date = ?,ecole =? where id = ?");
                pst.setString(1, first_name);
                pst.setString(2, last_name);
                pst.setString(3, age);
                pst.setString(4, gender);
                pst.setString(5, date);
                pst.setString(6, ecole);
                pst.setString(7,id);
                pst.executeUpdate();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            RequestDispatcher dispatcher= request.getRequestDispatcher("/showStudent.jsp");
            dispatcher.forward(request,response);




    }
}
