
<%@page import="com.thainh.order.OrderDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
        <jsp:include page="/Shared/_Header.jsp" />
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Store</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

    </head>
    <body>
        <div class="container">
        <h1>Your Orders</h1>
            <jsp:include page="/UserOrderManageController" />
                <%
                        List<OrderDTO> list = (List<OrderDTO>) request.getAttribute("ORDERLIST");
                        if (list != null) {%>
                <table class="table" border='1px solid' style="">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Total</th>
                            <th>Done</th>
                            <th>Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (OrderDTO dto : list) {
                        %>
                        <tr>
                    <form action='MainController' method='post'>
                        <td><%=dto.getId()%><input type='hidden' name='txtId' value='<%=dto.getId()%>'/></td>
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
    </body>
</html>
