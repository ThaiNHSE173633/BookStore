<%-- 
    Document   : admin
    Created on : 2 Jul 2023, 5:21:08 pm
    Author     : Windows
--%>

<%@page import="com.thainh.book.BookDTO"%>
<%@page import="com.thainh.bookcategory.BookCategoryDTO"%>
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
            <jsp:include page="/BookManageController" />
            <div class="col-3" style="height:100%">
                <jsp:include page="../Shared/_AdminLayout.jsp" />
            </div>
            <div class="col-9 mx-0 p-0">
                <%
                        List<BookDTO> list = (List<BookDTO>) request.getAttribute("BOOKLIST");
                        List<BookCategoryDTO> categoryList = (List<BookCategoryDTO>) request.getAttribute("CATEGORYLIST");
                        if (list != null) {%>
                <table class="table" border='1px solid' style="">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th style="width:300px">Title</th>
                            <th>Image Path</th>
                            <th>Price</th>
                            <th>Category Name</th>
                            <th>Delete</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (BookDTO dto : list) {
                                String urlRewrite = "../MainController?button=DeleteBook&pk=" + dto.getId();
                        %>
                        <tr>
                    <form action='../MainController' method='post'>
                        <td><%=dto.getId()%><input type='hidden' name='txtId' value='<%=dto.getId()%>'/></td>
                        <td><%=dto.getTitle()%></td>
                        <td><img style="max-width:250px;height:auto" src="<%=dto.getImgPath()%>" alt="Book Cover"/></td>
                        <td><input type='number' name='txtPrice' min="0" value='<%=dto.getPrice()%>'/></td>
                        <td>
                            <select name="selectCategory">
                        <%
                            for (BookCategoryDTO categoryDto : categoryList) {
                        %>
                            <option value="<%=categoryDto.getId()%>" 
                        <%
                            if(dto.getCategoryId()==categoryDto.getId()){
                        %>
                            selected
                        <%
                            }
                        %>
                                    ><%=categoryDto.getName()%></option>
                        <%
                            }
                        %>
                            </select>
                        </td>
                        <td><a href='<%=urlRewrite%>'>Delete</a></td>
                        <td>
                            <button class="btn btn-info" type='submit'>Update</button>
                            <input name='button' value='UpdateBook' hidden/></td>
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
