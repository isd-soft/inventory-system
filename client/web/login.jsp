
<%@page import="com.client.Account"%>
<%@page import="com.client.clients"%>
<html>
    <head>
<link type="text/css" rel="stylesheet" href="style/css/sweetalert.css" />
<script src="style/js/sweetalert.min.js"></script>

<script>
    
    function myFunction(){
swal({   title: "Wrong username or password",   text: "Try again",   timer: 1500,   showConfirmButton: false });
    }
</script>

    </head>

    <body>
<%
    
   clients cl=new clients();
    String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
  Account ac= cl.client_login_confirm(userid,pwd);
  
  if(ac.getUname().length()>0)
  {
        session.setAttribute("userid",ac.getUname());
        session.setAttribute("userstatus",ac.getStatus());
    
        response.sendRedirect("success.jsp");
  }
  if(ac.getUname().equals(""))
  {
  %>


         <script>
             
        myFunction();
             </script>
         
<script>
  setTimeout(function() {
      document.location = "index.jsp";
  }, 1500); // <-- this is the delay in milliseconds
</script>
             
             
             
<% }
%>
    </body>
</html>