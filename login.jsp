<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Log in</title>

</head>
<style>
    @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');
    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: sans-serif;
    }
    body{
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        background:#EDB429;
    }
    .wrapper{
        position: relative;
        max-width: 430px;
        width: 100%;
        background: #fff;
        padding: 34px;
        border-radius: 6px;
        box-shadow: 0 5px 10px rgba(0,0,0,0.2);
    }
    .wrapper h2{
        position: relative;
        font-size: 22px;
        font-weight: 600;
        color: #333;
        text-align: center;
    }

    .wrapper form{
        margin-top: 30px;
    }
    .wrapper form .input-box{
        height: 52px;
        margin: 18px 0;
    }
    form .input-box input{
        height: 100%;
        width: 100%;
        outline: none;
        padding: 0 15px;
        font-size: 17px;
        font-weight: 400;
        color: #333;
        border: 1.5px solid #C7BEBE;
        border-bottom-width: 2.5px;
        border-radius: 6px;
        transition: all 0.3s ease;
    }
    .input-box input:focus,
    .input-box input:valid{
        border-color: #EDB429;
    }
    form .policy{
        display: flex;
        align-items: center;
        margin-top: -7px;
        margin-bottom: 30px;
        margin-left: 6px;
    }
    form h3{
        color: #707070;
        font-size: 14px;
        font-weight: 500;
        margin-left: 10px;
    }
    .input-box.button input{
        color: #fff;
        /*letter-spacing: 50px;*/
        border: none;
        background: #EDB429;
        cursor: pointer;
        width: 128px;
    }
    .input-box.button input:hover{
        background: #EDB429;
    }
    form .text h3{
        color: #333;
        width: 100%;
        text-align: center;
    }
    form .text h3 a{
        color: #EDB429;
        text-decoration: none;
    }

    .arrow{
        margin-top: -10px;
    }
    .s-btn {
        background: #EDB429;
        color: #ffff;
        border-radius: 8px;
        padding: 18px 35px;
        border: none;
        height: 56px;
        width: 131px;
        margin-left: 120px;
        text-decoration: none;
        font-size: 20px;
        font-weight: bold;
    }
    /*}*/
    /*.policy{*/
    /*    margin-left: ;*/
    /*}*/

</style>
<body>
<div class="wrapper">
<%--    <div class="arrow">--%>
<%--        <a href="login.jsp">--%>
<%--            <svg width="30" height="30" viewBox="0 0 69 69" fill="none" xmlns="http://www.w3.org/2000/svg">--%>
<%--                <path d="M61.4531 34.5C61.4531 35.3578 61.1123 36.1805 60.5058 36.787C59.8992 37.3936 59.0765 37.7344 58.2187 37.7344H18.5976L32.4839 51.6179C33.0915 52.2255 33.4329 53.0496 33.4329 53.9089C33.4329 54.7682 33.0915 55.5923 32.4839 56.1999C31.8763 56.8076 31.0522 57.1489 30.1929 57.1489C29.3336 57.1489 28.5095 56.8076 27.9019 56.1999L8.49561 36.7937C8.19408 36.4932 7.95483 36.1362 7.79159 35.743C7.62834 35.3499 7.54431 34.9284 7.54431 34.5027C7.54431 34.077 7.62834 33.6555 7.79159 33.2623C7.95483 32.8692 8.19408 32.5121 8.49561 32.2117L27.9019 12.8054C28.2027 12.5046 28.5599 12.2659 28.953 12.1031C29.3461 11.9402 29.7674 11.8564 30.1929 11.8564C30.6184 11.8564 31.0397 11.9402 31.4328 12.1031C31.8259 12.2659 32.183 12.5046 32.4839 12.8054C32.7848 13.1063 33.0234 13.4634 33.1862 13.8565C33.3491 14.2496 33.4329 14.6709 33.4329 15.0964C33.4329 15.5219 33.3491 15.9432 33.1862 16.3363C33.0234 16.7294 32.7848 17.0866 32.4839 17.3874L18.5976 31.2656H58.2187C59.0765 31.2656 59.8992 31.6064 60.5058 32.2129C61.1123 32.8195 61.4531 33.6422 61.4531 34.5Z" fill="black"/>--%>
<%--            </svg>--%>
<%--        </a>--%>
<%--    </div>--%>
    <h2>Log in</h2>
    <form action="LoginServlet" method="post">
        <div class="input-box">
            <input type="text" name="email" placeholder="Enter your email" required>
        </div>
        <div class="input-box">
            <input type="password" name="password" id="passwordInput" placeholder="Enter your password" required>
        </div>
        <br>
        <div class="policy">
            <input type="checkbox" id="showPasswordCheckbox">
            <h3>Show password</h3>
        </div>
        <div class="button input-box">
            <input type="submit" value="Log in" class="btn btn-secondary s-btn">
        </div>
        <div class="text">
            <h3>Don't have an account? <a href="register.jsp">Sign up</a></h3>
        </div>
    </form>
</div>
<script>
    // Get references to the password input and show password checkbox
    const passwordInput = document.getElementById('passwordInput');
    const showPasswordCheckbox = document.getElementById('showPasswordCheckbox');

    // Add event listener to the checkbox to toggle password visibility
    showPasswordCheckbox.addEventListener('change', function() {
        if (this.checked) {
            // If checkbox is checked, change input type to "text" to show password
            passwordInput.type = 'text';
        } else {
            // If checkbox is unchecked, change input type back to "password" to hide password
            passwordInput.type = 'password';
        }
    });
</script>
</body>
</html>