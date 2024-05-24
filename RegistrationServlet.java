package com.example.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Fetching form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone_number");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");

        if (!password.equals(confirmPassword)) {
            out.println("<h2>Passwords do not match. Please try again.</h2>");
            return;
        }

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/finalproject?useSSL=false";
        String dbUsername = "root";
        String dbPassword = "password";

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establishing a connection
            try (Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword)) {
                // SQL query to insert user data into the database
                String query = "INSERT INTO users (name, email, phone_number, password) VALUES (?, ?, ?, ?)";
                try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
                    // Setting parameters
                    preparedStatement.setString(1, name);
                    preparedStatement.setString(2, email);
                    preparedStatement.setString(3, phoneNumber);
                    preparedStatement.setString(4, password);

                    // Executing the query
                    int rowsInserted = preparedStatement.executeUpdate();
                    if (rowsInserted > 0) {
                        // Sending JavaScript code to display popup message
                        out.println("<script>");
                        out.println("alert('Registration successful !');");
                        out.println("window.location.href='login.jsp';"); // Redirect to index.jsp
                        out.println("</script>");
                        return; // Don't forget to return to avoid further processing
                    } else {
                        out.println("<h2>Registration failed. Please try again.</h2>");
                    }
                }
            }
        } catch (ClassNotFoundException e) {
            out.println("<h2>An error occurred: Database driver not found.</h2>");
            e.printStackTrace(out);
        } catch (SQLException e) {
            out.println("<h2>An error occurred: " + e.getMessage() + "</h2>");
            e.printStackTrace(out);
        } finally {
            out.close();
        }
    }
}
