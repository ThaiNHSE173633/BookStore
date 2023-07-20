<%-- 
    Document   : createNewAccount
    Created on : 04-Mar-2023, 08:31:10
    Author     : DELL
--%>

<%@page import="com.thainh.registration.RegistrationInsertError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Account</title>
    </head>
    <body>
        <h1>Create New Account</h1>
        <form action="MainController" method="post">
            Username* <input type="text" name="txtUsername" required="" value="<%= request.getParameter("txtUsername")%>"/>(6 - 20 chars) <br/>
            <font color="red">
            <%
                RegistrationInsertError errors=(RegistrationInsertError)request.getAttribute("INSERTER");
                if(errors!=null){
                    if(errors.getUsernameLengthErr()!=null){
                        %>
                        <%=errors.getUsernameLengthErr()%><br/>
            <%
                    }
                }
            %>
            </font>
            Password* <input type="password" name="txtPassword" required="" value="<%= request.getParameter("txtPassword")%>"/>(6 - 30 chars) <br/>
            <font color="red">
            <%
                if(errors!=null){
                    if(errors.getPasswordLengthErr()!=null){
                        %>
                        <%=errors.getPasswordLengthErr()%><br/>
            <%
                    }
                }
            %>
            </font>
            Confirm*<input type="password" name="txtConfirm" required="" value="<%= request.getParameter("txtConfirm")%>"/><br/>
            <font color="red">
            <%
                if(errors!=null){
                    if(errors.getConfirmNotMatch()!=null){
                        %>
                        <%=errors.getConfirmNotMatch()%><br/>
            <%
                    }
                }
            %>
            </font>
            Full name<input type="text" name="txtFullname" value="<%= request.getParameter("txtFullname")%>"/>(2 - 50 chars) <br/>
            <font color="red">
            <%
                if(errors!=null){
                    if(errors.getFullnameLengthErr()!=null){
                        %>
                        <%=errors.getFullnameLengthErr()%><br/>
            <%
                    }
                }
            %>
            </font>
            <input type="submit" name="button" value="Create New Account"/>
            <input type="reset" value="Reset"/>
        </form><br/>
            <font color="red">
            <%
                if(errors!=null){
                    if(errors.getUsernameIsExisted()!=null){
                        %>
                        <%=errors.getUsernameIsExisted()%><br/>
            <%
                    }
                }
            %>
            </font>
    </body>
</html>
