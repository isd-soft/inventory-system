<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
      
    <head>
     <!--   <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Add new employee</title>
        <link type="text/css" rel="stylesheet" href="<c:url value='style/css/bootstrap.min.css' />" />
        -->
            <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="style/js/jquery-1.9.1.js"></script>
    <script src="style/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <link type="text/css" rel="stylesheet" href="<c:url value='style/css/bootstrap.min.css' />" />
    <title>Add new employee</title>
    
    </head>
    
    <body>
         
        
        
          <div class="container">
            <div class="row"><h1 class="text-center">Add new employee</h1></div>
        <form method="POST" action='UserController?action=update_12' name="frmAddUser" class="form-horizontal">
            
            <input type="hidden" name="emp_ID"/><br/> 
                 
              <div class="form-group">
                <label for="inputName" class="col-sm-2 control-label col-lg-offset-2">Name</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="nume" id="inputName" /><br /> 
                </div>
              </div>

              <div class="form-group">
                <label for="inputSurname" class="col-sm-2 control-label col-lg-offset-2">Surname</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="surname" id="inputSurname"/><br /> 
                </div>
              </div>
                
              <div class="form-group">
                <label for="inputPhone" class="col-sm-2 control-label col-lg-offset-2">Phone</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="phone" id="inputPhone"/> <br /> 
                </div>
              </div>

             <div class="form-group">
                <label for="inputDate" class="col-sm-2 control-label col-lg-offset-2">Date hired</label>
                <div class="col-sm-6">
                    <input id="inputDate" class="form-control" type="text" name="dob" pattern="\d{4}/\d{1,2}/\d{1,2}" placeholder="yyyy/mm/dd" /><br />
                </div>
              </div> 
           
                       
            <div class=" row col-lg-offset-6"> 
            <input  type="submit" value="Submit" class="btn btn-success col-lg-4">
            </div>
        </form>
        
    </div>
        
    </body>
        
          <script>
  $(function() {
    $( "#inputDate" ).datepicker({ dateFormat: 'yy/mm/dd' });
  });
  </script>
</html>