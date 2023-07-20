
<%@page import="com.thainh.book.BookDTO"%>
<%@page import="com.thainh.registration.RegistrationDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book Store</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>
        <style>
            .card-title{
                display: -webkit-box;
                -webkit-line-clamp: 2;
                -webkit-box-orient: vertical;
                overflow: hidden;
                text-overflow: ellipsis;
            }
        </style>
    </head>
        <jsp:include page="/Shared/_Header.jsp" />
    <body>
        <div class="container">
        <%
            RegistrationDTO user= (RegistrationDTO)session.getAttribute("user");
            String searchValue = request.getParameter("txtSearchValue");
            if(searchValue==null)
            {
            searchValue="";
        %>
            <jsp:include page="/SearchController?txtSearchValue=" />
        <%
            }
        %>
        <%
            if (searchValue != null) {
                List<BookDTO> result = (List<BookDTO>) request.getAttribute("SEARCHRESULT");
                if (result != null) {
                %>
                <div class="row">
                    <%for(BookDTO item:result){%>
                    <div class="col-lg-4 col-md-6 col-sm-12 mb-2">
                        <div class="card" style="width: 18rem">
                            <div style="height:450px">
                                <img class="card-img-top" src="<%=item.getImgPath()%>" alt="Card image cap">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title" style="height:50px"><%=item.getTitle()%></h5>
                                <h6 class="card-text text-secondary">By <%=item.getAuthor()%></h6>
                                <h5 class="card-text"><%=item.getPrice()%>$</h5>
                                <p class="card-text"><%=item.getCategoryName()%></p>
                                <%
                                    if(user!=null)
                                    {
                                %>
                                <div class="row d-flex justify-content-around">
                                    <form action="MainController" class="d-flex justify-content-around">
                                        <button class="btn btn-success add-button" type='button' data-id="<%=item.getId()%>">
                                            Add to Cart
                                        </button>
                                    </form>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                    </div>
                    <%
                    }
                    %>
                </div>
            <%
            }
        }
        else
        {
            String lastSearch=request.getParameter("lastSearchValue");
            if (lastSearch!="")
            {
        %>
        <h2>No results found</h2>
        <%    
        }
    }
        %>
        </div>
        <script>
            $(document).ready(function () {
                $('.add-button').click(function () {
                    var id = $(this).attr('data-id');
                    $.ajax({
                        url: "AddItemController",
                        type: "POST",
                        data: { bookId: id},
                        success: function(response) {
                            toastr.success("Book added successfully!");
                        },
                        error: function(xhr) {
                            toastr.error("Error adding book to cart.");
                        }
                    });
                });
            });
        </script>
    </body>
    <jsp:include page="/Shared/_Footer.jsp" />
</html>
