
<%@page import="com.thainh.registration.RegistrationDTO"%>
<jsp:include page="/Shared/_Notification.jsp" />
<%
    String searchValue = request.getParameter("txtSearchValue");
    if(searchValue==null)
    {
    searchValue="";
    }
    RegistrationDTO user= (RegistrationDTO)session.getAttribute("user");
%>
    <div style="width:100%;padding-left:15%">
        <a href="index.jsp">
        <img style="width:30%;height:auto" src="img/logo.jpg" alt="logo"></img>
        </a>
    </div>
    <div class="row bg-dark text-white px-4 py-2 mb-2">
        <form class="col-7" name="form" action="MainController" method="post">
            <input type="text" name="txtSearchValue" value="<%=searchValue%>"/>
            <input type="submit" name="button" value="Search"/>
        </form>
        <div class="col-5 d-flex flex-row justify-content-around">
<%
            if(user!=null)
            {
                if(user.isRole()){
%>
                    <form class="d-flex justify-content-around m-0" name="form" action="MainController" method="post" style="width:100%">
                        <button class="btn btn-primary" type='submit' style="width:80%">Manage</button>
                        <input name='button' value='Manage' hidden/>
                    </form>
<%
                }
%>
            
            <form class="d-flex justify-content-around m-0" name="form" action="MainController" method="post" style="width:100%">
                <button class="btn btn-primary" type='submit' style="width:80%">View Cart</button>
                <input name='button' value='View Cart' hidden/>
            </form>
            <form class="d-flex justify-content-around m-0" name="form" action="MainController" method="post" style="width:100%">
                <button class="btn btn-primary" type='submit' style="width:80%">My Orders</button>
                <input name='button' value='MyOrders' hidden/>
            </form>
            <form class="d-flex justify-content-around m-0" name="form" action="MainController" method="post" style="width:100%">
                <button class="btn btn-danger" type='submit' style="width:80%">Logout</button>
                <input name='button' value='Logout' hidden/>
            </form>
<%
            }
            else
            {
%>
            <form class="col-6 d-flex justify-content-around" name="form" action="MainController" method="post" style="width:50%">
                <button class="btn btn-primary" type='submit' style="width:60%">Login</button>
                <input name='button' value='LoginPage' hidden/>
            </form>
<%
            }//end of else
%>
        </div>
    </div>