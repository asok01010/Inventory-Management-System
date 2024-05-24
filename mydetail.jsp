<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Details</title>
    <link rel="stylesheet" href="style.css">
</head>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }

    .container {
        max-width: 600px;
        margin: 0 auto;
        padding: 20px;
    }

    h1 {
        text-align: center;
        margin-bottom: 20px;
    }

    .details {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .detail-item {
        margin-bottom: 15px;
    }

    .label {
        font-weight: bold;
        color: #333;
    }

    .value {
        color: #666;
    }

    /* Media query for smaller screens */
    @media (max-width: 600px) {
        .container {
            padding: 10px;
        }
    }
    footer{
        margin-top: 300px;
    }

</style>
<body>
<!-- begin: navBar -->
<nav>
    <ul>
        <li><a href="#" class="logo"><img src="assets/SS.jpeg"></a></li>
        <li class="hideOnMobile"><a class="navlinks" href="index.jsp">Home</a></li>
        <li class="hideOnMobile"><a class="navlinks" href="mydetail.jsp">My details</a></li>
        <li class="hideOnMobile"><a href="login.jsp"><button>Log out</button></a></li>
        <li class="showOnMobile" onclick=showSidebar()><a href="#">&#9776;</a></li>
    </ul>

    <ul class="sidebar">
        <li onclick=hideSidebar()><a href="#" class="cross">&#x2715;</a></li>
        <li><a class="navlinks" href="index.jsp">Home</a></li>
        <li><a class="navlinks" href="mydetail.jsp">My details</a></li>
        <li><a class="navlinks" href="login.jsp">Log out</a></li>
    </ul>
</nav>
<!-- end: navBar -->
<!-- begin: hero -->
<div class="container">
    <h1>My Details</h1>
    <div class="details">
        <div class="detail-item">
            <span class="label">Name:</span>
            <span class="value">${sessionScope.name}</span>
        </div>
        <div class="detail-item">
            <span class="label">Email:</span>
            <span class="value">${sessionScope.email}</span>
        </div>
        <div class="detail-item">
            <span class="label">Phone:</span>
            <span class="value">${sessionScope.phone}</span>
        </div>
    </div>
</div>
<!-- end: hero -->

<!-- begin: footer -->

<footer>
    Copyright 2024 &copy; - All  Rights Reserved To Sakun Store &reg;<br />
</footer>

<!-- end: footer -->
<!-- begin: Script-->
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
<!-- end: Script-->
</body>
</html>
