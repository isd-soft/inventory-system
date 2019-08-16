<%-- 
    Document   : user
    Created on : Mar 31, 2016, 9:37:31 AM
    Author     : Ed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="style/js/jquery-1.9.1.js"></script>
    <script src="style/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="<c:url value='style/css/bootstrap.css' />" />
    <title>Add new employee</title>
    </head>
    <body>
 
        
        
        <div class="container">
            <div class="row"><h1 class="text-center">Add new account</h1></div>
        <form method="POST" action='AccountController' name="frmAddAccount" class="form-horizontal">
            
            <input type="hidden" name="id"
                               value="<c:out value="${account.id}" />" /> <br /> 
                          
            
              <div class="form-group">
                <label for="inputEmail" class="col-sm-2 control-label col-lg-offset-2">Email</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="email" id="inputEmail" value="<c:out value="${account.email}" />" /> <br /> 
                </div>
              </div>

              <div class="form-group">
                <label for="inputUsername" class="col-sm-2 control-label col-lg-offset-2">Username</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="uname" id="inputUsername" value="<c:out value="${account.uname}" />" /> <br /> 
                </div>
              </div>
                
              <div class="form-group">
                <label for="inputPass" class="col-sm-2 control-label col-lg-offset-2">Password</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="pass" id="inputPass" value="<c:out value="${account.pass}" />" /> <br /> 
                </div>
              </div>
              
                <div class="form-group">
                <label for="inputStatus" class="col-sm-2 control-label col-lg-offset-2">Status</label>
                <div class="col-sm-6">
                    <select class="form-control" name="status" id="inputStatus">
                        <option value="admin">admin</option>
                        <option value="employee" selected>employee</option>
                    </select>
                </div>
              </div>


                
 
           
                       
            <div class=" row col-lg-offset-6"> 
            <input  type="submit" value="Submit" class="btn btn-success col-lg-4">
            </div>
        </form>
        
    </div>
    </body>
</html>