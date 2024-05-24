package com.example.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


@WebServlet("/PurchaseReturnServlet")
public class PurchaseReturnServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Fetching form data
        String item_name = request.getParameter("item_name");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String purchase_date = request.getParameter("purchase_date");

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/finalproject?useSSL=false";
        String dbUsername = "root";
        String dbPassword = "password";

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establishing a connection
            try (Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword)) {
                // SQL query to insert purchase return data into the database
                String insertQuery = "INSERT INTO purchase_return (item_name, quantity, purchase_date) VALUES (?, ?, ?)";
                try (PreparedStatement insertStatement = conn.prepareStatement(insertQuery)) {
                    // Setting parameters
                    insertStatement.setString(1, item_name);
                    insertStatement.setInt(2, quantity);
                    insertStatement.setString(3, purchase_date);

                    // Executing the insertion query
                    int rowsInserted = insertStatement.executeUpdate();

                    if (rowsInserted > 0) {
                        // SQL query to subtract returned quantity from purchase table
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
                        out.println("alert('Item return successfully');");
                        out.println("window.location.href='index.jsp';"); // Redirect to index.jsp
                        out.println("</script>");
                        return; // Don't forget to return to avoid further processing
                    } else {
                        PrintWriter out = response.getWriter();
                        out.println("<h2>Failed to return item. Please try again.</h2>");
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
