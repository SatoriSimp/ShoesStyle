<%-- 
    Document   : error
    Created on : Sep 24, 2023, 3:37:54 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Page not found!</title>
    </head>
    <body>
        <div style="display: inline-block; margin: 0 auto;">
            <h1>Oops!</h1>
            <h2>It seems like there's nothing to show here...</h2>
            <h3>Perhaps it's an error, we'll be fixing 'em soon!</h3>
            <button onclick="window.open('home.jsp', '_self')">Go to homepage</button>
        </div>
    </body>
</html>

<style>
    body {
        font-family: Tahoma;
        display: flex;
        margin: 0 auto;
        border: none;
        text-align: center;
        background-image: url('img/pattern.png');
        background-repeat: repeat;
        background-size: 20%;
    }
    
    body > div {
        background: white;
        padding: 0 5% 3% 5%;
        align-self: center;
        position: absolute;
        top: 15.7%;
        left: 27.3%;
        border-radius: 30px;
        border: black 8px double;
    }
    
    h1 {
        font-family: Times New Roman;
        font-size: 120px;
        background: -webkit-linear-gradient(#0040ff, #00d0ff);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }
    
    button {
        margin: 1%;
        color: white;
        border-radius: 25px;
        padding: 4%;
        background-color: blue;
        border: none;
        font-size: 20px;
        cursor: pointer;
    }
    
    button:hover {
        background-color: #008cff;
    }
</style>
