<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.client.User"%>
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
    <link type="text/css" rel="stylesheet" href="<c:url value='style/css/bootstrap.min.css' />" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/>
    <script src="style/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/t/bs/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/plug-ins/1.10.11/sorting/date-uk.js"></script>
    <script src="style/js/bootstrap.min.js"></script>
    <title>ISD employees</title>
   <script>
        $(document).ready(function() {
    $('#emp').DataTable( {
      "aoColumnDefs": [
          { 'bSortable': false, 'aTargets': [ 3,4,5,6 ] }
       ]
} );
} );    
            
        </script>  
</head>
<body> 
      <%@ include file="navbar.jsp" %> 

      
      <div class="container">   
        <h1 class="text-center">ISD employees</h1>
    <div class="row">
        <table class="table table-striped table-responsive table-hover" id="emp">
            <thead>
                <tr>
                    <%-- <th>ID</th>--%>
                    <th>Name</th>
                    <th>Surname</th>
                    <th>Date hired</th>
                    <th>Phone number</th>
                    <th> </th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
      
                <%
           clients get_all_us=new clients();
          List<User> user=new ArrayList<>();
          user=get_all_us.client_send_get_all_user();
             for(int i=0;i<user.size();i++){ 
         %>
                <tr>
                    <td><%= user.get(i).getName() %></td>
                    <td><%= user.get(i).getSurname()  %></td>
                    <td><%= user.get(i).getHired().getYear()%>/<%= user.get(i).getHired().getMonth()%>/<%= user.get(i).getHired().getDay()%></td>
                    <td><%= user.get(i).getPhone()  %></td>
                    <td><a  class="btn btn-warning" href="UserController?action=edit&userId=<c:out value="<%= user.get(i).getEmpID() %>"/>">Update</a></td>
                    <td><a class="btn btn-danger" href="UserController?action=delete&userId=<c:out value="<%= user.get(i).getEmpID() %>"/>">Delete</a></td>
                    <td><a class="btn btn-info" href="emp_items.jsp?com=<%= user.get(i).getName() %> <%= user.get(i).getSurname()  %>"> Items</a></td>
                </tr>
            <%
                }
            %>

            </tbody>
        </table>
        <p><a href="UserController?action=insert"  style="text-align:center" ><button class="btn btn-primary">Add employee</button></a></p>



    </div>
</div>    
</body>
</html>