
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
                        %>
                        <tr>
                    <form action='../MainController' method='post'>
                        <td><%=++count%> </td>
                        <td><%=dto.getUsername()%><input type='hidden' name='txtUsername' value='<%=dto.getUsername()%>'/></td>
                        <td><input type='text' name='txtPassword' value='<%=dto.getPassword()%>' required/></td>
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
                        <td>
                            <button type="button" class="btn btn-danger delete-button" data-bs-toggle="modal" data-bs-target="#deleteModal" data-id="<%=dto.getId()%>">
                                Delete
                            </button>
                        </td>
                        <td>
                            <button class="btn btn-info" type='submit'>Update</button>
                            <input name='button' value='UpdateUser' hidden/></td>
                        </form>
                    </tr>
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
        
        <!-- Delete Modal -->
        <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteModalLabel">Delete User</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div>Are you sure you want to delete this user?</div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <form action="../MainController">
                            <button type="submit" class="btn btn-danger">Delete</button>
                            <input name='button' value='DeleteUser' hidden/>
                            <input id="deletePk" name='pk' value='-1' hidden/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('.delete-button').click(function () {
                    var id = $(this).attr('data-id');
                    document.getElementById("deletePk").value=id;
                });
            });
        </script>
    </body>
</html>
