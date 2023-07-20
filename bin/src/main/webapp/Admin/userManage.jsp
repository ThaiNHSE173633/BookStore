<%-- 
    Document   : admin
    Created on : 2 Jul 2023, 5:21:08 pm
    Author     : Windows
--%>

<%@page import="com.thainh.registration.RegistrationDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

    </head>
    <body>
        <div class="row" style="height:100vh">
            <jsp:include page="/UserManageController" />
            <div class="col-3" style="height:100%">
                <jsp:include page="../Shared/_AdminLayout.jsp" />
            </div>
            <div class="col-9 mx-0 p-0">
                <%
                        List<RegistrationDTO> list = (List<RegistrationDTO>) request.getAttribute("USERLIST");
                        if (list != null) {%>
                <table class="table" border='1px solid' style="">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Fullname</th>
                            <th>Role</th>
                            <th>Delete</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int count = 0;
                            for (RegistrationDTO dto : list) {
                                String urlRewrite = "../MainController?button=DeleteUser&pk=" + dto.getUsername();
                        %>
                        <tr>
                    <form action='../MainController' method='post'>
                        <td><%=++count%> </td>
                        <td><%=dto.getUsername()%><input type='hidden' name='txtUsername' value='<%=dto.getUsername()%>'/></td>
                        <td><input type='text' name='txtPassword' value='<%=dto.getPassword()%>'/></td>
                        <td><%= dto.getFullname()%></td>
                        <td><input class="form-input" type='checkbox' name='chkRole' value='ADMIN' 
                                   <%
                                      if (dto.isRole()) {

                                   %>
                                   checked='checked'
                                   <%
                                       }
                                   %>
                        </td>
                        <td><a href='<%=urlRewrite%>'>Delete</a></td>
                        <td>
                            <button class="btn btn-info" type='submit'>Update</button>
                            <input name='button' value='UpdateUser' hidden/></td>
                        </tr>
                    </form>
                    <%
                        }
                    %>
                    </thead>
                </table>
                <%
                    }
                %>
            </div>
        </div>
    </body>
</html>
