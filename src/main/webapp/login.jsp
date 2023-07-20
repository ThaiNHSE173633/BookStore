<%-- 
    Document   : index
    Created on : 14 Jul 2023, 9:19:34 pm
    Author     : Windows
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Book Store Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <style>
            .cardbody-color{
                background-color: #ebf2fa;
            }

            a{
                text-decoration: none;
            }
        </style>

    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-6 offset-md-3">
                    <h2 class="text-center text-dark mt-5">Login Form</h2>
                    <div class="card my-5">

                        <form class="card-body cardbody-color p-lg-5" action="MainController" method="post">
                            <%
                            String errorMessage = (String)request.getAttribute("loginError");
                            if(errorMessage!=null)
                            {
                            %>
                            <div class="text-danger"><%=errorMessage%></div>
                            <%
                            }
                            %>
                            <div class="mb-3">
                                <input type="text" class="form-control" name="txtUsername" id="txtUsername" aria-describedby="emailHelp"
                                       placeholder="Username">
                            </div>
                            <div class="mb-3">
                                <input type="password" class="form-control" name="txtPassword" id="txtPassword" placeholder="Password">
                            </div>
                            <div class="mb-3"> Remember Me:
                                <input class="form-check-input" type="checkbox" id="rememberMe" name="chkRememberMe" value="true">
                            </div>
                            <div class="text-center"><button type="submit" name="button" class="btn btn-dark px-5 mb-5 w-100" value="Login">Login</button></div>

                            <div id="emailHelp" class="form-text text-center mb-5 text-dark">Not
                                Registered? <a href="createNewAccount.jsp" class="text-dark fw-bold"> Create an
                                    Account</a>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
</html>
