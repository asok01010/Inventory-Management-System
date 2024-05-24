<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Stock Table</title>
</head>
<style>
    /* style.css */

    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f2f2f2;
    }

    .container {
        max-width: 1800px;
        margin: 0 auto;
        padding: 20px;
    }

    h1 {
        text-align: center;
        margin-bottom: 20px;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    }

    thead {
        background-color: rgb(233, 183, 21);
        color: white;
    }

    th, td {
        padding: 12px 15px;
        text-align: left;
    }

    tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    tr:hover {
        background-color: #ddd;
    }
    footer{
        display: flex;
        background-color: rgb(233, 183, 21);
        color: white;
        text-align: center;
        align-items: center;
        justify-content: center;
        height: 60px;
        margin-top: 270px;
    }


</style>
<body>
<!-- Navigation Bar -->
<nav>
    <ul>
        <li><a href="#" class="logo"><img src="assets/SS.jpeg"></a></li>
        <li class="hideOnMobile"><a class="navlinks" href="index.jsp">Home</a></li>
        <li class="hideOnMobile"><a class="navlinks" href="mydetail.jsp">My details</a></li>
        <li class="hideOnMobile"><a href="login.jsp"><button>Log out</button></a></li>
        <li class="showOnMobile" onclick="showSidebar()"><a href="#">&#9776;</a></li>
    </ul>

    <ul class="sidebar">
        <li onclick="hideSidebar()"><a href="#" class="cross">&#x2715;</a></li>
        <li><a class="navlinks" href="index.jsp">Home</a></li>
        <li><a class="navlinks" href="mydetail.jsp">My details</a></li>
        <li><a class="navlinks" href="login.jsp">Log out</a></li>
    </ul>
</nav>
<!-- Stock Table -->
<div class="container">
    <h1>Stock Details</h1>
    <div id="stockTable">
        <table>
            <thead>
            <tr>
                <th>Item Name</th>
                <th>Quantity</th>
                <th>Price (Per Unit)</th>
                <th>Manufactured Date</th>
                <th>Expiry Date</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="product" items="${productDetail}">
                <tr>
                    <td>${product.name}</td>
                    <td>${product.quantity}</td>
                    <td>${product.price}</td>
                    <td>${product.mfd}</td>
                    <td>${product.exd}</td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>
</div>

<!-- Footer -->
<footer>
    Copyright 2024 &copy; - All Rights Reserved To Sakun Store &reg;<br />
</footer>

<!-- JavaScript -->
<script>

    function showSidebar(){
        const sidebar = document.querySelector('.sidebar')
        sidebar.style.display = 'flex'
    }

    function hideSidebar(){
        const sidebar = document.querySelector('.sidebar')
        sidebar.style.display = 'none'
    }


</script>
</body>
</html>
