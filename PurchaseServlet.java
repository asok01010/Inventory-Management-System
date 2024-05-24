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

@WebServlet("/PurchaseServlet")
public class PurchaseServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Fetching form data
        String item_name = request.getParameter("item_name");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        String mfd = request.getParameter("mfd");
        String exp = request.getParameter("exp");

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/finalproject?useSSL=false";
        String dbUsername = "root";
        String dbPassword = "password";

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establishing a connection
            try (Connection conn = DriverManager.getConnection(url, dbUsername, dbPassword)) {
                // SQL query to insert purchase data into the database
                String query = "INSERT INTO purchase (item_name, quantity, price, mfd, exp) VALUES (?, ?, ?, ?, ?)";
                try (PreparedStatement preparedStatement = conn.prepareStatement(query)) {
                    // Setting parameters
                    preparedStatement.setString(1, item_name);
                    preparedStatement.setInt(2, quantity);
                    preparedStatement.setDouble(3, price);
                    preparedStatement.setString(4, mfd);
                    preparedStatement.setString(5, exp);

                    // Executing the query
                    int rowsInserted = preparedStatement.executeUpdate();
                    if (rowsInserted > 0) {
                        // Sending JavaScript code to display popup message
                        out.println("<script>");
                        out.println("alert('Data stored successfully into database!');");
                        out.println("window.location.href='index.jsp';"); // Redirect to index.jsp
                        out.println("</script>");
                        return; // Don't forget to return to avoid further processing
                    } else {
                        out.println("<h2>Failed to purchase item. Please try again.</h2>");
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
        // Store form data in request attributes
        request.setAttribute("item_name", item_name);
        request.setAttribute("quantity", quantity);
        request.setAttribute("price", price);
        request.setAttribute("mfd", mfd);
        request.setAttribute("exp", exp);

        // Redirect to stock.jsp
        request.getRequestDispatcher("stock.jsp").forward(request, response);

    }

}

