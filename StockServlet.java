package com.example.servlet;

import com.example.servlet.model.ProductDetail;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "StockServlet", value = "/stockServlet")
public class StockServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        Connection conn = null;

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/finalproject";
        String dbUsername = "root";
        String dbPassword = "password";

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establishing a connection
            conn = DriverManager.getConnection(url, dbUsername, dbPassword);

            // Query to select data from 'purchase' table
            String query = "SELECT item_name, AVG(price) AS price, MAX(mfd) AS mfd, MAX(exp) AS exp, SUM(quantity) AS quantity " +
                    "FROM purchase " +
                    "GROUP BY item_name";

            // Prepared statement to execute the select query
            PreparedStatement preparedStatement = conn.prepareStatement(query);

            // Executing the query
            ResultSet rs = preparedStatement.executeQuery();

            // List to store ProductDetail objects
            List<ProductDetail> productDetails = new ArrayList<>();

            while (rs.next()) {
                // Create a new ProductDetail object for each item
                ProductDetail productDetail = new ProductDetail();
                productDetail.setName(rs.getString("item_name"));
                productDetail.setPrice(rs.getInt("price"));
                productDetail.setQuantity(rs.getInt("quantity"));
                productDetail.setMfd(rs.getString("mfd"));
                productDetail.setExd(rs.getString("exp"));
                productDetails.add(productDetail);


            }

            // Close ResultSet and PreparedStatement
            rs.close();
            preparedStatement.close();

            // Close connection
            conn.close();

            // Set product details as session attribute
            HttpSession httpSession = request.getSession();
            httpSession.setAttribute("productDetail", productDetails);

            // Forward request to stock.jsp
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("stock.jsp");
            requestDispatcher.forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("<h2>An error occurred: " + e.getMessage() + "</h2>");
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
