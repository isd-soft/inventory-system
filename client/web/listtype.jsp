<%-- 
    Document   : listuser
    Created on : Mar 31, 2016, 9:35:28 AM
    Author     : Ed
--%>

<%@page import="com.client.Type"%>
<%@page import="java.util.List"%>
<%@page import="com.client.clients"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
      <script src="style/js/jquery-1.9.1.js"></script>
    <script src="style/js/bootstrap.min.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Types of items</title>
    <link type="text/css" rel="stylesheet" href="<c:url value='style/css/bootstrap.min.css' />" />
   
</head>


<body>
    <%@ include file="navbar.jsp" %> 
<div class="container">   
    <div clas="row"><h1 class="text-center">Types of items</h1></div>
    <div class="row">
        <table class="table table-striped table-responsive table-hover">
            <thead>
                <tr>
                    <%-- <th>ID</th>--%>
                    <th>Name</th>
                    
                    <th colspan="2"> </th>
                </tr>
            </thead>
            <tbody>
                <%
                 clients cl=new clients();
                 List<Type> typ=cl.client_send_get_all_type();
                 for(int i=0;i<typ.size();i++)
                 {
                %>
                 <tr>                     
                        <td><%=typ.get(i).getTypeName()%></td>
                        <td><%=typ.get(i).getTypePrefix() %></td>
                        <td><a class="btn btn-warning" href="TypeController?action=edit&typeId=<c:out value="<%=typ.get(i).getTypeId()%>"/>" >Update</a></td>
                        <td><a class="btn btn-danger" href="TypeController?action=delete&typeId=<c:out value="<%=typ.get(i).getTypeId()%>"/>">Delete</a></td>
                    </tr>              
               <%
                 }
               %>
               
            </tbody>
        </table>
        <p><a href="TypeController?action=insert"  style="text-align:center" ><button class="btn btn-primary">Add type</button></a></p>



    </div>
</div>    
 <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>

</body>
</html>