package com.example.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set response content type
        response.setContentType("text/html;charset=UTF-8");

        // Retrieve order data from the request
        String customerName = request.getParameter("customer_name");
        String itemName = request.getParameter("item_name");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        String time = request.getParameter("time");
        String address = request.getParameter("address");

        // Save the order data into the database
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject?useSSL=false", "root", "password")) {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String query = "INSERT INTO orders (customer_name, item_name, quantity, price, time, address) VALUES (?, ?, ?, ?, ?, ?)";
            try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
                preparedStatement.setString(1, customerName);
                preparedStatement.setString(2, itemName);
                preparedStatement.setInt(3, quantity);
                preparedStatement.setDouble(4, price);
                preparedStatement.setString(5, time);
                preparedStatement.setString(6, address);

                int rowsInserted = preparedStatement.executeUpdate();
                if (rowsInserted > 0) {
                    response.getWriter().println("<script>");
                    response.getWriter().println("alert('Data stored successfully into database!');");
                    response.getWriter().println("window.location.href='index.jsp';");
                    response.getWriter().println("</script>");
                } else {
                    response.getWriter().println("Failed to place the order. Please try again.");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred: " + e.getMessage());
        }
    }
}
