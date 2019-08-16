<%-- 
    Document   : rap_empitems
    Created on : Apr 15, 2016, 2:21:54 PM
    Author     : Ed
--%>

<%@page import="com.client.Type"%>
<%@page import="com.client.Reset"%>
<%@page import="java.util.List"%>
<%@page import="com.client.clients"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.*" %>
        <%@page import="fusioncharts.FusionCharts" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee items</title>

        <link rel="stylesheet" href="style/css/bootstrap.min.css">
    <script src="style/js/fusioncharts.js"></script>
    <script src="style/js/fusioncharts-jquery-plugin.js"></script>
    <script src="style/js/fusioncharts.charts.js"></script>
    <script src="style/js/fusioncharts.theme.ocean.js"></script>
        <script src="style/js/jquery-1.9.1.js"></script>
        <script src="style/js/bootstrap.min.js"></script>
        <script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
        <script>
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
    
    
    $(function () {
    $('#chart').highcharts({
        data: {
            table: 'emp'
        },
        chart: {
            type: 'column'
        },
        title: {
            text: ' '
        },
        yAxis: {
            allowDecimals: false,
            title: {
                text: 'Units'
            }
        },
        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + '</b><br/>' +
                    this.point.y + ' ' + this.point.name.toLowerCase();
            }
        }
    });
});
    

    
    
</script>
    </head>
    <body>
                       <%@ include file="navbar.jsp" %> 
<div class="container">   
        <h1 class="text-center">Items per category</h1>
  <a id="dlink"  style="display:none;"></a>
        <table id="emp" style="display:none;">
            <thead>
            <th></th>
            <th>Total</th>
            <th>Unassigned</th>
            </thead>
            <tbody>
<%
String d=request.getParameter("date");
String s=request.getParameter("type");

/*
Connection con= Database.getConnection();
Statement st=con.createStatement();
String sql="SELECT  types.type_name AS TYPE, "
        + "COUNT(*) AS TOTAL, "
        + "SUM(IF (items.item_barcode NOT IN (SELECT item_barcode from assigns), 1 ,0)) AS UNASSIGNED "
        + "FROM items "
        + "INNER JOIN types "
        + "ON items.type_id=types.type_id "
        + "GROUP BY type_name";

ResultSet rs=st.executeQuery(sql);

while (rs.next()){ 
*/
clients cl=new clients();
List<Reset> re=cl.client_get_raport_catitem();
List<Type> re1=cl.client_send_get_all_type();


for(int i=0;i<re.size();i++){
    
%>        
<tr>
    <td><%=re.get(i).getVal1() %></td>
    <td><%=re.get(i).getVal2()%></td>
    <td><%=re.get(i).getVal3()%></td>
</tr>       


<%}%>


            </tbody>
        </table> 
            
            <div class="row">
<input type="button" onclick="tableToExcel('sort', '<%=s%>', '<%=d%><%=s%>')" value="Export to Excel" class="btn btn-success col-lg-4 col-lg-offset-4" style="margin-bottom: 20px;">
      <a id="dlink"  style="display:none;"></a>
            </div>
<table id="sort" class="table table-bordered table-hover" cellspacing="0" width="100%" style="display:none;">

            <tbody>
<%

/*Connection con2= Database.getConnection();
Statement st2=con2.createStatement();
String sql2="SELECT * from types";
Connection con3= Database.getConnection();
Statement st3=con3.createStatement();

ResultSet rs2=st2.executeQuery(sql2);

while (rs2.next()){
*/
for(int m=0;m<re1.size();m++){

%>
               
 <tr > 
     <td colspan="7" style="text-align: center;" bgcolor="#DCDCDC"><%=re1.get(m).getTypeName()%></td>
</tr>
            <thead>
            <th>Name</th>
            <th>Barcode</th>
            <th>Brand</th>
            <th>Model</th>
            <th>Serial</th>
            <th colspan="2">Assigned to </th>
                
            </thead>

<%
/*
String sql3="SELECT items.item_name, items.item_barcode, items.item_brand, "
        + "items.item_model, items.item_serial, items.type_id, users.name, users.surname "
        + "from items left join assigns on items.item_barcode=assigns.item_barcode "
        + "left join users on assigns.emp_id=users.emp_ID "
        + "where items.type_id=\""+rs2.getString(1)+"\" ";

ResultSet rs3=st3.executeQuery(sql3);
while (rs3.next()){
*/
List<Reset> re2=cl.client_get_raport_catitems_1(re1.get(m).getTypeId());
for(int j=0;j<re2.size();j++){
%>

<tr>
    <td><%=re2.get(j).getVal1() %></td>
    <td><%=re2.get(j).getVal2()%></td>
    <td><%=re2.get(j).getVal3()%></td>
    <td><%=re2.get(j).getVal4()%></td>
    <td><%=re2.get(j).getVal5()%></td>
    
    <% if (re2.get(j).getVal7()!=""){ %>
    <td><%=re2.get(j).getVal7()%></td>
    <td><%=re2.get(j).getVal8()%></td>
<%}else{%>
<td colspan="2" style="text-align: center;" bgcolor="#FF0000">Nobody</td>
    <td></td>
 <%}%>
</tr>
<%}%>
<tr></tr>
<%}%>
     

            </tbody>
        </table> 




            
  

            

            

            
</div>
    <center><div id="chart" class="col-lg-8 col-lg-offset-2"></div></center>



 
</body>
</html>
