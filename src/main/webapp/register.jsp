<%-- 
    Document   : register
    Created on : Sep 25, 2023, 8:44:43 PM
    Author     : Admin
--%>
<%@page import="servlet.utility.RegistrationInsertError"%>
<%@page import="javax.servlet.Registration"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>REGISTER</title>
        <link rel="stylesheet" href="decors/register.css">
    </head>
    <body>
        <% RegistrationInsertError errors = (RegistrationInsertError) request.getAttribute("INSERTERROR"); %>
        <form name="frmRegister" action="MainController" method="post">
            <div class="form-main"> 
                <div class="register">
                    <a href="#">Create a new account</a>    
                </div>
                <div class="input">
                    <div class="input-email">
                        <p>Email:</p> 
                        <input type="text" name="txtEmail"
                               placeholder="<%if (errors != null && errors.getEmail() != null) { %><%=errors.getEmail()%><%}%>
                        "/>

                    </div>
                    <div class="input-password">
                        <p>Password:</p> 
                        <input type="password" name="txtPassword"
                               placeholder="<%if (errors != null && errors.getPasswordLengErr() != null) {%><%=errors.getPasswordLengErr()%><%}%>
                        "/>

                    </div>

                    <div class="input-confirm">
                        <p>Confirm Password:</p> 
                        <input type="password" name="txtConfirm"
                               placeholder="<%if (errors != null && errors.getConfirmNotMatch() != null) {%><%= errors.getConfirmNotMatch() %><%}%>
                        "/>

                    </div>
                    <div class="input-phone">
                        <p>Phone number:</p> 
                        <input type="text" name="txtPhone" 
                               placeholder="<%if (errors != null && errors.getPhoneLengErr() != null) {%><%= errors.getPhoneLengErr()%><%}%>
                        "/>

                    </div>

                    <div class="input-address">
                        <p>Address:</p> <input type="text" name="txtAddress" value="">
                    </div>
                </div>


                <div class="login">
                    <button type="submit" name="btnSubmit" value="Register">CREATE</button>
                </div>

                <div class="already">
                    <p style="background: white; padding: 0.25%">Already have an account? <a href="login.jsp">Log in</a></p>
                </div>


            </div>

            <div class="form-slogan">
                <h2>HAPS|SNEAKERS</h2>
                <p>CRAFTING FOOTWEAR TO YOUR <Span>VERY</Span> DESIRE</p>
            </div>
        </form>

    </body>
</html>