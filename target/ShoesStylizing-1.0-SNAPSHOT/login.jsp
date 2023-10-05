
<%@page import="servlet.utility.LoginInsertError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log you in</title>
    <link rel="stylesheet" href="decors/login.css">
</head>
<body>
    <% LoginInsertError err = (LoginInsertError) request.getAttribute("LoginError"); %>
    <form class="form-main" name="frmLogin" action="MainController" method="post"> 
        <div class="sign-in">
            <a href="">SIGN-IN</a>
        </div>
       
        <div class="input-email">
            <p>Email:</p> <input type="text" name="txtUsername" />
            
        </div>
        <div class="input-password">
            <p>Password:</p> <input type="password" name="txtPassword" />
        </div>
        
        <% if (err != null) { %>
            <div class="input-email">
                <p style="color:red; font-size: 18px">Email or password incorrect! Please try again.</p>
            </div>
        <% } %>
        
        <div class="login">
            <button type="submit" name="btnSubmit" value="Login">LOGIN</button>
        </div>

        <div class="forgot">
            <ul>
                <li><a href="forgotPassword.jsp">Forgot your password?</a></li>
            </ul>
        </div>

        <div class="create">
            <ul><li><a href="register.jsp">Create an account</a></li></ul>
        </div>
    
    </form> 


    <div class="form-slogan">
        <h2>HAPS|SNEAKERS</h2>
        <p>CRAFTING FOOTWEAR TO YOUR <span>VERY</span> DESIRE</p>
    </div>
</body>
</html>