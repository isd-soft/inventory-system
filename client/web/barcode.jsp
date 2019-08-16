
<%@page import="com.client.Type"%>
<%@page import="java.util.List"%>
<%@page import="com.client.clients"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
/*Connection connection = Database.getConnection();
Statement statement=connection.createStatement();
String query = "select * from types";
ResultSet resultSet = statement.executeQuery(query);*/

clients cl=new clients();
List<Type> res=cl.client_generator_work_barcodes();

%>
<html>
    <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link type="text/css" rel="stylesheet" href="style/css/bootstrap.min.css" />

    <script src="style/js/jquery-1.9.1.js"></script>
    <script src="style/js/bootstrap.min.js"></script>
        <title>Generate barcodes</title>
    </head>

    <body>
<%@ include file="navbar.jsp" %> 
<div class="container">
            <div class="row"><h1 class="text-center">Generate barcodes</h1></div>
            <center>
<div class="row"> 
                
        <form role="form" action="ProccesServlet" class="formcl" method="GET" class="form-horizontal">
		
			  <div class="form-group col-lg-4 col-lg-offset-4">
				<label for="inputType">Barcodes for:</label>
			<select name="type" class="form-control" required id="inputType">
														  <option selected disabled hidden style='display: none' value=''></option>

							<%
							//while (resultSet.next()){
							for(int i=0;i<res.size();i++ ){
							%>               
                                                                <option  value="<%= res.get(i).getTypePrefix() %>"> 
									<%=  res.get(i).getTypeName()%> 
								</option>
							<%}%>
							 </select>
			  </div>
			  <div class="form-group col-lg-4 col-lg-offset-4">
				<label for="pwd">Number of barcodes</label>
				<input class="form-control" type="number" name="copyNr" min="72" step="72"  id="pwd" />
			  </div>
			  </div>
							 
			<div class="row">
				<input type="submit" class="btn btn-primary col-lg-2 col-lg-offset-5" value="Generate">
			</div>

</form>
   
                 
            </center>   
                 
                 
    </body>
</html>
