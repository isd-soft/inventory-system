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
        <title>Add new employee</title>
        <link type="text/css" rel="stylesheet" href="<c:url value='style/css/bootstrap.min.css' />" />
    </head>
    <body>
       <div class="container">
            <div class="row"><h1 class="text-center">Edit employee</h1></div>
        <form method="POST" action='UserController?action=update' name="frmAddUser" class="form-horizontal">
            
            <input type="hidden" name="emp_ID"
                               value="<c:out value="${user.empID}" />" /> <br /> 
                                 <c:set var="id" value="${user.empID}"/>
              <div class="form-group">
                <label for="inputName" class="col-sm-2 control-label col-lg-offset-2">Name</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="nume" id="inputName" value="<c:out value="${user.name}" />" /> <br /> 
                </div>
              </div>

              <div class="form-group">
                <label for="inputSurname" class="col-sm-2 control-label col-lg-offset-2">Surname</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="surname" id="inputSurname" value="<c:out value="${user.surname}" />" /> <br /> 
                </div>
              </div>
                
              <div class="form-group">
                <label for="inputPhone" class="col-sm-2 control-label col-lg-offset-2">Phone</label>
                <div class="col-sm-6">
                    <input class="form-control" type="text" name="phone" id="inputPhone" value="<c:out value="${user.phone}" />" /> <br /> 
                </div>
              </div>
                
              <%
              String id_us=pageContext.getAttribute("id").toString();
              System.out.println("users id:"+id_us);
              clients get_us_id=new clients();
              User user;
              user=get_us_id.client_send_get_user_id(id_us);
              %>
             <div class="form-group">
                <label for="inputDate" class="col-sm-2 control-label col-lg-offset-2">Date hired</label>
                <div class="col-sm-6">
               <input id="inputDate" class="form-control" type="text" name="dob"  value="<%=user.getHired().getYear()%>/<%=user.getHired().getMonth()%>/<%=user.getHired().getDay()%>"/><br />
                </div>
              </div> 
           
                       
            <div class=" row col-lg-offset-6"> 
            <input  type="submit" value="Submit" class="btn btn-success col-lg-4">
            </div>
        </form>
        
    </div>      
    </body>
</html>