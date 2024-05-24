package com.example.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SaleServlet")
public class SaleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Fetching form data
        String item_name = request.getParameter("item_name");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/finalproject?useSSL=false";
        String dbUsername = "root";
        String dbPassword = "password";

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establishing a connection
            try (Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword)) {
                // Check if the requested quantity is available in the purchase table
                String checkPurchaseQuery = "SELECT quantity FROM purchase WHERE item_name = ?";
                try (PreparedStatement checkPurchaseStatement = conn.prepareStatement(checkPurchaseQuery)) {
                    checkPurchaseStatement.setString(1, item_name);
                    ResultSet rs = checkPurchaseStatement.executeQuery();

                    if (rs.next()) {
                        int availableQuantity = rs.getInt("quantity");

                        if (quantity <= availableQuantity) {
                            // SQL query to insert sale data into the database
                            String query = "INSERT INTO sales (item_name, quantity, price) VALUES (?, ?, ?)";
                            try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
                                // Setting parameters
                                preparedStatement.setString(1, item_name);
                                preparedStatement.setInt(2, quantity);
                                preparedStatement.setDouble(3, price);

                                // Executing the query
                                int rowsInserted = preparedStatement.executeUpdate();
                                if (rowsInserted > 0) {
                                    String updatePurchaseQuery = "UPDATE purchase SET quantity = quantity - ? WHERE item_name = ?";
                                    try (PreparedStatement updatePurchaseStatement = conn.prepareStatement(updatePurchaseQuery)) {
                                        updatePurchaseStatement.setInt(1, quantity);
                                        updatePurchaseStatement.setString(2, item_name);
                                        // Executing the update query
                                        updatePurchaseStatement.executeUpdate();
                                    }
                                    // Sending JavaScript code to display popup message
                                    PrintWriter out = response.getWriter();
                                    out.println("<script>");
                                    out.println("alert('Item sold successfully ');");
                                    out.println("window.location.href='index.jsp';"); // Redirect to index.jsp
                                    out.println("</script>");
                                    return; // Don't forget to return to avoid further processing
                                } else {
                                    PrintWriter out = response.getWriter();
                                    out.println("<h2>Failed to sell item. Please try again.</h2>");
                                }
                            }
                        } else {
                            PrintWriter out = response.getWriter();
                            out.println("<h2>Requested quantity exceeds available quantity in stock. Please check and try again.</h2>");
                        }
                    } else {
                        PrintWriter out = response.getWriter();
                        out.println("<h2>Item not found in stock. Please check and try again.</h2>");
                    }
                }
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.getWriter().println("<h2>An error occurred: Database driver not found.</h2>");
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("<h2>An error occurred: " + e.getMessage() + "</h2>");
        }
    }
}
