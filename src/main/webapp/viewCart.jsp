
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.thainh.cart.CartDTO"%>
<%@page import="com.thainh.book.BookDTO"%>
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
        <h1>Your Cart includes</h1>
        <%
            if(session !=null){
                CartDTO cart=(CartDTO) session.getAttribute("CART");
                
                if(cart !=null){
                    if(cart.getItems()!=null){
        %>
                    <table class="table table-info table-bordered table-striped table-hover">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Title</th>
                                <th>Price</th>
                                <th>Amount</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                        <form action="MainController">
                            <%
                                Map<BookDTO,Integer> items=cart.getItems();
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
                                .</td>
                                <td>
                                    <%=item.getKey().getTitle()%>
                                </td>
                                <td>
                                    <%=item.getKey().getPrice()%>$
                                </td>
                                <td>
                                    <%=item.getValue()%>
                                </td>
                                <td>
                                    <input type="checkbox" name="chkItem" value="<%=item.getKey().getId()%>"/>
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
                                <td>
                                    <input type="submit" value="Remove from Cart" name="button">
                                </td>
                            </tr>
                        </form>
                    </tbody>
                    </table>
                            <%
                                if(count>0)
                                {
                            %>
                    <div>
                        <form action="MainController">
                            <input class="btn btn-success" type="submit" value="Order" name="button">
                        </form>
                    </div>
                            <%
                                }
                            String error=(String) request.getAttribute("OrderError");
                            if(error!=null){
                            %>
                            <div class="text-danger"><%=error%></div>
                            <%
                                }
                            %>
                    <a href="index.jsp">Add More Items to Your Cart</a>
                    </div>
                    
                    <jsp:include page="/Shared/_Footer.jsp" />
<%
                    return;
                    }
                }
            }
%>
            <h2>No cart exists</h2>
            </div>
            <jsp:include page="/Shared/_Footer.jsp" />
    </body>
</html>
