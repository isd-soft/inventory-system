<%-- 
    Document   : rap_empitems
    Created on : Apr 15, 2016, 2:21:54 PM
    Author     : Ed
--%>


<%@page import="com.client.Reset"%>
<%@page import="java.util.List"%>
<%@page import="com.client.clients"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
    <script src="style/js/fusioncharts.charts.js"></script>
    <script src="style/js/fusioncharts.theme.ocean.js"></script>
        <script src="style/js/jquery-1.9.1.js"></script>
        <script src="style/js/bootstrap.min.js"></script>
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
</script>
    </head>
    <body>

<%@ include file="navbar.jsp" %> 
<div class="container">   
        <h1 class="text-center">Items per employee</h1>
  <a id="dlink"  style="display:none;"></a>
        <table id="emp" style="display:none;">


                
<%
String d=request.getParameter("date");
String s=request.getParameter("type");

clients cl=new clients();
List<Reset> rs=cl.client_get_raport_empitems();

List<Reset> rs2=cl.client_get_raport_empitems_2();

for(int i=0;i<rs.size();i++){

%>        
<tr><td colspan="6" style="text-align: center;" bgcolor="#DCDCDC"><b><%=rs.get(i).getVal1() %> <%=rs.get(i).getVal2()%></b></td></tr>
<%
List<Reset> rs1=cl.client_get_raport_empitems_1(rs.get(i).getVal4());
for(int j=0;j<rs1.size();j++){
%>
<tr>
    <td><i><%=rs1.get(j).getVal1()%></i></td>
    <td><%=rs1.get(j).getVal2()%></td>
    <td><%=rs1.get(j).getVal3()%></td>
    <td><%=rs1.get(j).getVal4()%></td>
    <td><%=rs1.get(j).getVal5()%></td>
    <td><%=rs1.get(j).getVal6()%></td>
</tr>

<%}%>

<tr></tr>

<%}%>

</c:forEach> 
        </table> 
            
            
 <div class="container">
    <div class="row">
<input type="button" onclick="tableToExcel('emp', '<%=s%>', '<%=d%><%=s%>')" value="Export to Excel" class="btn btn-success col-lg-4 col-lg-offset-4">
    </div>
    </div>             

            
<%
 Gson gson = new Gson();

Map<String, String> chartobj = new HashMap<String, String>();
        





  
        chartobj.put("exportEnabled", "1");
 
        chartobj.put("yaxisname", "Number of items");
       chartobj.put( "xaxisname", "Employee");
        chartobj.put("bgcolor", "FFFFFF");
        chartobj.put("showalternatevgridcolor", "0");
       chartobj.put( "showplotborder", "0");
       chartobj.put( "showvalues", "0");
       chartobj.put( "divlinecolor", "CCCCCC");
       chartobj.put( "showcanvasborder", "0");
       chartobj.put( "plotgradientcolor", "");
       chartobj.put( "tooltipbordercolor", "FFFFFF");
       chartobj.put( "palettecolors", "008ee4");
       chartobj.put( "canvasborderalpha", "0");
      chartobj.put(  "showborder", "0");



ArrayList arrData = new ArrayList();
       for(int k=0;k<rs2.size();k++)
        {
            Map<String, String> lv = new HashMap<String, String>();
            lv.put("label", rs2.get(k).getVal1()+" "+rs2.get(k).getVal2());
            lv.put("value", rs2.get(k).getVal3());
            arrData.add(lv);             
        }
        

        
Map<String, String> dataMap = new LinkedHashMap<String, String>();  

dataMap.put("chart", gson.toJson(chartobj));
         dataMap.put("data", gson.toJson(arrData));
         
FusionCharts column2DChart= new FusionCharts(
                    "bar2d",// chartType
                    "chart1",// chartId
                    "800","600",// chartWidth, chartHeight
                    "chart",// chartContainer
                    "json",// dataFormat
                    gson.toJson(dataMap) //dataSource
);

%>
            
</div>
    <center><div id="chart"></div></center>

<%= column2DChart.render() %>

 
</body>
</html>
