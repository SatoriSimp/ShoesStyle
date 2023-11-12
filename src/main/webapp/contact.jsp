<%@page import="servlet.registration.objects.Account"%>
<%@page import="servlet.registration.objects.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <script src="https://kit.fontawesome.com/8a92f73d4a.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
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
        <link rel="stylesheet" href="decors/blog.css"/>
        <link rel="stylesheet" href="decors/contact.css"/>
        <title>Shoes Stylize</title>
    <body>
        <nav class="navbar">
            <!-- Logo -->
            <img src="./img/Logo.svg" alt="HAPS|SNEAKERS." />

            <!-- Navigation -->
            <ul>
                <li><a href="design.jsp">Design</a></li>
                <li><a href="gallery.jsp">Gallery</a></li>
                <li><a href="blog.jsp">Blog</a></li>
                <li><a href="guide.jsp">Guidelines</a></li>
                <li><a class="selected" href="#">About us</a></li>
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
                    <label style="font-size: 16px;"><%= acc.getStrUsername() %></label>
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
        <div class="map">
            <div class="map-iframe">       
            <iframe
            src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3918.1749384527016!2d106.80221035847941!3d10.874295455817615!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x317527d8d00bace5%3A0x10e70e4afa1d2c40!2sSKY%209%2C%20Block%20CT3!5e0!3m2!1svi!2s!4v1697441997624!5m2!1svi!2s"
            width="600"
            height="450"
            style="border: 0"
            allowfullscreen=""
            loading="lazy"
            referrerpolicy="no-referrer-when-downgrade"
           ></iframe>
            </div>
        </div>

        <div class="info">
            <div class="info-address">
                <h2>FPT Shoes Fashion</h2>
            </div>
            <div class="info-address-detail">
                <h3>Thông tin liên hệ</h3>
                <p>Địa chỉ: tòa nhà Sky 9, 30 đường số 1, khu phố 2, phường Phú Hữu, Tp.Thủ Đức</p>
                <p>ĐT: 0332079769</p>
                <p>Email: hapssneakers@gmail.com</p>
                <p>Chat Facebook: HAPS Sneakers Store</p>
                <h3>Giờ làm việc</h3>
                <p>09h-18h Thứ 2 - Thứ 7</p>
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
</html>
