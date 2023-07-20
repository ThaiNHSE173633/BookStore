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
        <div class="row">
            <jsp:include page="/BookManageController" />
            <div class="col-3">
                <jsp:include page="../Shared/_AdminLayout.jsp" />
            </div>
            <div class="col-9 mx-0 p-0">
                <button type="button" class="btn btn-success my-2" data-bs-toggle="modal" data-bs-target="#createModal">
                    Create Book
                </button>
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
                            <th>Author</th>
                            <th>Price</th>
                            <th>In Stock</th>
                            <th>Category Name</th>
                            <th>Delete</th>
                            <th>Update</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (BookDTO dto : list) {
                        %>
                        <tr>
                    <form action='../MainController' method='post'>
                        <td><%=dto.getId()%><input type='hidden' name='txtId' value='<%=dto.getId()%>'/></td>
                        <td><%=dto.getTitle()%></td>
                        <td><%=dto.getAuthor()%></td>
                        <td><img style="max-width:250px;height:auto" src="<%=dto.getImgPath()%>" alt="Book Cover"/></td>
                        <td><input type='number' name='txtPrice' min="0" value='<%=dto.getPrice()%>' required/></td>
                        <td><input type='number' name='txtInStock' min="0" value='<%=dto.getInStock()%>' required/></td>
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
                        <td>
                            <button type="button" class="btn btn-danger delete-button" data-bs-toggle="modal" data-bs-target="#deleteModal" data-id="<%=dto.getId()%>">
                                Delete
                            </button>
                        </td>
                        <td>
                            <button class="btn btn-info" type='submit'>Update</button>
                            <input name='button' value='UpdateBook' hidden/></td>
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

        <!-- Create Modal -->
        <div class="modal fade" id="createModal" tabindex="-1" aria-labelledby="createModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="createModalLabel">Create Category</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div>Title</div>
                        <input type="text" name="txtTitle" form="formCreate" required/>
                        <div>Image URL</div>
                        <input type="text" name="txtImgPath" form="formCreate" required/>
                        <div>Author</div>
                        <input type="text" name="txtAuthor" form="formCreate" required/>
                        <div>Price</div>
                        <input type='number' form="formCreate" name='txtPrice' min="0" value="0" required/>
                        <div>In Stock</div>
                        <input type='number' form="formCreate" name='txtInStock' min="0" value="0" required/>
                        <div>Category</div>
                        <select name="selectCategory" form="formCreate">
                    <%
                        for (BookCategoryDTO categoryDto : categoryList) {
                    %>
                        <option value="<%=categoryDto.getId()%>"><%=categoryDto.getName()%></option>
                    <%
                        }
                    %>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <form action="../MainController" id="formCreate">
                            <button type="submit" class="btn btn-primary">Create</button>
                            <input name='button' value='CreateBook' hidden/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Delete Modal -->
        <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="deleteModalLabel">Delete Book</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div>Are you sure you want to delete this book?</div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <form action="../MainController">
                            <button type="submit" class="btn btn-danger">Delete</button>
                            <input name='button' value='DeleteBook' hidden/>
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
