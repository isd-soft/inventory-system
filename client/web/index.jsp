<%-- 
    Document   : index
    Created on : Mar 31, 2016, 9:34:07 AM
    Author     : Ed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="style/css/bootstrap.css">
        <link rel="stylesheet" href="style/css/login.css">
                <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
 <body class="buddy">
    
     <div class="wrapper">
    <form class="form-signin" action="login.jsp" method="post">       
      <h2 class="form-signin-heading">Please login</h2>
      <input type="text" class="form-control"  placeholder="Username" required="" autofocus="" name="uname"/>
      <input type="password" class="form-control"  placeholder="Password" required="" name="pass"/>      
      <label class="checkbox">
        <input type="checkbox" value="remember-me" id="rememberMe" name="rememberMe"> Remember me
      </label>
      <input class="btn btn-lg btn-primary btn-block" type="submit" value="Login"></button>   
    </form>

  </div>

    </body>
</html>