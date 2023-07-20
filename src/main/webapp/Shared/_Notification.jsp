
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
  <%
    if (session.getAttribute("success") != null) {
      String successMessage = (String) session.getAttribute("success");
  %>
      <script type="text/javascript">
        $(document).ready(function() {
            toastr.success('<%=successMessage%>');
        });
      </script>
      <%
      session.setAttribute("success",null);
      } 
    if (session.getAttribute("error") != null) {
      String errorMessage = (String) session.getAttribute("error");
  %>
      <script type="text/javascript">
        $(document).ready(function() {
            toastr.error('<%=errorMessage%>');
        });
      </script>
      <%
      session.setAttribute("error",null);
      } 
  %>