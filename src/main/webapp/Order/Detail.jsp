
<%@page import="com.thainh.book.BookDTO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="/Shared/_Header.jsp" />
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Details</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container">
            <a href="userOrders.jsp">Return to Orders</a>

            <div class="row">

                <%
                    Map<BookDTO,Integer> items=(Map<BookDTO,Integer>) request.getAttribute("items");
                
                        if(items!=null){%>
                <table class="table table-light table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Title</th>
                            <th>Price</th>
                            <th>Amount</th>
                        </tr>
                    </thead>
                    <tbody>
                    <form action="MainController">
                        <%
                            int count=0;
                            int total=0;
                            int amount=0;
                            for(Map.Entry<BookDTO,Integer> item :items.entrySet()) {
                            total+=item.getKey().getPrice()*item.getValue();
                            amount+=item.getValue();
                        %>
                        <tr>
                            <td>
                                <%=++count%>
                            </td>
                            <td>
                                <%=item.getKey().getTitle()%>
                            </td>
                            <td>
                                <%=item.getKey().getPrice()%>$
                            </td>
                            <td>
                                <%=item.getValue()%>
                            </td>
                        </tr>
                        <%
                                }//End for
                        %>
                        <tr>
                            <td colspan="4">
                                <div>Amount: <%=amount%></div>
                                <div>Total: <%=total%>$</div>
                            </td>
                        </tr>
                    </form>
                    </tbody>
                </table>
                <%
                    }
                %>
            </div>
        </div>
        <jsp:include page="/Shared/_Footer.jsp" />
    </body>
</html>
