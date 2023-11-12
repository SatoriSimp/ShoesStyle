<%@page import="java.text.DecimalFormat"%>
<%@page import="servlet.registration.objects.Order"%>
<%@page import="servlet.utility.RegistrationDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="servlet.registration.objects.Cart"%>
<%@page import="servlet.registration.objects.Account"%>

<!DOCTYPE html>
<html lang="en">
<%
    Account acc = (Account) session.getAttribute("UserAccount");
    RegistrationDAO dao = new RegistrationDAO();    
%>

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
    <title>
        <% if (acc.getRole().equals("admin")) { %> 
        Admin page 
        <% } else { %> 
        Manager Page 
        <% } %>
    </title>
    <link rel="stylesheet" href="decors/adminStyle.css">
</head>

<body>
        <%          
            if (acc == null || (!acc.getRole().equals("admin") && !acc.getRole().equals("manager"))) {
            %>
            <script>
                alert("You are not permitted to view this page!");
                window.open('error.jsp', '_self');
            </script>
            <%
            } else {
        %>
    <div id="wrapper">
        <div id="header">
            <h1>Admin</h1>
            <img src="./img/Logo.svg" alt="HAPS|SNEAKERS." />

            <div id="userName">
                <i class="fa-solid fa-key" style="color: #0091ff;"></i>
                <%= acc.getStrUsername() %>
                <a href="MainController?btnSubmit=Logout">
                <i class="fa-solid fa-right-from-bracket"></i>
                </a>
            </div>
        </div>
    
    
        <div id="mainContent">
            <div id="menu">
                <% if (acc.getRole().equals("admin")) { %> 
                <button style="margin: 5% 0%;" id="userManagement" onclick="showUserManagement()">User Management</button>
                <% } else { %>
                <button style="margin: 5% 0%;" id="userManagement" disabled>User Management</button>
                <% } %>
                <button style="margin: 5% 0%;" id="orderManagement" onclick="showOrderManagement()">Order Management</button>
                <button style="margin: 5% 0%;" id="productManagement" onclick="showProductManagement()">Product Management</button>
            </div>
    
    
            <div class="content" id="user" style="display:<% if (acc.getRole().equals("admin")) { %>block<%} else {%>none<% } %>">
                <div class="contentChild">
                    <h1>Manage User</h1>
                    <button class="addButton">Add User</button>
                </div>
                <div class="contentChild">
                    <h1>User List</h1>
                    <div class="searchBarContainer">
                        <input type="text" placeholder="Search User" class="searchBar" id="searchUser">
                        <button type="submit" class="submitButton"><i class="fa fa-search" aria-hidden="true" style="color: white;"></i></button>
                    </div>
                </div>
                <div id="tableHolder">
                    <table class="table" id="tableUser">
                        <thead>
                        <% 
                            ArrayList<Account> AccountList = dao.getAccountList(); 
                            int cnt = 1;
                        %>
                            <th>No.</th>
                            <th>Email</th>
                            <th>Password</th>
                            <th>Phone number</th>
                            <th>Address</th>
                            <th>Edit</th>
                            <th>Delete</th>
                        </thead>
                        <tbody>
                        <% 
                            for (Account a : AccountList) { 
                        %>
                            <tr>
                                <td><%= cnt++ %></td>
                                <td><%= a.getStrUsername() %></td>
                                <td><%= a.getStrPassword() %></td>
                                <td><%= a.getStrPhonenumber()%></td>
                                <td><%= a.getStrAddress()%></td>
                                <td><a href="">Edit</a></td>
                                <td><a href="">Delete</a></td>
                            </tr>
                        <% } %>
                        </tbody>
                    </table>
                </div>
            </div>

            <% 
                ArrayList<Order> OrderList = dao.getOrderList(); 
                DecimalFormat fm = new DecimalFormat("#,###");
                cnt = 1;
            %>
            <div class="content" id="order" style="display:<% if (acc.getRole().equals("admin")) { %>none<%} else {%>block<% } %>">
                <div class="contentChild">
                    <h1>Manage Orders</h1>
                    <button class="addButton">Add Order</button>
                </div>
                
                <div class="contentChild">
                    <h1>Orders List</h1>
                    <div class="searchBarContainer">
                        <input type="text" placeholder="Search Product" class="searchBar" id="searchOrder">
                        <button title="search" class="submitButton" disabled=""><i class="fa fa-search" aria-hidden="true" style="color: white;"></i></button>
                    </div>
                </div>
                
                <div id="tableHolder">
                    <table class="table" id="tableOrder">
                        <thead>
                            <th>No.</th>
                            <th>ID</th>
                            <th>User<i class="fa-solid fa-sort"></i></button></th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Date</th>
                            <th>Payment</th>
                            <th>Delivery</th>
                            <th>Receiver</th>
                            <th>Address</th>
                            <th>Phone</th>
                            <th>Note</th>
                            <th>Status</th>
                            <th>Edit</th>
                            <th>Save</th>
                        </thead>
                        <tbody>
                        <% for (Order o : OrderList) { 
                            String urlRew = "MainController?btnSubmit=OrderStatus&orderID=" + o.getStrCartID() + "&account=" + o.getStrUserID(); 
                        %>
                            <tr>
                                <td><%= cnt++ %></td>
                                <td style="color:red;"><%= o.getStrCartID() %></td>
                                <td><%= o.getStrUserID() %></td>
                                <td><%= o.getQuantity() %></td>
                                <td><%= fm.format(o.getTotalPrice()) %></td>
                                <td><%= o.getDate() %></td>
                                <td><%= o.getPayment() %></td>
                                <td><%= o.getDelivery() %></td>
                                <td><%= o.getReceiver() %></td>
                                <td><%= o.getAddress() %></td>
                                <td><%= o.getPhone() %></td>
                                <td><%= o.getDate() %></td>
                                <td>
                                    <select name="<%=o.getStrCartID()%>" id="<%= o.getStrCartID() %>" disabled>
                                    <% switch (o.getStatus()) { 
                                        case "Pending approval":
                                    %>
                                            <option value="pending">Pending approval</option>
                                            <option value="approved">Approved</option>
                                            <option value="working">Working on products</option>
                                            <option value="finished">Finished - waiting for delivery</option>
                                            <option value="delivered">Delivered</option>
                                    <%
                                        break;
                                        case "Approved":
                                    %>
                                            <option value="approved">Approved</option>
                                            <option value="working">Working on products</option>
                                            <option value="finished">Finished - waiting for delivery</option>
                                            <option value="delivered">Delivered</option>                                    
                                    <%
                                        break;
                                        case "Working on products":
                                    %>
                                            <option value="working">Working on products</option>
                                            <option value="finished">Finished - waiting for delivery</option>
                                            <option value="delivered">Delivered</option>                                      
                                    <%
                                        break;
                                        case "Finished - waiting for delivery":
                                    %>
                                            <option value="finished">Finished - waiting for delivery</option>
                                            <option value="delivered">Delivered</option>                                        
                                    <%
                                        break;
                                        case "Delivered":
                                    %>
                                            <option value="delivered">Delivered</option>                                        
                                    <%
                                        break;
                                    }
                                    %>
                                    </select>
                                </td>
                                <td>
                                    <a title="Enable editing" id="edit_<%=o.getStrCartID() %>">
                                    <i class="fa-solid fa-pencil"></i>
                                    </a>
                                </td>
                                <td>
                                    <a title="Save changes" type="submit" href="javascript:submitForm('<%= o.getStrCartID() %>', '<%= urlRew %>')" id="save">
                                    <i class="fa-solid fa-check" style="background: #00ff66; padding: 5px 7px; border-radius: 5px; color: #ffffff;"></i>
                                    </a>
                                </td>
                            </tr>
                            <script>
                                document.getElementById('edit_<%=o.getStrCartID() %>').addEventListener('click', function() {
                                  document.getElementById('<%= o.getStrCartID() %>').disabled = false;
                                });
                            </script>
                        <% } %>
                        <script>
                            function submitForm(ID, URL) {
                                var final = URL + "&" + ID + "=" + document.getElementById(ID).value;
                                window.open(final, '_self');
                            };
                        </script>
                        </tbody>
                        </table>
                </div>
            </div>
                        
            <div class="content" id="product" style="display:none">
                <div class="contentChild">
                    <h1>Manage Product</h1>
                    <button class="addButton">Add Product</button>
                </div>
                
                <div class="contentChild">
                    <h1>Shoes List</h1>
                    <div class="searchBarContainer">
                        <input type="text" placeholder="Search Product" class="searchBar">
                        <button type="submit" class="submitButton"><i class="fa fa-search" aria-hidden="true" style="color: white;"></i></button>
                    </div>
                </div>
                
                <div id="tableHolder">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>ID</th>
                                <th>Model</th>
                                <th>Price</th>
                                <th>Edit</th>
                                <th>Delete</th>
                                </tr>
                        </thead>
                        <tbody>
                        <tr>
                        <td>helo</td>
                        <td>helo</td>
                        <td>helo</td>
                        <td>helo</td>
                        <td>helo</td>
                        <td>helo</td>
                        
                        </tbody>
                        </table>
                </div>
            </div>
        </div>
    </div>
    <script src="decors/Script/adminScript.js"></script>
    <script>
        window.onload = function() {
        <% if (acc.getRole().equals("manager")) { %>
            $.getScript("decors/Script/adminScript.js", function() {
                showOrderManagement();
            });
        <% } else { %>
            $.getScript("decors/Script/adminScript.js", function() {
                showUserManagement();
            });
        <% } %>
        };
    </script>
</body>
<% } %>
</html>