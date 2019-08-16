<%-- 
    Document   : basic
    Created on : Apr 5, 2016, 3:52:07 PM
    Author     : Ed
--%>

<%@page import="com.client.Reset"%>
<%@page import="com.client.clients"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<HTML>
    <head>
        <title>Search result</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="style/css/bootstrap.css">
              <link rel="stylesheet" href="style/css/jquery-ui.css">
        <script src="style/js/jquery-1.9.1.js"></script>
        <script src="style/js/jquery-ui.js"></script>
        <script src="style/js/bootstrap.min.js"></script>
    </head>

    
    
    <BODY>

        
        
        <%@ include file="navbar.jsp" %>     
<div class="container">
    

    

        <% 
            
            String status=session.getAttribute("userstatus").toString();
        String bprop="";
        if (status.equals("admin")){
        bprop="";
        } else {
        bprop="hidden";
        }          
            clients cl=new clients();
         
            String none="nobody";  
            String id = request.getParameter("barcode");  
             
             List<Reset> resultset=cl.client_serch_date1(id);
            List<Reset> resultset2=cl.client_serch_date2(id);
            
            /*ResultSet resultset =statement.executeQuery(sql) ; 
            ResultSet resultset2 =statement2.executeQuery(sql2) ;*/
            
            
            //if(!resultset.next() ) {
               if(resultset.size()==0 ) { 
            if (request.getParameter("barcode")==null) {
                out.println("");
            }   else {
                
                %>
                <h3>Sorry, could not find that item</h3>
            
            <%}
            } else {
        %>

    <div class="col-lg-8 col-lg-offset-2">
    
        <H1>Item information</H1>
        
        <TABLE  class="table table-responsive table-hover">
            <thead>
            <TR>
               <TH>Barcode</TH>
               <TH>Name</TH>
               <TH>Type</TH>
               <TH>Owner</TH>
               
               <th > </th>
               
           </TR>
            </thead>
            <TBODY>
           <TR>
               <TD> <%= resultset.get(0).getVal1() %> </TD>
               <TD> <%=  resultset.get(0).getVal2()  %> </TD>
               <TD> <%=  resultset.get(0).getVal3()  %> </TD>
               
               <TD> <% if ( resultset.get(0).getVal4() !="") { %>
                   <%=  resultset.get(0).getVal4()  %> 
                    <%=  resultset.get(0).getVal5()  %> 
               <%} else {%> 
               Nobody 
               <% }%>
               </TD>
               
               
                 
             <%  if( resultset.get(0).getVal4()!=null) {%>
                        <td><a class="btn btn-danger <%=bprop%> " href="AssignController?action=delete&assignId=<c:out value="<%=  resultset.get(0).getVal1()  %>"/>&com=keks">Deassign</a></td>
            <%} else {%>
    

                         
                        <td><a class="btn btn-success <%=bprop%> " href="afs.jsp?itemBarcode=<c:out value="<%=  resultset.get(0).getVal1()  %>"/>">Assign item</a></td>
                        <td><a class="btn btn-danger <%=bprop%> " href="ItemController?action=delete&itemId=<c:out value="<%=  resultset.get(0).getVal6()  %>"/>&com=keks">Delete Item</a></td>
           

                        
             <%}%>              
                        
                       
               
           </TR>
            </TBODY>
       </TABLE>
            <BR><BR>         
                   
            
            
<% if (resultset2.size()==0 )
{
                out.println("Item wasn't assigned yet. ");
            } else {

%>            
            
<H1>Item history</H1>
<TABLE class="table table-responsive table-hover">
            
    <thead>
            <TR>
               <TH>Name</TH>
               <TH>Surname</TH>
               <TH>Modified</TH>
               <TH>Status</TH>
           </TR>
    </THEAD>
    <TBODY>      
     
<%
   
    for(int i=0;i<resultset2.size();i++){
%>
            <TR>
               <TD> <%= resultset2.get(i).getVal1() %> </TD>
               <TD> <%= resultset2.get(i).getVal2() %> </TD>
               <TD> <%= resultset2.get(i).getVal3() %> </TD>
               <TD> <%= resultset2.get(i).getVal4() %> </TD>
            </TR>
<%}%>            
    </tbody>
       </TABLE>                        
 
<%}%>

       <BR>
       <% 
           } 
       %>
    
    </div>
</div>  
       
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
               action="asf.jsp"
               name="frmAddAssign">
          <div class="form-group">
            <label for="item-barcode" class="control-label">Item barcode</label>
            <input type="text" class="form-control" id="item-barcode" name="item_barcode" id="com" name="com">
          </div>
 
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

       
       
       
       
       
       
       
    </BODY>
</HTML>