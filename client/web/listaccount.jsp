<%-- 
    Document   : listaccount
    Created on : Mar 31, 2016, 9:35:28 AM
    Author     : Ed
--%>

<%@page import="com.client.Account"%>
<%@page import="java.util.List"%>
<%@page import="com.client.clients"%>
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
    <title>ISD accounts</title>
    <link type="text/css" rel="stylesheet" href="style/css/bootstrap.css" />
   
</head>


<body>
  <%@ include file="navbar.jsp" %> 
    <%
    clients cl=new clients();
    List<Account> ac=cl.client_get_all_account();
    %>
<div class="container">   
    
        <h1 class="text-center">ISD accounts</h1>
    <div class="row">
        <table class="table table-striped table-responsive table-hover">
            <thead>
                <tr>
                    <%-- <th>ID</th>--%>
                    <th>Email</th>
                    <th>Username</th>
                    <th>Passord</th>
                    <th>Status</th>
                    <th colspan="2"> </th>
                </tr>
            </thead>
            <tbody>
    
                    <%
                        for(int i=0;i<ac.size();i++){
                    %>
                     <tr>
                        <%-- <td><c:out value="${user.emp_ID}" /></td>--%>
                        <td><c:out value="<%=ac.get(i).getEmail()%>" /></td>
                        <td><c:out value="<%=ac.get(i).getUname()%>" /></td>
                        <td><c:out value="<%=ac.get(i).getPass()%>" /></td>
                        <td><c:out value="<%=ac.get(i).getStatus()%>" /></td>
                        <td><a class="btn btn-warning" href="AccountController?action=edit&accountId=<c:out value="<%=ac.get(i).getId() %>"/>" >Update</a></td>
                        <td><a class="btn btn-danger" href="AccountController?action=delete&accountId=<c:out value="<%=ac.get(i).getId() %>"/>">Delete</a></td>
                    </tr>
                    <%
                        }
                    %>
            </tbody>
        </table>
        <p><a href="reg.jsp"  style="text-align:center" ><button class="btn btn-primary">Add an account</button></a></p>



    </div>
</div>    


</body>
</html>