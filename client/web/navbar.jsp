<%--NAVIGATION BAR START --%> 


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
       response.sendRedirect("index.jsp"); 
} else {

String status=session.getAttribute("userstatus").toString();
String bprop="";
if (status.equals("admin")){
bprop="";
} else {
bprop="hidden";
}
String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
%>

  <div class="navbar navbar-default" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="success.jsp">ISD Inventory</a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">

            <li class="dropdown <%=bprop%>">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Employees<span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="listuser.jsp">Manage employees</a></li>
                <li><a href="emp_items.jsp">Assign an item</a></li>
                <li><a href="r_accounts.jsp" class="<%=bprop%>">Manage accounts</a></li>
              </ul>
            </li>
              
            <li class="dropdown <%=bprop%>">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Items<span class="caret"></span></a>
              <ul class="dropdown-menu">
                <li><a href="r_item.jsp">Manage items</a></li>
                <li><a href="r_type.jsp">Manage types</a></li>
                <li><a href="listunassigned.jsp">Unassigned items</a></li>
                <li role="separator" class="divider"></li>
                 <li><a href="barcode.jsp">Generate barcodes</a></li>
              </ul>
            </li>

            <li class="dropdown <%=bprop%>">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Reports<span class="caret"></span></a>
                <ul class="dropdown-menu">
                <li><a href="rap_catitems.jsp?date=<%=date%>&type=CategoryItems">Items per categories</a></li>
                <li><a href="rap_empitems.jsp?date=<%=date%>&type=EmployeeItems">Items per employee</a></li>
                <li><a href="rap_items.jsp?date=<%=date%>&type=Items">All Items list</a></li>
                
                <li role="separator" class="divider"></li>
                <li><a href="rap_angajat.jsp?date=<%=date%>&type=AngajatCurent">Angajatii curenti</a></li>
                <li><a href="rap_fostangajat.jsp?date=<%=date%>&type=FostAngajat">Fosti angajati </a></li>
              
                <li role="separator" class="divider"></li>
                <li><a href="rap_infoangajat.jsp?date=<%=date%>&type=InfoAngajat">Info angajat</a></li>
                <li><a href="rap_infoitem.jsp?date=<%=date%>&type=InfoItem">Info item </a></li>
              </ul>
            </li>
              
          

            
          </ul>
            
            <form class="navbar-form navbar-left" method="POST" ACTION="search.jsp">
        <div class="form-group">
          <input type="text" class="form-control" name="barcode" placeholder="Item barcode">
        </div>
        <button type="submit" class="btn btn-default">Search</button>
      </form>
            <ul class="nav navbar-nav navbar-right">
        <p class="navbar-text  "><b>Welcome <%=session.getAttribute("userid")%></b></p>
              <li ><a href="logout.jsp">Log out</a></li>
                </ul>
        </div>
      </div>
    </div>
    

<%
    }
%>

<%--NAVIGATION BAR END --%>   
        