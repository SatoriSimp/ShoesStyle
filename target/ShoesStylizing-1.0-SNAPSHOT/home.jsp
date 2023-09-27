<%-- 
    Document   : home
    Created on : Sep 25, 2023, 8:42:03 PM
    Author     : Dell
--%>

<%@page import="servlet.registration.account.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home page</title>
    <link rel="stylesheet" href="decors/home.css">
</head>
<body>
    <% Account acc = (Account) request.getAttribute("UserAccount"); %>
    <div class="logo">
        <button onclick="#">HAPS|SNEAKERS</button>
    </div> 
    <ul class="menu"> 
        <li><a href="#">Design</a></li>
        <li><a href="#">Gallery</a></li>
        <li><a href="#">Blog</a></li>
        <li><a href="#">Guides</a></li> 
    </ul>
    
    <div class="account">
        <% if (acc == null || acc.getStrUsername().isEmpty()) { %>
            <button onclick="window.open('login.jsp', '_self')">Log-in</button>
        <% } else { %>
            <button onclick=""><%= acc.getStrUsername() %></button>
        <% } %>
    </div>

    <div class="slogan-background">
        <div class="slogan-form">
            <div class="slogan"><p>CRAFTING FOOTWEAR TO YOUR <span>VERY</span> DESIRE</p></div>
        </div>  
    </div>
</body>
</html>
