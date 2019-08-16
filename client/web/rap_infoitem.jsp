<%-- 
    Document   : listitem
    Created on : Mar 31, 2016, 9:35:28 AM
    Author     : Ed
--%>

<%@page import="java.util.List"%>
<%@page import="com.client.Reset"%>
<%@page import="com.client.clients"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
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
 

    <script src="style/js/jquery-1.12.3.js"></script>

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
    <title>ISD Inventory</title>
</head>
<%
String d=request.getParameter("date");
String s=request.getParameter("type");

%>

<body>
               <%@ include file="navbar.jsp" %> 
<div class="container">   
    
        <h1 class="text-center">Info itemi</h1>
            <div class="row">
<input type="button" onclick="tableToExcel('sort', '<%=s%>', '<%=d%><%=s%>')" value="Export to Excel" class="btn btn-success col-lg-4 col-lg-offset-4" style="margin-bottom: 20px;">
      <a id="dlink"  style="display:none;"></a>
            </div>
        <table id="sort" class="table table-bordered table-hover" cellspacing="0" width="100%">
            <thead>
                <tr >
                    
                    <th>Tip</th>
                    <th>Denumire</th>
                    <th>Barcode</th>
                    <th colspan="2">Assigned to </th>

                </tr>
                
            </thead>
            <tbody>
<%
/*
Connection con= Database.getConnection();
Statement st=con.createStatement();
String sql="SELECT types.type_name, items.item_name, items.item_barcode, users.name, users.surname, items.item_id from "
        + "assigns join items on assigns.item_barcode=items.item_barcode "
        + "join types on items.type_id=types.type_id "
        + "join users on assigns.emp_id=users.emp_ID";

Connection conn= Database.getConnection();
Statement stt=conn.createStatement();

ResultSet rs=st.executeQuery(sql);

while (rs.next()){
*/
clients cl=new clients();
List<Reset> rs=cl.get_raport_infitem();

for(int i=0;i<rs.size();i++){
%>
               
 <tr > 
     <td bgcolor="#DCDCDC"><%=rs.get(i).getVal1() %></td>
    <td bgcolor="#DCDCDC"><%=rs.get(i).getVal2()%></td>
    <td bgcolor="#DCDCDC"><%=rs.get(i).getVal3()%></td>
    <td bgcolor="#DCDCDC"><%=rs.get(i).getVal4()%></td>
    <td bgcolor="#DCDCDC"><%=rs.get(i).getVal5()%></td>

</tr>

<tr>
    <td colspan="5" style="text-align: center;"  bgcolor="#FFFFCC">Item history</td>
</tr>
 <tr > 
    <th >Employee</th>
    <th >Date</th>
    <th colspan="3">Status</td>

</tr>

<%
/*
String sqll="SELECT * from history "

        + "where item_barcode=\""+rs.getString(3)+"\" "
        + "ORDER BY date";
ResultSet rss=stt.executeQuery(sqll);
while (rss.next()){
*/
List<Reset> rs1=cl.get_raport_infitem_1(rs.get(i).getVal3());
for(int j=0;j<rs1.size();j++){
%>

<tr>
    <td><%=rs1.get(j).getVal1()%> <%=rs1.get(j).getVal2()%></td>
    <td><%=rs1.get(j).getVal3()%></td>

    <td colspan="3"><%=rs1.get(j).getVal4()%></td>

 
</tr>
<%}%>
<tr></tr>
<%}%>
     
<%
/*
Connection con3= Database.getConnection();
Statement st3=con3.createStatement();
String sql3="SELECT types.type_name, items.item_name, items.item_barcode, items.item_id from "
        + "items "
        + "join types on items.type_id=types.type_id "
        + "WHERE items.item_barcode NOT IN (SELECT item_barcode from assigns)";

Connection con4= Database.getConnection();
Statement st4=con4.createStatement();

ResultSet rs3=st3.executeQuery(sql3);

while (rs3.next()){ 
*/
List<Reset> rs2=cl.get_raport_infitem_2();
for(int k=0;k<rs2.size();k++){
%>
               
 <tr > 
    <td bgcolor="#DCDCDC"><%=rs2.get(k).getVal1()%></td>
    <td bgcolor="#DCDCDC"><%=rs2.get(k).getVal2()%></td>
    <td bgcolor="#DCDCDC"><%=rs2.get(k).getVal3()%></td>
    <td bgcolor="#DCDCDC" colspan="2" style="text-align: center">Nobody</td>


</tr>

<tr>
    <td colspan="5" style="text-align: center;"  bgcolor="#FFFFCC">Item history</td>
</tr>
 <tr > 
    <th >Employee</th>
    <th >Date</th>
    <th colspan="3">Status</td>

</tr>

<%
/*
String sql4="SELECT * from history "

        + "where item_barcode=\""+rs3.getString(3)+"\" "
        + "ORDER BY date";
ResultSet rs4=st4.executeQuery(sql4);
while (rs4.next()){
*/
List<Reset> rs3=cl.get_raport_infitem_1(rs2.get(k).getVal3());
for(int m=0;m<rs3.size();m++){
%>

<tr>
    <td><%=rs3.get(m).getVal1()%> <%=rs3.get(m).getVal2()%></td>
    <td> <%=rs3.get(m).getVal3()%> </td>

    <td colspan="3"><%=rs3.get(m).getVal4()%></td>

 
</tr>
<%}%>
<tr></tr>
<%}%>
     

           
            
            </tbody>
        </table>

        

      
      
      
      
      
  </div>
                    



    
</div>    
</body>
</html>