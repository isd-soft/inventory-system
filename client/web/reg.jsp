<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link type="text/css" rel="stylesheet" href="style/css/bootstrap.css" />
        <script src="style/js/jquery-1.9.1.js"></script>
        <script src="style/js/bootstrap.min.js"></script>
        <title>Registration</title>
    </head>
    <body>
           
    <div class="container">
        <div class="row"><h1 class="text-center">Add new account</h1></div>
        <form method="GET" action="AccountController" class="form-horizontal">
           
            <div class="form-group">
                <label for="inputEmail" class="col-sm-2 control-label col-lg-offset-2">Email</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="email" id="inputEmail" value="" /> <br /> 
                </div>
            </div>
            
            <div class="form-group">
                <label for="inputUsername" class="col-sm-2 control-label col-lg-offset-2">Username</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="uname" id="inputUsername" value="" /> <br /> 
                </div>
            </div>
                    
            <div class="form-group">
                <label for="inputPass" class="col-sm-2 control-label col-lg-offset-2">Password</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="pass" id="inputPass" value="" /> <br /> 
                </div>
            </div>

            <div class="form-group">
                <label for="inputStatus" class="col-sm-2 control-label col-lg-offset-2">Status</label>
                <div class="col-sm-6">
                    <select class="form-control" name="status" id="inputStatus">
                        <option value="admin">admin</option>
                        <option value="employee" selected>employee</option>
                    </select>
                </div>
            </div>

              <input type="hidden" name="action"  value="regnew" />
              
            <div class=" row col-lg-offset-6"> 
            <input  type="submit" value="Submit" class="btn btn-success col-lg-4">
            </div>



        </form>
            
            
            
            
            
    </div>           
    </body>
</html>
