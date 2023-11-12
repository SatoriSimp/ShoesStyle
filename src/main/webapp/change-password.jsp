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
        <title>Change password</title>
        <link rel="stylesheet" href="decors/change-password.css">
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
                        <a href="account.jsp">User information</a>
                        <a href="myCart.jsp">My order</a>
                        <a href="#">Change password</a>
                        <a href="MainController?btnSubmit=Logout">Log out</a>
                    </div>

                    <div class="form-main">
                        <form action="MainController" method="POST">
                            <div class="title">
                                <h3>Change password</h3>
                            </div>
                            <div class="text">
                                <p>Current password:<input type="password" name="oldPass" required></p>
                                <p>New password:<input type="password" name="newPass" required></p>
                                <p>Confirm password:<input type="password" name="newPass_confirm" required></p>
                            </div>

                    <% 
                        if (request.getAttribute("UpdateNoti") != null) {
                            switch ((String) request.getAttribute("UpdateNoti")) {     
                                case "success":
                    %>
                                <div class="details" style="color:green">Password updated successfully!</div>
                    <%
                                break;
                                case "confirmNotMatch":
                    %>
                                <div class="details" style="color:red">Confirm password does not match!</div>
                    <%
                                break;
                                case "oldPassNotMatch":
                    %>
                                <div class="details" style="color:red">Password is incorrect!</div>
                    <%
                                break;
                                case "passFormatIncorrect":
                    %>
                                <div class="details" style="color:red">Incorrect password format!</div>
                    <%
                                break;
                                default:
                    %>
                                <div class="details" style="color:red">Something went wrong, please try again!</div>
                    <%
                                break;    
                            }
                        }
                    %>
                            <div class="btn">
                                <div class="btn-cancel"><button type="button" onclick="window.open('account.jsp', '_self')">Cancel</button></div>
                                <div class="bnt-save"><button type="submit" name="btnSubmit" value="ChangePassword">Save</button></div>    
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
