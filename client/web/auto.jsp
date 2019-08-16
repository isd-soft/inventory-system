

<%@page import="com.client.clients"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%
    
  clients getnames=new clients();
    ArrayList<String> as=getnames.client_get_all_names();
    System.out.println(as);
        String s=request.getParameter("com");
        
            for(String st:as)
            {
                if(st.toLowerCase().startsWith(s.toLowerCase()))
                {
                    out.println(st);
                }
            }
%>