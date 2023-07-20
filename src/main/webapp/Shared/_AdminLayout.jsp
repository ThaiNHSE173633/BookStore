
<nav class="d-flex flex-column flex-shrink-0 p-3 text-white bg-dark" style="position:fixed;width: 280px; height:100%" id="sidebar">
    <div class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
        Dashboard
    </div>
    <a class="mx-2 my-2" href="../index.jsp">Return</a>
    <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item active">
            <a id="user-manage" class="nav-link" href="userManage.jsp">
                <span class="menu-title">Users</span>
                <i class="mdi mdi-home menu-icon"></i>
            </a>
        </li>
        <li class="nav-item active">
            <a id="user-manage" class="nav-link" href="orderManage.jsp">
                <span class="menu-title">Orders</span>
                <i class="mdi mdi-home menu-icon"></i>
            </a>
        </li>
        <li class="nav-item">
            <a id="book-manage" class="nav-link" href="bookManage.jsp">
                <span class="menu-title">Books</span>
                <i class="mdi mdi-home menu-icon"></i>
            </a>
        </li>
        <li class="nav-item">
            <a id="category-manage" class="nav-link" href="categoryManage.jsp">
                <span class="menu-title">Categories</span>
                <i class="mdi mdi-home menu-icon"></i>
            </a>
        </li>
    </ul>
</nav>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        var url=window.location.href;
        var parts = url.split('/');
        var lastPart = parts.pop() || parts.pop();
        localStorage.setItem('activeTab', lastPart);
        $('ul.nav li a').click(function () {
            $('ul.nav li a').removeClass('active');
            $(this).addClass('active');
            //$(this).attr('href')
        });
        var activeTab = localStorage.getItem('activeTab');
        if (activeTab) {
            $('ul.nav li a').removeClass('active');
            $('ul.nav li a[href="' + activeTab + '"]').addClass('active');
        }
    });
</script>