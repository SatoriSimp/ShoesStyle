<%@page import="servlet.registration.objects.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Verify Account</title>
        <link rel="stylesheet" href="decors/verifyAccount.css">
    </head>
    <body>
        <% 
            if (request.getAttribute("RegistSuccess") != null) {
            %>
    <style>
        .overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(255,255,255,0.35);
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 auto;
            z-index: 9999;
            box-shadow: 5px 10px;
        }
        .overlay-button {
            margin-top: 12%;
            color: white;
            border-radius: 10px;
            padding: 2% 4%;
            background-color: blue;
            border: none;
            font-size: 22px;
            cursor: pointer;
            align-items: center;
            justify-self: center;
            margin-left: 37.5%;
        }
        .overlay > div {
            background: #f2f2f2;
            padding: 0 5% 3% 5%;
            align-items: center;
            justify-content: center;
            position: absolute;
            border: none;
        }

        h1 {
            font-family: Tahoma;
            font-size: 42px;
            font-weight: 500;
            color: #0099ff;
            text-align: center;
        }

        button:hover {
            background-color: #008cff;
        }
    </style>
    <div class="overlay">
        <div>
            <h1>Account created successfully!<br>Please log in!</h1>
            <button class="overlay-button" onclick="window.open('login.jsp', '_self')">Let's gooo</button>
        </div>
    </div>
            <%  
            }
        %>
        <div class="container"> 
            <div class="form-slogan">
                <h2>HAPS|SNEAKERS</h2>
                <p>CRAFTING FOOTWEAR TO YOUR <Span>VERY</Span> DESIRE</p>
            </div>

            <form class="form-main" name="frmRetreive" action="MainController" method="post">
                <div class="forgot-password">
                    <h1>You're almost there</h1>
                    <h3>But we will need to confirm your email first</h3>
                </div>

                <div class="input-code">
                    <p>Verification code:</p><input type="text" name="capcha"/>
                </div>

                <div class="notice">
                    <p id="emailSentMessage">We have sent the code to your via email!</p>
                    <%
                    String errorMessage = (String) request.getAttribute("err");
                    if (errorMessage != null) {
                    %>
                        <p><%= errorMessage %></p>
                        <script>
                            document.getElementById("emailSentMessage").style.display = "none";
                        </script>
                    <%
                    }
                    %>
                </div>


                <div class="send">
                    <button type="submit" name="btnSubmit" value="Verify">Confirm</button>
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
