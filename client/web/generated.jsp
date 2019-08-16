<%-- 
    Document   : generated
    Created on : Apr 20, 2016, 11:02:57 AM
    Author     : Ed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link type="text/css" rel="stylesheet" href="style/css/bootstrap.min.css" />

    <script src="style/js/jquery-1.9.1.js"></script>
    <script src="style/js/bootstrap.min.js"></script>
        <title>Generated barcodes</title>
    </head>
    </head>
    <body>
<%
    String sType = request.getParameter("type");
    int nr = Integer.parseInt(request.getParameter("nr"));
    %>
    <%@ include file="navbar.jsp" %> 
    <div class="container">
        <div class="row" style="text-align: center">
            <h2>You have successfully generated <br>
                <%=nr%> barcodes for <%=sType%>!</h2>
    <a class ="glyphicon glyphicon-download-alt" href="download.jsp" style="font-size:4.5em; color:green; text-decoration: none; cursor: pointer; margin-top: 20px;" ></a>
    </div>
    </div>
    
    
    </body>
</html>
