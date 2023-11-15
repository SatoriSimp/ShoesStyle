<%@page import="servlet.utility.RegistrationDAO"%>
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
        <title>Order history</title>
        <link rel="stylesheet" href="decors/home.css">
        <link rel="stylesheet" href="decors/myCart.css">
    </head>
    <body>
    <%     
        Account acc = (Account) session.getAttribute("UserAccount");
        Cart cart = acc == null ? null : acc.getUserCart();
        RegistrationDAO dao = new RegistrationDAO();
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
                        <a href="account.jsp">User information</a>
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
                                        <option value="10">10</option>
                                        <option value="25">25</option>
                                        <option value="50">50</option>
                                        <option value="100">100</option>
                                    </select>
                                    latest orders
                                </p>
                            </div>

                            <div class="search"> 
                                <label for="">Search for order: </label> <input type="text" id="searchOrder">
                            </div>
                        </div>   
                        
                        <div class="form-3">
                            <% 
                                ArrayList<Order> Orders = acc.getUserOrders();
                                DecimalFormat fmt = new DecimalFormat("#,###");
                                int cnt = 1;
                            %>
                            <table id="tableOrder">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th> ID </th>
                                        <th>Total (VND)</th>
                                        <th>Date</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                <% 
                                    for (Order o : Orders) { 
                                %>
                                    <tr>
                                        <td><%= cnt++ %></td>
                                        <td style="font-weight: bold; color: #0066ff"><%= o.getStrCartID() %></td>
                                        <td><%= fmt.format(o.getTotalPrice()) %></td>
                                        <td><%= o.getDate() %></td>
                                        <td><%= o.getStatus() %></td>
                                        <td>
                                    <% 
                                        if (o.getStatus().equals("Delivered") && dao.getFeedback(o.getStrCartID()) == null) { 
                                    %>
                                            <button type="button" onclick="document.getElementById('<%= o.getStrCartID() %>').style.display = 'flex'">
                                                <i class="fa-solid fa-comment"></i>Feedback
                                            </button>
                                    <% } else if (o.getStatus().equals("Delivered") && dao.getFeedback(o.getStrCartID()) != null) { %>
                                            <button type="button" style="font-size: 12px; background: #00cc00;">
                                                <i class="fa-solid fa-check"></i>Feedback sent
                                            </button>                                    
                                    <% } else if (o.getStatus().equals("Pending approval") || o.getStatus().equals("Approved")) {%> 
                                            <button type="button" class="cancel" onclick="document.getElementById('cnl_<%= o.getStrCartID() %>').style.display = 'flex'">
                                                <i class="fa-solid fa-xmark"></i>Cancel order
                                            </button>
                                    <% } else if (o.getStatus().equals("Cancelled")) {%> 
                                            <button type="button" style="color: white; background-color: #ff9999;" disabled>
                                                <i class="fa-solid fa-trash"></i>Cancelled
                                            </button>
                                    <% } else { %>
                                            <button type="button" style="color: #999999; background-color: lightgray;" disabled>
                                                Unavailable
                                            </button>
                                    <% } %>
                                        </td>
                                    </tr>
                                <div style="display: none;" class="overlay" id="<%= o.getStrCartID() %>">
                                    <form action="MainController?btnSubmit=Feedback&OrderID=<%=o.getStrCartID()%>" id="frm<%=o.getStrCartID()%>" method="post">
                                    <div>
                                        <h2>Feedback for order: <span style="color:red; font-style: italic"><%= o.getStrCartID() %></span></h2>
                                        <br>
                                        <label>How do you feel about the products?</label>
                                        <select name="slc<%=o.getStrCartID()%>">
                                            <option value="awesome">They are awesome!</option>
                                            <option value="ok">They are generally fine, but there are some issue</option>
                                            <option value="notok">I don't like them</option>
                                            <option value="refund">It's bad and I want my money back</option>
                                        </select>
                                        <br>
                                        <p>Provide some details about it (optional):</p>
                                        <br>
                                        <textarea 
                                            name="txt<%=o.getStrCartID()%>" type="text" spellcheck="false" rows="15" cols="76">
                                        </textarea>
                                        <br>
                                        <p>Include some images of the products if you want (up to 3):</p>
                                        <input class="imgUpload" type="file" accept="image/*,.mp4" />
                                        <br>
                                        <input class="imgUpload" type="file" accept="image/*,.mp4" />
                                        <br>
                                        <input class="imgUpload" type="file" accept="image/*,.mp4" />
                                        <div class="btns">
                                            <button 
                                                style="background:#ff3333" type="button" onclick="document.getElementById('<%= o.getStrCartID() %>').style.display = 'none'">
                                                Cancel
                                            </button>
                                            <button 
                                                style="background:#00cc00" type="button" onclick="submitForm('frm<%=o.getStrCartID()%>')">
                                                Send feedback
                                            </button>
                                        </div>
                                    </div>
                                    </form>
                                </div>
                                
                                <div style="display: none;" class="overlay" id="cnl_<%= o.getStrCartID() %>">
                                    <form action="MainController?btnSubmit=Cancel&OrderID=<%=o.getStrCartID()%>" method="post">
                                    <div style="height: 40%; padding: 1% 4%; text-align: center">
                                        <h2>Cancel this order: 
                                            <span style="color:red; font-style: italic"><%= o.getStrCartID() %></span> ?
                                        </h2>
                                        <p style="font-weight: bold">Please not that this action can not be undone!</p>
                                        <p style="font-style: italic">If you have already paid for this order, we will refund 100% its value as soon as possible!
                                            <br>This progress can take up to 72 hours!
                                            <br>In case the refund progress takes longer than expected, please let us know via email.
                                        </p>
                                        <div class="btns">
                                            <button 
                                                style="background:#00cc00" type="button" onclick="document.getElementById('cnl_<%= o.getStrCartID() %>').style.display = 'none'">
                                                I've changed my mind
                                            </button>
                                            <button 
                                                style="background:#ff3333" type="submit">
                                                Yes, please cancel this order!
                                            </button>
                                        </div>
                                    </div>
                                    </form>
                                </div>
                                <% } %>
                                </tbody>
                            </table>
                        </div>
                        <p style="font-style: italic; color: #999999">
                            *Notes: Cancellation can not be done when the order has already been worked on!
                        </p>
                    </div>
                </div>
                <script>
                    function submitForm(ID) {
                        let frm = document.getElementById(ID);
                        frm.submit();
                    };
                </script>
            </div>
            <% if (request.getAttribute("Notif") != null) { %>
                <% if (request.getAttribute("Notif").equals("Success")) { %>
                <div class="overlay" id="overlay" style="display: block;">
                    <div style="justify-content: center; padding: 2% 5% 7% 5%; height: 20%; margin-top: 15%; margin-left: 32%">
                        <h1><i class="fa-solid fa-circle-check fa-sm" style="color: #0008ff;"></i> Feedback sent successfully!</h1>
                        <div class="btns">
                            <button class="overlay-button" style="background: #00c962; margin: 10% auto; padding: 3% 6%;" onclick="document.getElementById('overlay').style.display = 'none'">
                                Got it!
                            </button>
                        </div>
                    </div>
                </div>
                <% } else { %>
                <div class="overlay" id="overlay" style="display: block">
                    <div style="justify-content: center; padding: 2% 5% 7% 5%; height: 20%; margin-top: 15%; margin-left: 32%">
                        <h1><i class="fa-solid fa-circle-check fa-sm" style="color: #0008ff;"></i> Something went wrong, please try again ):</h1>
                        <div class="btns">
                            <button class="overlay-button" style="background: #00c962; margin: 10% auto; padding: 3% 6%;" onclick="document.getElementById('overlay').style.display = 'none'">Cancel!</button>
                        </div>
                    </div>
                </div>
            <% } } %>
            
            <% if (request.getAttribute("Cancel") != null) { %>
                <% if (request.getAttribute("Cancel").equals("Success")) { %>
                <div class="overlay" id="overlay" style="display: block">
                    <div style="justify-content: center; padding: 2% 5% 3% 5%; height: 20%; margin-top: 15%; margin-left: 35%">
                        <h1><i class="fa-solid fa-circle-check fa-sm" style="color: #ff3333;"></i> Order cancelled!</h1>
                        <div class="btns">
                            <button class="overlay-button" style="background: #ff3333; margin: 10% auto; padding: 3% 6%;" onclick="document.getElementById('overlay').style.display = 'none'">Got it!</button>
                        </div>
                    </div>
                </div>
                <% } else { %>
                <div class="overlay" id="overlay" style="display: block">
                    <div style="justify-content: center; padding: 2% 5% 7% 5%; height: 20%; margin-top: 15%; margin-left: 32%">
                        <h1><i class="fa-solid fa-circle-check fa-sm" style="color: #0008ff;"></i> Something went wrong, please try again ):</h1>
                        <div class="btns">
                            <button class="overlay-button" style="background: #00c962; margin: 10% auto; padding: 3% 6%;" onclick="document.getElementById('overlay').style.display = 'none'">Cancel!</button>
                        </div>
                    </div>
                </div>
            <% } } %>
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
 
    <script>
        let orderSearch = document.getElementById('searchOrder');
        orderSearch.addEventListener("keyup", filterTableOrder);

        function filterTableOrder() {
            // Get input value and convert to uppercase for case-insensitive search
            let filterValue = orderSearch.value.toUpperCase();

            // Get table element
            let table = document.getElementById('tableOrder');

            // Get tbody element
            let tbody = table.getElementsByTagName('tbody')[0];

            // Get all tr elements from the tbody
            let tr = tbody.getElementsByTagName('tr');

            // Loop through all table rows
            for(let i = 0; i < tr.length; i++) {
                // Get all th elements from each row
                let td = tr[i].getElementsByTagName('td');

                // Check if the row has at least two th elements
                if(td.length > 1) {
                    // Get the innerHTML of the second th element
                    let secondThValue = td[1].innerHTML.toUpperCase();

                    // If the second th element contains the search term, show the row, else hide it
                    if(secondThValue.indexOf(filterValue) > -1) {
                        tr[i].style.display = '';
                    } else {
                        tr[i].style.display = 'none';
                    }
                }
            }
        };
    </script>
</html>
