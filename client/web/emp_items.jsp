

<%@page import="com.client.clients"%>
<%@page import="com.client.Reset"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>View Items</title>
        <link rel="stylesheet" href="style/css/jquery-ui.css">
        <link rel="stylesheet" href="style/css/sweetalert.css">
        <script src="style/js/jquery-1.9.1.js"></script>
        <script src="style/js/jquery-ui.js"></script>
        <script src="style/js/bootstrap.js"></script>
        <script src="style/js/sweetalert.min.js"></script>
        <link type="text/css" rel="stylesheet" href="<c:url value='style/css/bootstrap.min.css' />" />
        <script>
                // When any key is down
                $(document).keydown(function(){

                    // Get the input element and its value
                    var i=$("#com");
                    var val=i.val();

                    // Send request only if user types alphabet
                    // because auto.jsp returns names of companies
                    // which contains only alphabets
                    if(val.match(/^[A-z]+$/))
                    {
                        // Send request and get the data
                        $.get("auto.jsp?com="+val,function(data){

                            // Get each item separated by new line
                            var items=data.split("\n");

                            // put those items in autocomplete! That's it!
                            i.autocomplete({source:items});
                            i.autocomplete({ minLength: 1 });
                        });
                    }
                    
                });
                
                
                
                
            $('#exampleModal').on('show.bs.modal', function (event) {
  var button = $(event.relatedTarget) // Button that triggered the modal
  var recipient = button.data('whatever') // Extract info from data-* attributes
  // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
  // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
  var modal = $(this)
  modal.find('.modal-title').text('New message to ' + recipient)
  modal.find('.modal-body input').val(recipient)

})

        </script>
    </head>
    

    <%

    
    String empname = request.getParameter("com");
    if (empname==null) empname="";
   

    %>
    <%--<body style="background-image: url(style/rustic.jpg) ; min-height: 100% ">--%>
    <body>
        <%@ include file="navbar.jsp" %>
        
                      
          
        <div class="container">
            <h1 class="text-center">Employee items</h1>
            <div class="row">
                <div class="col-lg-3">
                <form class="form-horizontal" action="emp_items.jsp">
                    
                    <input autocomplete="off" type="text" id="com" name="com" class="form-control" value="<%=empname%>" style="margin-top:35px"/>
                    <input type="submit" value="Go" class="btn btn-succes form control">
                </form>
                                           
                    
                </div>
                
                <div class="col-lg-9">
                <table class="table table-responsive table-hover">
                         
                <%
                
                 clients cl=new clients();
                    
                   if (empname!=""){
                    
                   String[] ns=empname.split(" "); 
                   System.out.println("ne uitam n0 n1:"+ns[0]+" "+ns[1]+"");
                   List<Reset> reuslt=cl.client_get_ResultSet(ns[0],ns[1]);
                   List<Reset> reuslt2=cl.client_get_ResultSet1(ns[0],ns[1]);
                   List<Reset> reuslt3=cl.client_get_ResultSet2(ns[0],ns[1]);
                                           
%>   
                    
                      <%

                        String nss=request.getParameter("com");
                         String[] op=nss.split(" ");
                         String eId="";   
                         List<Reset> rss=cl.client_get_ResultSet3(op[0],op[1]);
                        if (rss.size()>0) eId=rss.get(0).getVal1();
                    %>
                    
                    
                    
<%-- MODAL WINDOW FOR ASSIGNING AN OBJECT--%>
                    
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">Assign a new item</h4>
      </div>
      <div class="modal-body">
          
        <form  method="POST"                
               action="AssignController?action=edit&empId=<%= eId %>&com=<%=empname%>"
               name="frmAddAssign">
            
          <div class="form-group">
            <label for="item-barcode" class="control-label">Item barcode</label>
            <input type="text" class="form-control" id="item-barcode" name="item_barcode">
          </div>
            <input type="text"  name="emp_name"   value="<%= empname %>" >
            <input type="text"  name="emp_id"   value="<%= eId %>" 
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="submit" class="btn btn-primary">Assign</button>
      </div>
    </div>
  </div>
</div>
                    
<%--END OF MODAL WINDOW FOR ADD --%>




                    <thead >
                        <tr>
                            <th style="border-top:none">Type</th>
                            <th style="border-top:none">Model</th>
                            <% if ( reuslt2.size()>0) {%>
                            <th style="border-top:none">
                                    
                                <a  class="glyphicon glyphicon-plus" 
                                    style="font-size:1.2em; color:green; text-decoration: none;"
                                    
                                    data-toggle="modal" data-target="#exampleModal" 
                            
                            </th>
                            <%} else  if( reuslt3.size()>0) {%>
                            <th><a  class="glyphicon glyphicon-plus" 
                                    style="font-size:1.2em; color:green; text-decoration: none;"
                                    
                                    data-toggle="modal" data-target="#exampleModal" 
                                    ></a>     
                                     </th>
                            
                            <%}%>
                          
                        </tr>
                    </thead>
                        <% for(int i=0;i< reuslt.size();i++){%>    
                    <tbody>
                        <tr>
                         
                            <td><%=  reuslt.get(i).getVal1() %></td>
                            <td><%= reuslt.get(i).getVal2() %></td>
                
                           
                                 <%----%> 
                            <td><a  
                                   class="glyphicon glyphicon-minus " 
                                   style="font-size:1.2em; color:red; text-decoration: none; pointer:cursor"
                                   
                                   href="AssignController?action=delete&assignId=<%= reuslt.get(i).getVal3()%>&com=<%=empname%> "
                                    onclick="return confirm('Are you sure you want to deassign?')" 
                                   ></a>
                                   

                                   
                            </td>
                        </tr>
<%-- MODAL FOR DELETE BEGIN--%>

<%-- END MODAL FOR DELETE--%>
                    <%}

    
    
    
    }%>
                    </tbody>
        </table>

                    
                </div>
                         
            
            </div>
                                       
              
        </div>
                    
    
</html>
</html>
