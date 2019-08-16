

<%@page import="java.sql.Types"%>
<%@page import="java.util.List"%>
<%@page import="com.client.Type"%>
<%@page import="com.client.clients"%>
<%@page import="com.client.Item"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Add new item</title>
        <link type="text/css" rel="stylesheet" href="<c:url value='style/css/bootstrap.min.css' />" />
    </head>
    <body>
        <%
         clients cl=new clients();
           Item item = cl.client_send_get_item_id(request.getParameter("itemId"));
        %>
        <div class="container">
            <div class="row"><h1 class="text-center">Add new item</h1></div>
        <form method="POST" action='ItemController' name="frmAddItem" class="form-horizontal">
            
            <input type="hidden" name="item_id" value="<c:out value="<%=item.getItemId()%>" />" /> <br /> 
                 
           
            
            
              <div class="form-group">
                <label for="inputName" class="col-sm-2 control-label col-lg-offset-2">Name</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="item_name" id="inputName" value="<c:out value="<%=item.getItemName()%>" />" /> <br /> 
                </div>
              </div>

              <div class="form-group">
                <label for="inputBarcode" class="col-sm-2 control-label col-lg-offset-2">Barcode</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="item_barcode" id="inputBarcode" value="<c:out value="<%=item.getItemBarcode()%>" />" /> <br /> 
                </div>
              </div>
                
              <div class="form-group">
                <label for="inputBrand" class="col-sm-2 control-label col-lg-offset-2">Brand</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="item_brand" id="inputBrand" value="<c:out value="<%=item.getItemBrand()%>" />" /> <br /> 
                </div>
              </div>

              <div class="form-group">
                <label for="inputModel" class="col-sm-2 control-label col-lg-offset-2">Model</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="item_model" id="inputModel" value="<c:out value="<%=item.getItemModel()%>" />" /> <br /> 
                </div>
              </div>
                
              <div class="form-group">
                <label for="inputSerial" class="col-sm-2 control-label col-lg-offset-2">Serial</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="item_serial" id="inputSerial" value="<c:out value="<%=item.getItemSerial()%>" />" /> <br /> 
                </div>
              </div>
           
                
              <div class="form-group">
                <label for="inputType" class="col-sm-2 control-label col-lg-offset-2">Type ID</label>
                <div class="col-sm-6">
                    
                    <select class="form-control" name="type_id"  id="inputType" label=" " >
             <%
                 List<Type> type=cl.client_send_get_all_type();
                 for(int i=0;i<type.size();i++)
                  { 
             %>  
                  <option value="<%=type.get(i).getTypeId()%>" >
                 <%=type.get(i).getTypeName()%>
                </option>
                <%
                    }
                %>                       
                </select>
                    
                    
                    
                
                </div>
              </div>

                
                
            <div class=" row col-lg-offset-6"> 
            <input  type="submit" value="Submit" class="btn btn-success col-lg-4">
            </div>
        </form>
        
    </div>
    </body>
</html>