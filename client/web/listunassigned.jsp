<%@page import="com.client.Item"%>
<%@page import="java.util.List"%>
<%@page import="com.client.clients"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="style/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/>
 

    <script src="style/js/jquery-1.12.3.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/t/bs/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>

    <script src="style/js/bootstrap.min.js"></script>
        <script>
        $(document).ready(function() {
    $('#sort').DataTable();
} );    
            
        </script>                    
    <title>ISD Inventory</title>
</head>


<body>
               <%@ include file="navbar.jsp" %> 
               
<%
 
            String status=session.getAttribute("userstatus").toString();
        String bprop="";
        if (status.equals("admin")){
        bprop="";
        } else {
        bprop="hidden";
        }
    clients cl=new clients();
    List<Item> rs=cl.client_get_litunassigned();
%>               
               
               
               
               
<div class="container">   
    
        <h1 class="text-center">Unassigned items</h1>
                   
               
        
        <table id="sort" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
            <thead>
                <tr>
                    
                    <th>Name</th>
                    <th>Barcode</th>
                    <th>Brand</th>
                    <th>Model</th>
                    <th>Serial</th>
                    <th>Type</th>
                    <th > </th>
                    <th > </th>
                    <th > </th>
                </tr>
            </thead>
            <tbody>
                
                <%
            //  while(rs.next()){
                for(int i=0;i<rs.size();i++){
                %>
                
           
                                      
                    <tr>

                        <td><%= rs.get(i).getItemName() %></td>
                        <td><%= rs.get(i).getItemBarcode() %></td>
                        <td><%= rs.get(i).getItemBrand() %></td>
                        <td><%= rs.get(i).getItemModel() %></td>
                        <td><%= rs.get(i).getItemSerial() %></td>
                        <td><%= rs.get(i).getTypeName() %></td>
                        

                        <td><a class="btn btn-success <%=bprop%> " href="afs.jsp?itemBarcode=<c:out value="<%= rs.get(i).getItemBarcode() %>"/>">Assign item</a></td>
                        <td><a class="btn btn-danger" href="ItemController?action=delete&itemId=<c:out value="<%= rs.get(i).getTypeId() %>"/>&com=keks">Delete</a></td>
                        <td><form ACTION="search.jsp" METHOD="POST">
                                  <input type="hidden" name="barcode" value="<%= rs.get(i).getItemBarcode() %>">
                                  <input type="submit" class="btn btn-info" Value="Info"> 
                            </form></td>
                    </tr>
                <%
                   }
                %>
            </tbody>
        </table>

        

      
      
      
      
      
  </div>
                    
                    
                 
        



        
</body>
</html>