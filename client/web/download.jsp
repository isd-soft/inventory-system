<%-- 
    Document   : download
    Created on : Apr 20, 2016, 10:37:47 AM
    Author     : Ed
--%>

<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%    
  String filename = "output.pdf";   
  String filepath = System.getProperty("user.home")+"\\";   
  File file = new File(filepath + filename);          
  
            response.setContentType("application/pdf");
            
            response.addHeader("Content-Disposition", "attachment; filename=" + filename);
            
            response.setContentLength((int) file.length());
  
            ServletOutputStream servletOutputStream = response.getOutputStream();
            BufferedInputStream bufferedInputStream = new BufferedInputStream(new FileInputStream(file));
            int bytesRead = bufferedInputStream.read();
            
            while(bytesRead !=-1){
            
                servletOutputStream.write(bytesRead);
                bytesRead = bufferedInputStream.read();
            
            }
        
            if(servletOutputStream != null) servletOutputStream.close();
            if(bufferedInputStream != null) bufferedInputStream.close();   
%>   
