
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">

    <title>Home</title>
</head>
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

<div class="txt">
    <h1> Welcome To Stock
        Management System</h1>
</div>

<div class="hero">
    <div class="btns">
        <button class="btn-1"><a href="purchase.jsp">Purchases </a></button>
        <button class="btn-2"><a href="sale.jsp">Sales</a></button>
        <button class="btn-3"><a href="order.jsp">Orders</a></button>
        <button class="btn-1"><a href="purchase return.jsp">Purchases Return</a></button>
        <button class="btn-2"><a href="sale return.jsp">Sales Return</a></button>
        <button class="btn-3"><a href="stockServlet">Available Stocks</a></button>
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