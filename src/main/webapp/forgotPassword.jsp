<%@page import="servlet.registration.objects.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="decors/forgotPassword.css">
</head>
<body>
    <% 
        Account acc = (Account) request.getAttribute("USER_ACCOUNT"); 
        Object sent = (Object) request.getAttribute("SENT_PASSWORD");
    %>
    <div class="container"> 
        <div class="form-slogan">
            <h2>HAPS|SNEAKERS</h2>
            <p>CRAFTING FOOTWEAR TO YOUR <Span>VERY</Span> DESIRE</p>
        </div>

        <form class="form-main" name="frmRetreive" action="MainController" method="post">
            <div class="forgot-password">
                <h1>Password Retrieve</h1>
            </div>
        
            <div class="input-email">
                <p>Email:</p> <input type="text" name="txtEmail" pattern="[a-zA-Z0-9]{5,}@gmail.com" required/>
            </div>

            <div class="notice">
            <% 
                if (sent == null) { %>
                <p>We will send the password to you via email!</p>
            <% 
                }
                else if (acc == null) {
            %>
                <p>The email you've entered might not yet existed! Please try again.</p>
            <%
                }
                else {
            %>
                <p>We have sent your password to email <%= acc.getStrUsername()%>, please check out!</p>
            <%
                }
            %>
            </div>   
                
            <div class="send">
                <button type="submit" name="btnSubmit" value="Recovery" 
                        <% if (acc != null) {%> style="background: gray;" disabled <%}%> >
                    RECOVER
                </button>
            </div>
            <div class="link">
                <div class="login">
                    <a href="login.jsp">Login</a>
                </div>
                
                <div class="create">
                    <a href="register.jsp">Create an account</a>
                </div>
            </div>
        </form>
    </div>
</body>
</html>