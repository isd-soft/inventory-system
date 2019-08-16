

<%@page import="com.client.Item"%>
<%@page import="java.util.List"%>
<%@page import="com.client.Type"%>
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
    
<div class="container">   
    <div clas="row"><h1 class="text-center">ISD Inventory</h1></div>
    
                    
                    <%
                        clients cl=new clients();
                        
                    %>                    
           
       
        
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
                    
                </tr>
            </thead>
            <tbody>
                
                  <%
                      
                        List<Item> item=cl.client_send_get_all_item();
                        
                        for(int j=0;j<item.size();j++)
                         {
                             
                             List<Type> typ=cl.client_send_get_all_type();
                        
                        for(int i=0;i<typ.size();i++)
                         {
                             if(item.get(j).getTypeId().equals(typ.get(i).getTypeId()))
                               {
                    %> 
                
                    <tr>
                        <td><c:out value="<%=item.get(j).getItemName()%>" /></td>
                        <td><c:out value="<%=item.get(j).getItemBarcode()%>" /></td>
                        <td><c:out value="<%=item.get(j).getItemBrand()%>" /></td>
                        <td><c:out value="<%=item.get(j).getItemModel()%>" /></td>
                        <td><c:out value="<%=item.get(j).getItemSerial()%>" /></td>
                        
                        <td><c:out value="<%=typ.get(i).getTypeName()%>" /></td>
                        
                        <td><a class="btn btn-warning" href="ItemController?action=edit&itemId=<c:out value="<%=item.get(j).getItemId()%>"/>" >Update</a></td>
                        <td><a class="btn btn-danger" href="ItemController?action=delete&itemId=<c:out value="<%=item.get(j).getItemId()%>"/>">Delete</a></td>
                    </tr>
                    
                    <%
                             }
                        }
                    %>
                    
                    
  
        
                    
               <%
                   }
               %>                    
            </tbody>
        </table>
        
                <div class="row " style="text-align: center">
    <p><a href="ItemController?action=insert"   class="glyphicon glyphicon-plus" 
                                    style="font-size:2.3em; color:green; text-decoration: none; margin-top: 20px;"></a></p>
    </div>
            
            
</div>    


</body>
</html>