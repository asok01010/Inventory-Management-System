<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <title>Order</title>
    <style>
        form#orderForm {
            width: 80%;
            max-width: 600px;
            background-color: #f2f2f2;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        form#orderForm label {
            display: block;
            margin-bottom: 5px;
        }
        form#orderForm input[type="text"],
        form#orderForm input[type="number"],
        form#orderForm input[type="time"],
        form#orderForm button {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        form#orderForm button {
            background-color: rgb(233, 183, 21);
            color: white;
            border: none;
            cursor: pointer;
            width: 30%;
            margin-left: calc((100% - 30%) / 2);
            margin-top: 10px;
            margin-bottom: 5px;
        }
        form#orderForm button:hover {
            background-color: rgb(220, 180, 19);
        }
        .container {
            margin-top: 30px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }
        .button{
            display: flex;
            margin-left: -80px;
            margin-right: 103px;
        }
    </style>
</head>
<body>
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

<div class="container">
    <h1>Order </h1>
    <form id="orderForm" action="OrderServlet" method="post">
        <label for="itemName">Customer Name:</label>
        <input type="text" id="customerName" name="customer_name" required>

        <label for="itemName">Item Name:</label>
        <input type="text" id="itemName" name="item_name" required>

        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" required>

        <label for="price">Price (Per Unit):</label>
        <input type="number" id="price" name="price" required>

        <label for="time">Time:</label>
        <input type="time" id="time" name="time" required>

        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required>
        <div class="button">
            <button type="submit">Submit</button>
            <button type="button" onclick="window.location.href='vieworder.jsp'">View Order</button>
        </div>
    </form>
</div>

<footer>
    Copyright 2024 &copy; - All Rights Reserved To Sakun Store &reg;<br />
</footer>

<script>
    function showSidebar() {
        const sidebar = document.querySelector('.sidebar')
        sidebar.style.display = 'flex'
    }
    function hideSidebar() {
        const sidebar = document.querySelector('.sidebar')
        sidebar.style.display = 'none'
    }
</script>

</body>
</html>
