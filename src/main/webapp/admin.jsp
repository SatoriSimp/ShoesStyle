<%@page import="java.util.HashMap"%>
<%@page import="servlet.registration.objects.Vans"%>
<%@page import="servlet.registration.objects.AirForce1"%>
<%@page import="servlet.registration.objects.Converse"%>
<%@page import="servlet.registration.objects.Jordan1"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="servlet.registration.objects.Shoes"%>
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
        final Cart getShoesSold = dao.getShoesList();
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
        <!-- piechart -->
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {

<% 
        int jr1 = 0, af1 = 0, cv = 0, v = 0, bm = 0;

        for (Entry<Shoes, Integer> s : getShoesSold.getItemList().entrySet()) {
            if (s.getKey() instanceof Jordan1) {
                jr1 += s.getValue();
            }
            else if (s.getKey() instanceof AirForce1) {
                af1 += s.getValue();
            }
            else if (s.getKey() instanceof Converse) {
                cv += s.getValue();
            }
            else if (s.getKey() instanceof Vans) {
                v += s.getValue();
            }
            else {
                bm += s.getValue();
            }
        }
%>
                // chart values
                var data = google.visualization.arrayToDataTable([
                    ['Shoes', 'Sold'],
                    ['Jordan 1', <%= jr1 %>],
                    ['Air Force 1', <%= af1 %>],
                    ['Converse', <%= cv %>],
                    ['Vans', <%= v %>],
                    ['Blazer Mid', <%= bm %>]
                ]);

                //set styles for chart
                var options = {
                    width: 450,
                    height: 400,
                    pieSliceText: 'none',
                    titleTextStyle: {
                        fontSize: 25 // specify your desired size here
                    },
                    title: 'Model Sale Count'
                };

                var chart = new google.visualization.PieChart(document.getElementById('piechart'));

                chart.draw(data, options);
            }
        </script>
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
                <h1>Manage</h1>
                <img src="./img/Logo.svg" alt="HAPS|SNEAKERS." />

                <div id="userName">
                    <i class="fa-solid fa-key" style="color: #0091ff;"></i>
                    <%= acc.getStrUsername()%>
                    <a href="home.jsp">
                        <i class="fa-solid fa-right-from-bracket"></i>
                    </a>
                </div>
            </div>


            <div id="mainContent">
                <div id="menu">
                    <% if (acc.getRole().equals("admin")) { %> 
                    <button style="margin: 5% 0%;" id="userManagement" onclick="showUserManagement()">User Management</button>
                    <% } else { %>
                    <button style="margin: 5% 0%; display: none;" id="userManagement" disabled>User Management</button>
                    <% } %>
                    <button style="margin: 5% 0%;" id="orderManagement" onclick="showOrderManagement()">Order Management</button>

                    <button style="margin: 5% 0%;" id="analyticsView" onclick="showAnalytics()">Analytic</button>
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
                            <th>Role</th>
                            <th>Phone number</th>
                            <th>Address</th>
                            <th>Delete</th>
                            </thead>
                            <tbody>
                                <%
                                    for (Account a : AccountList) {
                                %>
                                <tr>
                                    <td><%= cnt++%></td>
                                    <td><%= a.getStrUsername()%></td>
                                    <td><%= a.getStrPassword()%></td>
                                    <td><%= a.getRole() %></td>
                                    <td><%= a.getStrPhonenumber()%></td>
                                    <td><%= a.getStrAddress()%></td>
                                    <td>
                                        <a href="MainController?btnSubmit=Delete&mail=<%= a.getStrUsername() %>"
                                           style="padding: 10% 15%; font-size: 14px; text-decoration: none; color: white; background: #ff6666; border: none; border-radius: 5px">
                                            Delete</a>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>

                <%
                    ArrayList<Order> OrderList = dao.getOrderList();
                    HashMap<String, ArrayList<String>> Feedbacks = new HashMap<>();
                    for (Order order : OrderList) {
                        ArrayList<String> feedback = dao.getFeedback(order.getStrCartID());
                        if (feedback != null) {
                            Feedbacks.putIfAbsent(order.getStrCartID(), feedback);
                        }
                    }
                    DecimalFormat fm = new DecimalFormat("#,###");
                    cnt = 1;
                %>
                <div class="content" id="order" style="display:<% if (acc.getRole().equals("admin")) { %> none <%} else {%>block<% } %>">
                    <div class="contentChild">
                        <h1>Manage Orders</h1>
                        <button class="addButton">Add Order</button>
                    </div>

                    <div class="contentChild">
                        <h1>Orders List</h1>
                        <div class="searchBarContainer">
                            <input type="text" placeholder="Search Product" class="searchBar" id="searchOrder">
                            <button type="submit" class="submitButton"><i class="fa fa-search" aria-hidden="true" style="color: white;"></i></button>
                        </div>
                    </div>

                    <div id="tableHolder">
                        <table class="table" id="tableOrder">
                            <thead>
                            <th>No.</th>
                            <th>ID</th>
                            <th>User</th>
                            <th>Quantity</th>
                            <th>Price (VND)</th>
                            <th>Date</th>
                            <th>Payment</th>
                            <th>Delivery</th>
                            <th>Receiver</th>
                            <th>Address</th>
                            <th>Phone</th>
                            <th>Note</th>
                            <th>Status</th>
                            <th>Feedback</th>
                            <th>Edit</th>
                            <th>Save</th>
                            </thead>
                            <tbody>
                                <% for (Order o : OrderList) {
                                        String urlRew = "MainController?btnSubmit=OrderStatus&orderID=" + o.getStrCartID() + "&account=" + o.getStrUserID();
                                %>
                                <tr>
                                    <td><%= cnt++%></td>
                                    <td style="color:red;">
                                        <%= o.getStrCartID()%>
                                        <% if (Feedbacks.containsKey(o.getStrCartID())) { %>
                                        <i title="Feedback available" class="fa-solid fa-circle fa-2xs" style="color: #00bd2f;"></i>
                                        <% } %>
                                    </td>
                                    <td><%= o.getStrUserID()%></td>
                                    <td><%= o.getQuantity()%></td>
                                    <td><%= fm.format(o.getTotalPrice())%></td>
                                    <td><%= o.getDate()%></td>
                                    <td><%= o.getPayment()%></td>
                                    <td><%= o.getDelivery()%></td>
                                    <td><%= o.getReceiver()%></td>
                                    <td><%= o.getAddress()%></td>
                                    <td><%= o.getPhone()%></td>
                                    <td><%= o.getDate()%></td>
                                    <td style="text-align: center;">
                                        <select name="<%=o.getStrCartID()%>" id="<%= o.getStrCartID()%>" disabled>
                                            <% switch (o.getStatus()) {
                                                    case "Pending approval":
                                            %>
                                                <option value="pending">Pending approval</option>
                                                <option value="approved">Approved</option>
                                                <option value="working">Working on products</option>
                                                <option value="finished">Waiting for delivery</option>
                                                <option value="delivered">Delivered</option>
                                            <%
                                                    break;
                                                case "Approved":
                                            %>
                                                <option value="approved">Approved</option>
                                                <option value="working">Working on products</option>
                                                <option value="finished">Waiting for delivery</option>
                                                <option value="delivered">Delivered</option>                                    
                                            <%
                                                    break;
                                                case "Working on products":
                                            %>
                                                <option value="working">Working on products</option>
                                                <option value="finished">Waiting for delivery</option>
                                                <option value="delivered">Delivered</option>                                      
                                            <%
                                                    break;
                                                case "Waiting for delivery":
                                            %>
                                                <option value="finished">Waiting for delivery</option>
                                                <option value="delivered">Delivered</option>                                        
                                            <%
                                                    break;
                                                case "Delivered":
                                            %>
                                                <option value="delivered">Delivered</option>                                        
                                            <%
                                                        break;
                                                    default:
                                            %>
                                                <option value="cancelled">Cancelled</option>                                        
                                            <%
                                                }
                                            %>
                                        </select>
                                    </td>
                                    <td style="text-align: center;">
                                        <% if (Feedbacks.containsKey(o.getStrCartID())) { %>
                                            <button type="button" 
                                                    style="text-align: center; padding: 5% 0; width: 100%; border-radius: 5px; background: #00cc00; color: white"
                                                    onclick="document.getElementById('fb_<%= o.getStrCartID() %>').style.display = 'block'">
                                                View
                                            </button>
                                        <% } else { %>
                                            Not received
                                        <% } %>
                                    </td>
                                    <td>
                                        <a title="Enable editing" id="edit_<%=o.getStrCartID()%>">
                                            <i class="fa-solid fa-pencil"></i>
                                        </a>
                                    </td>
                                    <td>
                                        <a title="Save changes" type="submit" href="javascript:submitForm('<%= o.getStrCartID()%>', '<%= urlRew%>')" id="save">
                                            <i class="fa-solid fa-check" style="background: #00ff66; padding: 5px 7px; border-radius: 5px; color: #ffffff;"></i>
                                        </a>
                                    </td>
                                </tr>

                            <% if (Feedbacks.containsKey(o.getStrCartID())) { %>           
                            <div style="display: none;" class="overlay" id="fb_<%= o.getStrCartID() %>">
                                <div>
                                    <h2>Feedback for order: <span style="color:red; font-style: italic"><%= o.getStrCartID() %></span></h2>
                                    <h3>Customer: <%= o.getStrUserID() %></h3>
                                    <br>
                                    <label>How do you feel about the products?</label>
                                    <select name="slc<%=o.getStrCartID()%>" disabled>
                                        <option><%= Feedbacks.get(o.getStrCartID()).get(1) %></option>
                                    </select>
                                    <br>
                                    <p>Provide some details about it (optional):</p>
                                    <br>
                                    <textarea 
                                        type="text" spellcheck="false" rows="15" cols="76" disabled>
                                        <%= Feedbacks.get(o.getStrCartID()).get(2) %>
                                    </textarea>
                                    <br>
                                    <div class="btns">
                                        <button 
                                            style="background:#ff3333" type="button" onclick="document.getElementById('fb_<%= o.getStrCartID() %>').style.display = 'none'">
                                            Close
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <% } %>
                            <script>
                                document.getElementById('edit_<%=o.getStrCartID()%>').addEventListener('click', function () {
                                    document.getElementById('<%= o.getStrCartID()%>').disabled = false;
                                });
                            </script>
                            <% } %>
                        </table>
                        <script>
                            function submitForm(ID, URL) {
                                var final = URL + "&" + ID + "=" + document.getElementById(ID).value;
                                window.open(final, '_self');
                            };
                        </script>
                    </tbody>
                    </div>
                </div>

                        <%
                        int totalRevenue = 0;
                        int totalOrder = 0;
                        for(Order o: OrderList){
                            if(o.getStatus().equals("Delivered")){
                                totalRevenue += o.getTotalPrice();
                            }
                            totalOrder++;
                        }    
                        %>
                <div class="content" id="analytics">
                    <div id="cards">
                        <div class="card" id="revenue">
                            <div>
                                <h2 style="color: goldenrod;">Revenue</h2>
                                <h4 style="color: black;"><%= fm.format(totalRevenue) %> VND</h4>
                            </div>
                            <i class="fa-solid fa-dollar-sign" style="font-size: xx-large; color: grey;"></i>
                        </div>
                        <div class="card" id="newUser">
                            <div>
                                <h2 style="color: blue;">New Users</h2>
                                <h4 style="color: black;">+ <%= AccountList.size() %> within the past 30 days</h4>
                            </div>
                            <i class="fa-solid fa-user"style="font-size: xx-large; color: grey;"></i>
                        </div>
                        <div class="card" id="totalOrder">
                            <div>
                                <h2 style="color: rgb(0, 199, 43);">Total Orders</h2>
                                <h4 style="color: black;"><%= totalOrder %></h4>
                            </div>
                            <i class="fa-solid fa-clipboard-list"style="font-size: xx-large; color: grey;"></i>
                        </div>
                        <div class="card" id="totalSold">
                            <div>
                                <h2 style="color: blueviolet;">Total Sold</h2>
                                <h4 style="color: black;"><%= fm.format(getShoesSold.getTotalPrice()) %> VND</h4>
                            </div>
                            <i class="fa-solid fa-envelope-circle-check"style="font-size: xx-large; color: grey;"></i>
                        </div>
                    </div>


                    <div id="chart">
                        <div style="border: solid rgb(204, 204, 204) 2px; border-radius: 10px; padding: 2%;width: 470px"><div id="piechart" style="width: 400px;"></div></div>
                    </div>


                </div>
            </div>
        </div>
        <script src="decors/Script/adminScript.js"></script>
        <script>
            window.onload = function () {
            <% if (acc.getRole().equals("manager")) { %>
                $.getScript("decors/Script/adminScript.js", function () {
                    showOrderManagement();
                });
            <% } else { %>
                $.getScript("decors/Script/adminScript.js", function () {
                    showUserManagement();
                });
            <% } %>
            };
        </script>
    </body>
    <% }%>
</html>
