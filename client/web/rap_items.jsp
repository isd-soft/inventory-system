
<%@page import="com.client.Reset"%>
<%@page import="com.client.User"%>
<%@page import="java.util.List"%>
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
    $('#sort').DataTable(
            {
    paging: false
});
} );    

var tableToExcel = (function () {
        var uri = 'data:application/vnd.ms-excel;base64,'
        , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--></head><body><table>{table}</table></body></html>'
        , base64 = function (s) { return window.btoa(unescape(encodeURIComponent(s))) }
        , format = function (s, c) { return s.replace(/{(\w+)}/g, function (m, p) { return c[p]; }) }
        return function (table, name, filename) {
            if (!table.nodeType) table = document.getElementById(table)
            var ctx = { worksheet: name || 'Worksheet', table: table.innerHTML }

            document.getElementById("dlink").href = uri + base64(format(template, ctx));
            document.getElementById("dlink").download = filename;
            document.getElementById("dlink").click();

        }
    })()
    
    
        </script>                    
    <title>ISD Inventory</title>
</head>
<%
String d=request.getParameter("date");
String s=request.getParameter("type");

%>

<body>
               <%@ include file="navbar.jsp" %> 
<div class="container">   
    
        <h1 class="text-center">All items</h1>
            <div class="row">
<input type="button" onclick="tableToExcel('sort', '<%=s%>', '<%=d%><%=s%>')" value="Export to Excel" class="btn btn-success col-lg-4 col-lg-offset-4" style="margin-bottom: 20px;">
      <a id="dlink"  style="display:none;"></a>
            </div>
        <table id="sort" class="table table-striped table-bordered table-hover" cellspacing="0" width="100%">
            <thead>
                <tr>
                    
                    <th>Name</th>
                    <th>Barcode</th>
                    <th>Brand</th>
                    <th>Model</th>
                    <th>Serial</th>
                    <th>Type</th>

                </tr>
            </thead>
            <tbody>
<%
/*
Connection con= Database.getConnection();
Statement st=con.createStatement();
String sql="SELECT * from items INNER JOIN types ON items.type_id=types.type_id";
ResultSet rs=st.executeQuery(sql);
while (rs.next()){ 
*/
clients cl=new clients();
List<Reset> rs=cl.get_raport_intemes();
for(int i=0;i<rs.size();i++){
%>
               
 <tr>

     <td><%=rs.get(i).getVal1() %></td>
    <td><%=rs.get(i).getVal2()%></td>
    <td><%=rs.get(i).getVal3()%></td>
    <td><%=rs.get(i).getVal4()%></td>
    <td><%=rs.get(i).getVal5()%></td>
    <td><%=rs.get(i).getVal6()%></td>

</tr>       


<%}%>
       
               
            </tbody>
        </table>

        

      
      
      
      
      
  </div>
                    



    
</div>    
</body>
</html>