
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.thainh.cart.CartDTO"%>
<%@page import="com.thainh.book.BookDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Store</title>
    </head>
    <body>
        <h1>Your Cart includes</h1>
        <%
            if(session !=null){
                CartDTO cart=(CartDTO) session.getAttribute("CART");
                
                if(cart !=null){
                    if(cart.getItems()!=null){
        %>
                    <table border="1">
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
                                for(Map.Entry<BookDTO,Integer> item :items.entrySet()) {
                                total+=item.getKey().getPrice();
                            %>
                            <tr>
                                <td>
                                    <%=++count%>
                                .</td>
                                <td>
                                    <%=item.getKey().getTitle()%>
                                </td>
                                <td>
                                    <%=item.getKey().getPrice()%>
                                </td>
                                <td>
                                    <%=item.getValue()%>
                                </td>
                                <td>
                                    <input type="checkbox" name="chkItem" value="<%=count-1%>"/>
                                </td>
                            </tr>
                            <%
                                    }//End for
                            %>
                            <tr>
                                <td colspan="4">
                                    <div>Amount:<%=count%></div>
                                    <div>Total:<%=total%>$</div>
                                </td>
                                <td>
                                    <input type="submit" value="Remove from Cart" name="button">
                                    
                                </td>
                            </tr>
                        </form>
                    </tbody>
                    </table>
                    <a href="search.jsp">Add More Items to Your Cart</a>
<%
                    return;
                    }
                }
            }
%>
<h2>No cart exists</h2>
    </body>
</html>
