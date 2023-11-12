<%-- 
    Document   : order-comepleted
    Created on : Nov 3, 2023, 3:22:09 PM
    Author     : Dell
--%>

<%@page import="servlet.registration.objects.Cart"%>
<%@page import="servlet.registration.objects.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/8a92f73d4a.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@500;600;700;800&display=swap"
            rel="stylesheet"
        />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
        <!-- cdn -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        />
        <!-- <link rel="stylesheet" href="./assets/fonts/stylesheet.css" /> -->
        <link rel="stylesheet" href="decors/home.css" />
        <title>Shoes Stylize</title>
    </head>
    <%     
        Account acc = (Account) session.getAttribute("UserAccount");
        Cart cart = acc == null ? null : acc.getUserCart();
    %>
    <body>
            <!-- Header -->
        <div class="header">
            <div class="content">
                <nav class="navbar">
                    <!-- Logo -->
                    <img src="./img/Logo.svg" alt="HAPS|SNEAKERS." />

                    <!-- Navigation -->
                    <ul>
                        <li><a href="design.jsp">Design</a></li>
                        <li><a href="gallery.jsp">Gallery</a></li>
                        <li><a href="blog.jsp">Blog</a></li>
                        <li><a href="guide.jsp">Guidelines</a></li>
                        <li><a href="contact.jsp">About us</a></li>
                    </ul>

                    <!-- Action -->
                    <div class="action">
                        <% if (acc == null) { %>
                        <a href="login.jsp" class="btn action-btn">
                            <i class="fas fa-user-alt fa-2xs" style="color: #ffffff;"></i>
                            <label style="font-size: 20px;">Account</label>
                        </a>
                        <% } else { %>
                        <a href="account.jsp" class="btn action-btn">
                            <i class="fas fa-user-alt fa-2xs" style="color: #ffffff;"></i>
                            <label style="font-size: 16px; margin-bottom: 20px;"><%= acc.getStrUsername() %></label>
                        </a>
                        <% } %>
                    </div>

                    <button class="cart" onclick="window.open('cart.jsp', '_self')">
                        <i class="fa fa-shopping-cart"></i>
                        <div style="position: relative; font-size: 18px; 
                             font-weight: bolder;
                             color: white; background: #0066ff; 
                             border-radius: 5px; padding: 5%;
                             margin-top: 10%; margin-left: 5%">
                            <% if (cart == null) { %> 
                            0
                            <% } else { %>
                            <%= cart.getQuantity() %>
                            <% } %>
                        </div>
                    </button>
                </nav>
            </div>
        </div>
        
        <div class="noti">
        
        <div>
            <h1>
                Your order has been sent!
            </h1>
            <h2>You might have received a confirmation mail as for now, please check your email for details.</h2>
            <h3>
                If you're not sure about how to pay your order, you might want to take a look at our 
                <a href='guide.jsp'>order payment guidelines</a> right here.
            </h3>
            <h3>
                If you have any problem and/or question regarding to this order, 
                please reach out to us by replying the email above within 48 hours!
            </h3>
            <h1 style='font-size: 30px'>
                Thank you for purchasing at HAPS Sneakers!
            </h1>
            <button onclick="window.open('home.jsp','_self')">Continue shopping</button>
        </div>
        </div>
                     
    </body>
    <footer>
        <div>
        <p>Contact us via</p>
        <button>
            <i class="fa fa-facebook"></i> 
            Facebook
        </button>
        <button>
            <i class="fa fa-youtube-play"></i> 
            Youtube
        </button>
        <button>
            <i class="fa fa-envelope"></i>
            Email
        </button>
        </div>
    </footer>
    <style>
    .noti > div {
        background: white;
        width: 70%;
        height: 60%;
        display: block;
        align-self: center;
        padding: 2% 4%;
        padding-bottom: 5%;
        margin: 0 auto;
        margin-top: 5%;
        border: black solid 2px;
        border-radius: 15px;
        text-align: center;
    }
    
    h1 {
        text-align: center; 
        font-family: tahoma;
        font-size: 56px;
        background: -webkit-linear-gradient(#0040ff, #00d0ff);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }
    
    h2, h3 {
        font-weight: normal;
    }
    
    .noti {
        background-image: url('img/pattern.png');
        background-repeat: repeat;
        background-size: 20%;
        padding: 1%;
        border-top: black solid 5px;
        margin-top: 1.5%;
        justify-content: center;
        font-weight: normal;
        padding: 0 10%;
        padding-bottom: 5%;
    }
    
    .noti button {
        background: #0066ff;
        padding: 1% 2%;
        color: white;
        border-radius: 5px;
        border: black solid 1px;
        font-size: 16px;
        margin-top: 3%;
    }
   
    button:hover {
        cursor: pointer;
    }
    </style>
</html>

