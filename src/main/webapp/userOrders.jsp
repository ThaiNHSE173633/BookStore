
<%@page import="com.thainh.order.OrderDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Store</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

    </head>
    <body>
        <jsp:include page="/Shared/_Header.jsp" />
        <div class="container">
        <h1>Your Orders</h1>
            <jsp:include page="/UserOrderManageController" />
                <%
                        List<OrderDTO> list = (List<OrderDTO>) request.getAttribute("ORDERLIST");
                        if (list != null) {%>
                <table class="table" border='1px solid' style="">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Total</th>
                            <th>Done</th>
                            <th>Details</th>
                            <th>Cancel</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            int count=0;
                            for (OrderDTO dto : list) {
                        %>
                        <tr>
                    <form action='MainController' method='post'>
                        <td><%=++count%><input type='hidden' name='txtId' value='<%=dto.getId()%>'/></td>
                        <td><%=dto.getTotal()%></td>
                        <td><input disabled class="form-input" type='checkbox' name='chkDone' value='done' 
                                   <%
                                      if (dto.isIsDone()) {
                                   %>
                                   checked='checked'
                                   <%
                                       }
                                   %>
                        </td>
                        <td>
                            <button class="btn btn-primary" type="submit" name='button' value='UserOrderDetails'>Details</button>
                        </td>
                        <td>
                            <button 
                                <%
                                      if (dto.isIsDone()) {
                                   %>
                                   disabled
                                   <%
                                       }
                                   %>
                                type="button" class="btn btn-danger cancel-button" data-bs-toggle="modal" data-bs-target="#cancelModal" data-id="<%=dto.getId()%>">
                                Cancel
                            </button>
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
            <jsp:include page="/Shared/_Footer.jsp" />
        
        <!-- Cancel Modal -->
        <div class="modal fade" id="cancelModal" tabindex="-1" aria-labelledby="cancelModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="cancelModalLabel">Cancel Order</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div>Are you sure you want to cancel this order?</div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <form action="MainController">
                            <button type="submit" class="btn btn-danger"name='button' value='CancelOrder'>Cancel</button>
                            <input id="deletePk" name='pk' value='-1' hidden/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('.cancel-button').click(function () {
                    var id = $(this).attr('data-id');
                    document.getElementById("deletePk").value=id;
                });
            });
        </script>
    </body>
</html>
