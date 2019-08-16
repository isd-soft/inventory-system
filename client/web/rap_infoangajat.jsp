<%-- 
    Document   : listitem
    Created on : Mar 31, 2016, 9:35:28 AM
    Author     : Ed
--%>

<%@page import="com.client.Reset"%>
<%@page import="com.client.User"%>
<%@page import="java.util.List"%>
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
    
        <h1 class="text-center">Info angajat</h1>
            <div class="row">
<input type="button" onclick="tableToExcel('sort', '<%=s%>', '<%=d%><%=s%>')" value="Export to Excel" class="btn btn-success col-lg-4 col-lg-offset-4" style="margin-bottom: 20px;">
      <a id="dlink"  style="display:none;"></a>
            </div>
        <table id="sort" class="table table-bordered table-hover" cellspacing="0" width="100%">
            <thead>
                <tr >
                    
                    <th>Name</th>
                    <th>Surname</th>
                    <th>Date hired</th>
                    <th>Date fired </th>
                    <th>Phone number</th>
                </tr>
                
            </thead>
            <tbody>
<%

clients cl=new clients();
List<User> rs=cl.client_send_get_all_user();
for(int i=0;i<rs.size();i++){
%>
               
 <tr > 
     <td bgcolor="#DCDCDC"><%=rs.get(i).getName() %></td>
    <td bgcolor="#DCDCDC"><%=rs.get(i).getSurname() %></td>
    <td bgcolor="#DCDCDC"><%=rs.get(i).getHired() %></td>
    <td bgcolor="#DCDCDC"> Still working </td>
    <td bgcolor="#DCDCDC"><%=rs.get(i).getPhone() %></td>
</tr>

<tr>
    <td colspan="5" style="text-align: center;"  bgcolor="#FFFFCC">Items history</td>
</tr>
 <tr > 
    <th >Type</th>
    <th >Barcode</th>
    <th >Name</td>
    <th >Modified</th>
    <th >Status</th>
</tr>

<%

List<Reset> rs1=cl.client_get_raport_infoangajat(rs.get(i).getEmpID());
for(int j=0;j<rs1.size();j++){

%>

<tr>
    <td><%=rs1.get(j).getVal1() %></td>
    <td><%=rs1.get(j).getVal2()%></td>
    <td><%=rs1.get(j).getVal3()%></td>
    <td><%=rs1.get(j).getVal4()%></td>
    <td><%=rs1.get(j).getVal5()%></td>
 
</tr>
<%}%>
<tr></tr>
<%}%>
     


<%

List<Reset> rs2=cl.client_get_raport_fostangajat();
for(int k=0;k<rs2.size();k++){

%>
               
 <tr > 
    <td bgcolor="#DCDCDC"><%=rs2.get(k).getVal1()%></td>
    <td bgcolor="#DCDCDC"><%=rs2.get(k).getVal2()%></td>
    <td bgcolor="#DCDCDC"><%=rs2.get(k).getVal3()%></td>
    <td bgcolor="#DCDCDC"><%=rs2.get(k).getVal4()%></td>
    <td bgcolor="#DCDCDC"><%=rs2.get(k).getVal5()%></td>
</tr>

<tr>
    <td colspan="5" style="text-align: center;"  bgcolor="#FFFFCC">Items history</td>
</tr>
 <tr > 

</tr>

<%

List<Reset> rs3=cl.client_get_raport_infoangajat(rs2.get(k).getVal1());
for(int l=0;l<rs3.size();l++){
%>

<tr>
  
 
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