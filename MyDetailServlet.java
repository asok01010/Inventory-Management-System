package com.example.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MyDetailServlet")
public class MyDetailServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone_number"); // Corrected parameter name
        String password = request.getParameter("password");


        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/finalproject?useSSL=false";
        String dbUsername = "root";
        String dbPassword = "password";

    }
}
