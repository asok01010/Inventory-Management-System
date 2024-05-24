<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Purchase</title>
    <link rel="stylesheet" href="style.css">
</head>
<style>
    /* Styling for Purchase Form */
    form#purchaseForm {
        width: 80%; /* Adjust as needed */
        max-width: 600px; /* Adjust as needed */
        background-color: #f2f2f2;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    form#purchaseForm label {
        display: block;
        margin-bottom: 5px;
        font-family: sans-serif;
    }

    form#purchaseForm input[type="text"],
    form#purchaseForm input[type="number"],
    form#purchaseForm input[type="date"],
    form#purchaseForm button {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 5px;
        box-sizing: border-box; /* Ensures padding and border are included in the element's total width and height */
    }

    form#purchaseForm button {
        background-color:  rgb(233, 183, 21);
        color: white;
        border: none;
        cursor: pointer;
        width: 30%;
        margin-left: 222px;
        margin-top: 10px;
        margin-bottom: 5px;
    }

    form#purchaseForm button:hover {
        background-color: rgb(220, 180, 19);
    }

    /* Centering the form */
    .container {
        margin-top: 30px;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }
    /* Popup message style */
    .popup {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: rgba(0, 0, 0, 0.8);
        color: white;
        padding: 20px;
        border-radius: 10px;
        display: none; /* Hidden by default */
    }

    .popup.show {
        display: block; /* Show when it has the "show" class */
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
        <li class="showOnMobile" onclick="showSidebar()"><a href="#">&#9776;</a></li>
    </ul>

    <ul class="sidebar">
        <li onclick="hideSidebar()"><a href="#" class="cross">&#x2715;</a></li>
        <li><a class="navlinks" href="index.jsp">Home</a></li>
        <li><a class="navlinks" href="mydetail.jsp">My details</a></li>
        <li><a class="navlinks" href="login.jsp">Log out</a></li>
    </ul>
</nav>
<!-- end: navBar -->

<!-- begin: hero -->

<div class="container">
    <!-- Purchase form -->
    <form id="purchaseForm" action="PurchaseServlet" method="post" >
        <label for="itemName">Item Name:</label>
        <input type="text" id="itemName" name="item_name" required>

        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" required>

        <label for="price">Price (Per Unit):</label>
        <input type="number" id="price" name="price" required>

        <label for="mfd">Manufactured Date:</label>
        <input type="date" id="mfd" name="mfd" required>

        <label for="exp">Expiry Date:</label>
        <input type="date" id="exp" name="exp" required>

        <button type="submit" onclick="purchaseItem()" >Add</button>
    </form>
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
