<%@page import="com.thainh.order.OrderDTO"%>
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
        <div class="row" style="height:100vh;">
            <jsp:include page="/OrderManageController" />
            <div class="col-3" style="height:100%">
                <jsp:include page="../Shared/_AdminLayout.jsp" />
            </div>
            <div class="col-9 mx-0 p-0">
                <%
                        List<OrderDTO> list = (List<OrderDTO>) request.getAttribute("ORDERLIST");
                        if (list != null) {%>
                <table class="table" border='1px solid' style="">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Customer Name</th>
                            <th>Total</th>
                            <th>Done</th>
                            <th>Details</th>
                            <th>Delete</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (OrderDTO dto : list) {
                        %>
                        <tr>
                    <form action='../MainController' method='post'>
                        <td><%=dto.getId()%><input type='hidden' name='txtId' value='<%=dto.getId()%>'/></td>
                        <td><%=dto.getCustomerName()%></td>
                        <td><input type='number' name='txtTotal' min="0" value='<%=dto.getTotal()%>' required/></td>
                        <td><input class="form-input" type='checkbox' name='chkDone' value='done' 
                                   <%
                                      if (dto.isIsDone()) {

                                   %>
                                   checked='checked'
                                   <%
                                       }
                                   %>
                        </td>
                        <td>
                            <input class="btn btn-primary" type="submit" name='button' value='Order Details'/></td>
                        </td>
                        <td>
                            <button type="button" class="btn btn-danger delete-button" data-bs-toggle="modal" data-bs-target="#deleteModal" data-id="<%=dto.getId()%>">
                                Delete
                            </button>
                        </td>
                        <td>
                            <input class="btn btn-info" type="submit" name='button' value='Update Order'/>
                        </td>
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
                        <h5 class="modal-title" id="deleteModalLabel">Delete Order</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div>Are you sure you want to delete this order?</div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <form action="../MainController">
                            <button type="submit" class="btn btn-danger">Delete</button>
                            <input name='button' value='DeleteOrder' hidden/>
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
