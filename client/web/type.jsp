<%-- 
    Document   : type
    Created on : Mar 31, 2016, 9:37:31 AM
    Author     : Ed
--%>

<%@page import="com.client.clients"%>
<%@page import="com.client.Type"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Add new type</title>
        <link type="text/css" rel="stylesheet" href="<c:url value='style/css/bootstrap.min.css' />" />
    </head>
    <body>
        <div class="container">
            <div class="row"><h1 class="text-center">Add new type</h1></div>
        <form method="POST" action='TypeController' name="frmAddType" class="form-horizontal">
            <%
             clients cl=new clients();
            Type type = cl.client_send_get_type_id( request.getParameter("typeId"));
            %>
            <input type="hidden" name="type_id"
                   value="<c:out value="<%=type.getTypeId()%>" />" /> <br /> 
                 
                      
              <div class="form-group">
                <label for="inputName" class="col-sm-2 control-label col-lg-offset-2">New type</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="type_name" id="inputName" value="<c:out value="<%=type.getTypeName()%>" />" /> <br /> 
                </div>
              </div>
              <div class="form-group">
                <label for="inputNp" class="col-sm-2 control-label col-lg-offset-2">Type Prefix</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="type_prefix" id="inputNp" value="<c:out value="<%=type.getTypePrefix()%>" />" /> <br /> 
                </div>
              </div>


           
                       
            <div class=" row col-lg-offset-6"> 
            <input  type="submit" value="Submit" class="btn btn-success col-lg-4">
            </div>
        </form>
        
    </div>
    </body>
</html>