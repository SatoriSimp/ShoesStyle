<%@page import="servlet.registration.objects.Cart"%>
<%@page import="servlet.registration.objects.Account"%>
<!DOCTYPE html>
<html lang="en">
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
        <link rel="stylesheet" href="decors/home.css">
        <link rel="stylesheet" href="decors/info-user.css">
        <title>Account management</title>
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

                <div class="menu">
                    <div class="info-personal">
                        <a href="#">User information</a>
                        <a href="myCart.jsp">My order</a>
                        <a href="change-password.jsp">Change password</a>
                        <% if (acc.getRole().equals("admin") || acc.getRole().equals("manager")) {%>
                        <a style="color: red;" href="admin.jsp">Web manage page</a>
                        <% } %>
                        <a href="MainController?btnSubmit=Logout">Log out</a>
                    </div>

                    <div class="form-main">
                        <form action="MainController" method="POST">
                        <div class="title">
                            <h3>My information</h3>
                        </div>
                        <div class="text">
                            <div class="details">
                            <label>Email:</label>
                                <input type="text" name="userEmail" value="<%= acc.getStrUsername() %>" disabled/>
                            </div>
                            <div class="details">
                                <label>Phone number:</label>
                                <input type="text" name="updPhone" value="<%= acc.getStrPhonenumber() %>" required>
                            </div>
                            <div class="details">
                                <label>Address:</label>
                                <input type="text" name="updAddress" value="<%= acc.getStrAddress() %>" required>
                             </div>
                             
                            <% 
                                if (request.getAttribute("UpdateNoti") != null) {
                                    if (request.getAttribute("UpdateNoti").equals("success")) { %>
                                    <div class="details" style="color:green">Information updated successfully!</div>
                            <%      
                                    }
                                    else { %>
                                    <div class="details" style="color:red">Something went wrong, please try again!</div>
                            <%
                                    }
                                }
                            %>
                        </div>

                        <div class="btn">
                            <div class="bnt-save">
                                <button type="submit" name="btnSubmit" value="Update">Update information</button>
                            </div>    
                        </div>
                        </form>
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
