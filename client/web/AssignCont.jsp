<%-- 
    Document   : AssignCont
    Created on : Apr 13, 2016, 3:00:03 PM
    Author     : Ed
--%>


<%@page import="com.client.Reset"%>
<%@page import="java.util.List"%>
<%@page import="com.client.clients"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        String empName=request.getParameter("com");
        String[] ns=empName.split(" ");
        String barcode=request.getParameter("item_barcode");
         clients clie=new clients();
        
        List<Reset> rs=clie.client_get_ResultSet2(ns[0], ns[1]);
        
        if(rs.size()>0){
       
          String empId=rs.get(0).getVal1();
          clie.client_execute_delete_AssignCont(barcode);
          clie.client_execute_insert_AssignCont(barcode,empId);
        response.sendRedirect("emp_items.jsp?com="+empName);
          }

        %>
    </body>
</html>
