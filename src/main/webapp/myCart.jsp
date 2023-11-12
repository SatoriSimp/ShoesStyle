<%@page import="servlet.registration.objects.Order"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="servlet.registration.objects.Cart"%>
<%@page import="servlet.registration.objects.Account"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- <link rel="stylesheet" href="./assets/css/reset.css" /> -->
        <script
            src="https://kit.fontawesome.com/8a92f73d4a.js"
            crossorigin="anonymous"
        ></script>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@500;600;700;800&display=swap"
            rel="stylesheet"
        />
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
        />
        <!-- cdn -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
        />
        <link rel="stylesheet" href="decors/home.css">
        <link rel="stylesheet" href="decors/myCart.css">
    </head>
    <body>
    <%     
        Account acc = (Account) session.getAttribute("UserAccount");
        Cart cart = acc == null ? null : acc.getUserCart();
    %>
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
                        <a href="login.jsp" class="action-btn">
                            <i class="fas fa-user-alt fa-2xs" style="color: #ffffff;"></i>
                            <label>Account</label>
                        </a>
                        <% } else { %>
                        <a href="account.jsp" class="action-btn">
                            <i class="fas fa-user-alt fa-2xs" style="color: #ffffff;"></i>
                            <label style="font-size: 18px;"><%= acc.getStrUsername() %></label>
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

                <div class="menu">
                    <div class="info-personal">
                        <a href="#">User information</a>
                        <a href="myCart.jsp">My order</a>
                        <a href="change-password.jsp">Change password</a>
                        <% if (acc.getRole().equals("admin")) {%>
                        <a style="color: red;" href="admin.jsp">Admin page</a>
                        <% } %>
                        <a href="MainController?btnSubmit=Logout">Log out</a>
                    </div>

                    <div class="form-main">
                        <div class="title">
                            <h3>My Orders</h3>
                        </div>
                        <div class="form-2">

                     
                            <div class="view">
                                <p>
                                    View
                                    <select name="quality" id="quality" class="combobox">
                                        <option value="10"> 10</option>
                                        <option value="25">25</option>
                                        <option value="50">50</option>
                                        <option value="100">100</option>
                                    </select>
                                    latest orders
                                </p>
                            </div>

                            <div class="search"> 
                                <label for="">Search for order: </label> <input type="text">
                            </div>
                        </div>   
                        
                        <div class="form-3">
                            <% 
                                ArrayList<Order> Orders = acc.getUserOrders();
                                DecimalFormat fmt = new DecimalFormat("#,###");
                                int cnt = 1;
                            %>
                            <table>
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>ID</th>
                                        <th>Price</th>
                                        <th>Date</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <% for (Order o : Orders) { %>
                                    <tr>
                                        <td><%= cnt++ %></td>
                                        <td><%= o.getStrCartID() %></td>
                                        <td><%= fmt.format(o.getTotalPrice()) %></td>
                                        <td><%= o.getDate() %></td>
                                        <td><%= o.getStatus() %></td>
                                    </tr>
                                <% } %>
                                </tbody>
                            </table>
                        </div>
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
