
<%@page import="com.thainh.book.BookDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
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
    <body>
                <div class="container">
        <font color="red">
        <%
            String username=(String)session.getAttribute("USERNAME");
        %>
        Welcome, <%=username%>
        <%
            String searchValue = request.getParameter("txtSearchValue");
            if(searchValue==null)
            {
            searchValue="";
        %>
            <jsp:include page="/SearchController?txtSearchValue=" />
        <%
            }
        %>
        </font>
        <h1>Shopping Page</h1>
        <div class="row mb-2">
            <form class="col-6" name="form" action="MainController" method="post">
                Search: <input type="text" name="txtSearchValue" value="<%=searchValue%>"/>
                <input type="submit" name="button" value="Search"/>
            </form>
            <div class="col-6">
                <form class="d-flex justify-content-around" name="form" action="MainController" method="post" style="width:50%">
                    <button class="btn btn-danger" type='submit' style="width:60%">Logout</button>
                    <input name='button' value='Logout' hidden/>
                </form>
                <form class="d-flex justify-content-around" name="form" action="MainController" method="post" style="width:50%">
                    <button class="btn btn-primary" type='submit' style="width:60%">View Cart</button>
                    <input name='button' value='View Cart' hidden/>
                </form>
            </div>
            </div>
        <%
            if (searchValue != null) {
                List<BookDTO> result = (List<BookDTO>) request.getAttribute("SEARCHRESULT");
                if (result != null) {
                %>
                <div class="row">
                <%for(BookDTO item:result){%>
                <div class="col-lg-3 col-md-6 col-12 mb-2">
                <div class="card" style="width: 18rem;">
                    <img class="card-img-top" src="<%=item.getImgPath()%>" alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title"><%=item.getTitle()%></h5>
                        <p class="card-text"><%=item.getPrice()%>$</p>
                        <p class="card-text"><%=item.getCategoryName()%></p>
                        <form action="MainController">
                        <button class="btn btn-success" type='submit'>Add to Cart</button>
                        <input name='button' value='Add to Cart' hidden/>
                        <input name='id' value='<%=item.getId()%>' hidden/>
                        <input name='searchValue' value='<%=searchValue%>' hidden/>
                        </form>
                    </div>
                </div>
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
}
        %>
        </div>
    </body>
</html>
