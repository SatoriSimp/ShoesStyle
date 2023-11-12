<%@page import="servlet.registration.objects.Cart"%>
<%@page import="servlet.registration.objects.Account"%>

<!DOCTYPE html>
<html lang="en">
    <%     
        Account acc = (Account) session.getAttribute("UserAccount");
        Cart cart = acc == null ? null : acc.getUserCart();
    %>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- <link rel="stylesheet" href="./assets/css/reset.css" /> -->
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
    <body>
        <main>
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

                    <div class="hero">
                        <div class="info">
                            <div class="background-img">
                                <p class="desc">
                                    Crafting Footwear to Your
                                    <span>Very</span> Desire
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
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
</html>
