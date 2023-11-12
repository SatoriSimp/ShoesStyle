
<%@page import="servlet.registration.objects.Cart"%>
<%@page import="servlet.registration.objects.Account"%>
<%@page import="servlet.registration.objects.Article"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>
<%@page contentType="text/html; charset=UTF-8" %>
<html lang="en">

    <head>
        <jsp:useBean id="ar" class="servlet.utility.RegistrationDAO" scope="request"/>
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
        <link rel="stylesheet" href="decors/home.css" />
        <title>Blog</title>
        <link rel="stylesheet" href="decors/blog.css">
    </head>

    <body>
        <%
            Account acc = (Account) session.getAttribute("UserAccount");
            Cart cart = acc == null ? null : acc.getUserCart();
            
        %>

            <nav class="navbar">
                <!-- Logo -->
                <img onclick="window.open('home.jsp'); cursor: pointer;" src="./img/Logo.svg" alt="HAPS|SNEAKERS." />

                <!-- Navigation -->
                <ul>
                    <li><a href="design.jsp">Design</a></li>
                    <li><a href="gallery.jsp">Gallery</a></li>
                    <li><a class="selected" href="#">Blog</a></li>
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

            <h1>Articles</h1>
            <%
                List<Article> listAr = (List<Article>) request.getAttribute("ListAr");
                Integer indexPage = (Integer) request.getAttribute("indexPage");


                if (listAr == null) {
                    listAr = new ArrayList<>(); 
                }
                if (indexPage == null) {
                    indexPage = 1;
                }
            %>
            <div class="posts">
                <% for (Article article : listAr) { %>
                <div class="card">
                    <div class="postimg">
                        <a href="<%= article.getLink() %>">
                            <img src="<%= article.getImage() %>" alt="" id="postimage">
                        </a>
                    </div>
                    <div class="content">
                        <a href="<%= article.getLink() %>" class="titleLink">
                            <h4 class="title"><%= article.getTitle() %></h4>
                        </a>
                        <h5 class="date"><%= article.getReleaseDate() %></h5>
                        <p class="description"><%= article.getDiscrip() %></p>
                    </div>
                    <button></button>
                </div>
                <% } %>

                <button id="surprise" onclick="location.href = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ&pp=ygUJcmljayByb2xs'">
                    Click for surprise !
                </button>
                <nav aria-label="...">
                    <ul class="pagination pagination-lg">
                        <% for (int i = 1; i <= ar.getNumberPage(); i++) { %>
                        <li class="page-item" <%= indexPage == i ? "active" : "" %>>
                            <a class="page-link" href="blog?index=<%= i %>"><%= i %></a>
                        </li>
                        <% } %>
                    </ul>
                </nav>
            </div>

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
    </body>

</html>