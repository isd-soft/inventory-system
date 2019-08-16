<%-- 
    Document   : afs
    Created on : Apr 13, 2016, 1:26:04 PM
    Author     : Ed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Assign</title>
        <link type="text/css" rel="stylesheet" href="style/css/bootstrap.css" />
                <link rel="stylesheet" href="style/css/jquery-ui.css">

        <script src="style/js/jquery-1.9.1.js"></script>
        <script src="style/js/jquery-ui.js"></script>
                <script src="style/js/bootstrap.js"></script>
        <script>
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
        </script>
    
    </head>
    <body>
        <%@ include file="navbar.jsp" %>
        <div class="container">
            <div class="row"><h1 class="text-center">Assign an object to an employee</h1></div>
        <form id="myform" method="POST" action="AssignCont.jsp" name="frmAddAssign" class="form-horizontal">
            
                       
              <div class="form-group">
                <label for="inputBarcode" class="col-sm-2 control-label col-lg-offset-2">Item barcode</label>
                <div class="col-sm-6">
                    <%

                        String itemBarcode=request.getParameter("itemBarcode");
                        
                    %>
                    <input class="form-control" type="text" name="item_barcode" id="inputBarcode"  value="<%=itemBarcode%>" readonly/> <br /> 
                </div>
              </div>
              
                <div class="form-group">
                <label for="com" class="col-sm-2 control-label col-lg-offset-2">Employee</label>
                <div class="col-sm-6">           
<input autocomplete="off" type="text" id="com" name="com" class="form-control" value="" />

                   </div>
              </div>        
                       
            <div class=" row col-lg-offset-6"> 
                <input type="submit" value="Submit"  class="btn btn-success col-lg-4">
            </div>
        </form>
        
    </div>
    </body>
</html>