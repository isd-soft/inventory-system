<%-- 
    Document   : rap_empitems
    Created on : Apr 15, 2016, 2:21:54 PM
    Author     : Ed
--%>

<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="util.Database"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.google.gson.*" %>
        <%@page import="fusioncharts.FusionCharts" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


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

  <a id="dlink"  style="display:none;"></a>
        <table id="emp" style="display:none;">
            <thead>
            <th>Assigned</th>
            <th>Unassigned</th>
            <th>Total</th>
            </thead>
            <tbody>
<%
String d=request.getParameter("date");
String s=request.getParameter("type");
Connection con= Database.getConnection();
Statement st=con.createStatement();
String sql="SELECT "
        + "(SELECT COUNT(*) from assigns) AS Assigned, "
        + "(SELECT COUNT(*) from items) AS Total, "
        + "(SELECT count(*) from items WHERE item_barcode NOT IN (SELECT item_barcode from assigns)) as Unassigned;";

ResultSet rs=st.executeQuery(sql);
int as=0;
int unas=0;
while (rs.next()){ as=Integer.parseInt(rs.getString(1)); unas=Integer.parseInt(rs.getString(3)); 
%>        
<tr>
    <td><%=rs.getString(1)%></td>
    <td><%=rs.getString(3)%></td>


<%}%>


    <td><%= as+unas %></td>
</tr>       


            </tbody>
        </table> 
            
            
 <div class="container">
    <div class="row">
<input type="button" onclick="tableToExcel('emp', '<%=s%>', '<%=d%><%=s%>')" value="Export to Excel" class="btn btn-success col-lg-4 col-lg-offset-4" style="margin-bottom: 20px;">
    </div>
    </div>             

            
<%
 Gson gson = new Gson();
Connection con2= Database.getConnection();
Statement st2=con2.createStatement();
String sql2="SELECT "
        + "(SELECT COUNT(*) from assigns) AS Assigned, "
        + "(SELECT count(*) from items WHERE item_barcode NOT IN (SELECT item_barcode from assigns)) as Unassigned;";

ResultSet rs2=st2.executeQuery(sql2);

Map<String, String> chartobj = new HashMap<String, String>();
        

chartobj.put("exportEnabled", "1");
   chartobj.put( "caption", "Total items:"+(as+unas));
             
               chartobj.put( "paletteColors", "#0075c2,#f45b00,#8e0000");
               chartobj.put( "bgColor", "#ffffff");
               chartobj.put( "showBorder", "0");
               chartobj.put( "use3DLighting", "0");
              chartobj.put(  "showShadow", "0");
               chartobj.put( "enableSmartLabels", "0");
               chartobj.put( "startingAngle", "0");
               chartobj.put( "showPercentValues", "0");
               chartobj.put( "showPercentInTooltip", "1");
               chartobj.put( "decimals", "1");
               chartobj.put( "captionFontSize", "14");
               chartobj.put( "subcaptionFontSize", "14");
               chartobj.put( "subcaptionFontBold", "0");
               chartobj.put( "toolTipColor", "#ffffff");
               chartobj.put( "toolTipBorderThickness", "0");
               chartobj.put( "toolTipBgColor", "#000000");
               chartobj.put( "toolTipBgAlpha", "80");
               chartobj.put( "toolTipBorderRadius", "2");
               chartobj.put( "toolTipPadding", "5");
               chartobj.put( "showHoverEffect","1");
               chartobj.put( "showLegend", "1");
               chartobj.put( "legendBgColor", "#ffffff");
              chartobj.put(  "legendBorderAlpha", "0");
               chartobj.put( "legendShadow", "0");
               chartobj.put( "legendItemFontSize", "10");
               chartobj.put( "legendItemFontColor", "#666666");




ArrayList arrData = new ArrayList();
        if(rs2.next())
        {
            Map<String, String> lv = new HashMap<String, String>();
            lv.put("label", "Assigned");
            lv.put("value", rs2.getString("Assigned"));
            arrData.add(lv);
         Map<String, String> lv2 = new HashMap<String, String>();
            lv2.put("label", "Unassigned");
            lv2.put("value", rs2.getString("Unassigned"));
            arrData.add(lv2);
            
            
        }
        

        
Map<String, String> dataMap = new LinkedHashMap<String, String>();  

dataMap.put("chart", gson.toJson(chartobj));
         dataMap.put("data", gson.toJson(arrData));
         
FusionCharts column2DChart= new FusionCharts(
                    "pie2d",// chartType
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
