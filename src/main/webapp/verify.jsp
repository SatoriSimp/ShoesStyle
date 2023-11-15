<%@page import="servlet.registration.objects.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://kit.fontawesome.com/8a92f73d4a.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@500;600;700;800&display=swap"
            rel="stylesheet" />
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
        <!-- cdn -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
        <title>Verify Account</title>
        <link rel="stylesheet" href="decors/verifyAccount.css">
    </head>
    <body>
        <% 
            if (request.getAttribute("RegistSuccess") != null) {
        %>
    <style>
        .overlay {
            overflow: hidden;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: rgba(240,240,240,0.35);
            z-index: 9999;
            box-shadow: 5px 10px;
        }

        .overlay-button {
            margin: 10% auto 0 28.5%;
            color: white;
            border-radius: 5px;
            padding: 6% 10%;
            background-color: blue;
            border: none;
            font-size: 20px;
            cursor: pointer;
        }

        .overlay > div {
            background: white;
            padding: 2% 5% 8% 5%;
            box-shadow: rgba(0, 0, 0, 0.5) 10px 10px 10px 10px;
            height: 30%;
            display: block;
            text-align: left;
            position: absolute;
            border: none;
            min-width: fit-content;
            margin: 12% 30%;
        }

        .overlay h1 {
            font-family: Tahoma;
            font-size: 34px;
            font-weight: 500;
            color: #0099ff;
            text-align: center;
        }
    </style>
        <div class="overlay">
            <div>
                <h1>
                    <i class="fa-solid fa-circle-check fa-2xl" style="color: #255ec1;margin-bottom: 10%;"></i>
                    
                    <br>Account created successfully!<br>Please log in!
                </h1>
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
