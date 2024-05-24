<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">

  <link rel="stylesheet" href="style.css">

  <title>Purchase Return</title>
</head>
<style>
  /* Add styles for the sale form */
  .container {
    margin-top: 30px;
    display: flex;
    flex-direction: column;
    align-items: center;
  }

  .container h1 {
    margin-bottom: 20px;
  }

  form#saleReturnForm {
    width: 80%;
    max-width: 400px;
    background-color: #f2f2f2;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin-top: 20px;
  }

  form#saleReturnForm label {
    display: block;
    margin-bottom: 5px;
  }

  form#saleReturnForm input[type="text"],
  form#saleReturnForm input[type="number"],
  form#saleReturnForm input[type="date"],
  form#saleReturnForm button {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ccc;
    border-radius: 5px;
    box-sizing: border-box;
  }

  form#saleReturnForm button {
    background-color: rgb(233, 183, 21);
    color: white;
    border: none;
    cursor: pointer;
    width: 30%;
    margin-left: 150px;
    margin-top: 10px;
    margin-bottom: 5px;
  }

  form#saleReturnForm button:hover {
    background-color: rgb(220, 180, 19);
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
  <h1>Sale Return</h1>
  <!-- Sale form -->
  <form id="saleReturnForm" action="SaleReturnServlet" method="post">
    <label for="itemName">Item Name:</label>
    <input type="text" id="itemName" name="item_name" required>

    <label for="quantity">Quantity:</label>
    <input type="number" id="quantity" name="quantity" required>

    <label for="date">Sold Date:</label>
    <input type="date" id="date" name="sold_date">

    <button type="submit" >Submit</button>
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
