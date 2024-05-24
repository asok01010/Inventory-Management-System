package com.example.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Fetching form data
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/finalproject";
        String dbUsername = "root";
        String dbPassword = "password";

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establishing a connection
            try (Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword)) {
                // SQL query to check if user exists
                String query = "SELECT * FROM users WHERE email = ? AND password = ?";
                try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
                    // Setting parameters
                    preparedStatement.setString(1, email);
                    preparedStatement.setString(2, password);

                    // Executing the query
                    ResultSet rs = preparedStatement.executeQuery();
                    if (rs.next()) {
                        // Set session attributes
                        HttpSession session = request.getSession();
                        session.setAttribute("name", rs.getString("name"));
                        session.setAttribute("email", rs.getString("email"));
                        session.setAttribute("phone", rs.getString("phone_number"));

                        // Redirect to index.jsp upon successful login
                        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                        dispatcher.forward(request, response);
                    } else {
                        out.println("<h2>Invalid email or password.</h2>");
                    }
                }
            }
        } catch (ClassNotFoundException e) {
            out.println("<h2>An error occurred: Database driver not found.</h2>");
            e.printStackTrace();
        } catch (SQLException e) {
            out.println("<h2>An error occurred: " + e.getMessage() + "</h2>");
            e.printStackTrace();
        } finally {
            out.close();
        }
    }
}
