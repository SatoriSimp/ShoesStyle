<%@page import="servlet.registration.objects.Cart"%>
<%@page import="servlet.registration.objects.Account"%>
<%@ page contentType="text/html; charset=UTF-8" %>
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
        <link rel="stylesheet" href="decors/payment.css" />
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
                <li><a class="selected" href="#">Guidelines</a></li>
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
   
        <div class="guides">
            <div class="title">
                <h2>Payment guidelines</h2>
                <div class="details">
                    <div class="details-1">                       
                        <h4>Order's total</h4>
                        <div class="moc-1">
                            <p> Less than 3,000,000 VND </p>
                        </div>
                        <div class="moc-2 moc-title">
                            <p> More than 3,000,000 VND</p>
                        </div>
                        
                    </div>
                    <div class="details-2">
                        <h4>Payment method</h4>
                        <div class="moc-1">
                            <p>- Payment in cash when your order is delivered</p>
                            <p>- Digital payment (either pay after receiving order or in advance)</p>
                            <p>- Your order will be charged additional shipping fee of 70,000 VND</p>
                        </div>
                        <div class="moc-2">
                            <p>- Payment in cash when your order is delivered</p>
                            <p>- Digital payment (either pay after receiving order or in advance)</p>
                            <p>- Your shipping fee is free of charge!</p>
                        </div>
                    
                    </div>
                </div>
                <div class="title-2">
                    <h3>In case you'd like to perform payment in advance, you can choose one of these following methods:</h3>
                </div>
                <div class="content">
                    <h4>1. Digital bank transfer.</h4>
                    <p>Transfer your order's total to the bank account below.</p>
                    <p>After you have done, please make sure to send us a SMS message or email with the following format: "Dear HAPS Sneakers, I have paid [Your order's total] for the order with ID [Your order's ID]" so we can confirm your order as soon as possible!</p>
                </div>
                <div class="content-2">
                    <h4>2.Thanh toán qua ngân hàng</h4>
                    <p>Quý Khách hãy vào tr?c ti?p chi nhánh/phòng giao d?ch m?t trong các ngân hàng sau ?ây ?? g?i ti?n (không c?n ph?i có tài kho?n ? ngân hàng).</p>
                </div>

                <div class="table-bank">
                    <div class="bank-title">
                        <h4>Bank</h4>
                        
                        <h4>Owner</h4>
                        <h4>Bank account number</h4>
                        <h4>Agency</h4>
                    </div>
                    <div class="bank-1">
                        <img src="./img/bank1.jpg" alt="Techcom bank">
                        <p>Tran Duc Sang</p>
                        <p>0906127760</p>
                        <p>Any</p>
                    </div>
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
