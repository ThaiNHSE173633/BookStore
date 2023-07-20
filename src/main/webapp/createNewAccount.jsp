
<%@page import="com.thainh.registration.RegistrationInsertError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Account</title>
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
                    <h2 class="text-center text-dark mt-5">Create New Account</h2>
                    <div class="card my-5">

                        <form class="card-body cardbody-color p-lg-5" action="MainController" method="post">
                                <%
                                    RegistrationInsertError errors=(RegistrationInsertError)request.getAttribute("INSERTER");
                                    String username = request.getParameter("txtUsername");
                                    if(username == null){
                                        username="";
                                    }
                                    String password = request.getParameter("txtPassword");
                                    if(password == null){
                                        password="";
                                    }
                                    String confirm = request.getParameter("txtConfirm");
                                    if(confirm == null){
                                        confirm="";
                                    }
                                    String fullname = request.getParameter("txtFullname");
                                    if(fullname == null){
                                        fullname="";
                                    }
                                %>
                            <div class="mb-3">
                                Username* <input type="text" name="txtUsername" class="form-control" required="" value="<%=username%>"/>(6 - 20 chars) <br/>
                                
                                <%
                                    if(errors!=null){
                                        if(errors.getUsernameLengthErr()!=null){
                                %>
                                <div class="text-danger"><%=errors.getUsernameLengthErr()%></div>
                                <%
                                        }
                                    }
                                %>
                            </div>
                            <div class="mb-3">
                                Password* <input type="password" name="txtPassword" class="form-control" required="" value="<%=password%>"/>(6 - 30 chars) <br/>
                                <%
                                    if(errors!=null){
                                        if(errors.getPasswordLengthErr()!=null){
                                %>
                                <div class="text-danger"><%=errors.getPasswordLengthErr()%></div>
                                <%
                                        }
                                    }
                                %>
                            </div>
                            <div class="mb-3">
                                Confirm*<input type="password" name="txtConfirm" class="form-control" required="" value="<%=confirm%>"/><br/>
                                <%
                                    if(errors!=null){
                                        if(errors.getConfirmNotMatch()!=null){
                                %>
                                <div class="text-danger"><%=errors.getConfirmNotMatch()%></div>
                                <%
                                        }
                                    }
                                %>
                            </div>
                            <div class="mb-3">
                                Full name<input type="text" name="txtFullname" class="form-control" value="<%=fullname%>"/>(2 - 50 chars) <br/>
                                <%
                                    if(errors!=null){
                                        if(errors.getFullnameLengthErr()!=null){
                                %>
                                <div class="text-danger"><%=errors.getFullnameLengthErr()%></div>
                                <%
                                        }
                                    }
                                %>
                            </div>
                            <div class="text-center"><button type="submit" name="button" class="btn btn-dark px-5 mb-5 w-100" value="Create New Account">Create New Account</button></div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
