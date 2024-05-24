package com.example.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/OrderServlet")
public class ViewOrdersServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String customerName = request.getParameter("customer_name");
        String itemName = request.getParameter("item_name");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        double price = Double.parseDouble(request.getParameter("price"));
        String time = request.getParameter("time");
        String address = request.getParameter("address");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject?useSSL=false", "root", "password");

            String query = "INSERT INTO orders (customer_name, item_name, quantity, price, time, address) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, customerName);
            preparedStatement.setString(2, itemName);
            preparedStatement.setInt(3, quantity);
            preparedStatement.setDouble(4, price);
            preparedStatement.setString(5, time);
            preparedStatement.setString(6, address);

            int rowsInserted = preparedStatement.executeUpdate();
            if (rowsInserted > 0) {
                response.getWriter().println("<script>alert('Data stored successfully into the database!');window.location.href='index.jsp';</script>");
            } else {
                response.getWriter().println("Failed to place the order. Please try again.");
            }

            preparedStatement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred: " + e.getMessage());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Order> orderList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/finalproject?useSSL=false", "root", "password");

            String query = "SELECT customer_name, item_name, quantity, price, time, address FROM orders";
            PreparedStatement preparedStatement = connection.prepareStatement(query);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Order order = new Order();
                order.setCustomerName(resultSet.getString("customer_name"));
                order.setItemName(resultSet.getString("item_name"));
                order.setQuantity(resultSet.getInt("quantity"));
                order.setPrice(resultSet.getDouble("price"));
                order.setTime(resultSet.getString("time"));
                order.setAddress(resultSet.getString("address"));
                orderList.add(order);
            }

            resultSet.close();
            preparedStatement.close();
            connection.close();

            request.setAttribute("orderList", orderList);
            request.getRequestDispatcher("viewOrders.jsp").forward(request, response);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.getWriter().println("An error occurred: " + e.getMessage());
        }
    }
}
