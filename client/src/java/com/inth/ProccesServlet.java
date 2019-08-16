/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.inth;

import com.company.Main;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static com.company.Main.doMain;
import static com.company.Main.strBaseFolder;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;



public class ProccesServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

   public static int copies = 0;
   public static String sType;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
       response.setContentType("text/html;charset=utf-8");       
       //Request items types and number of copies;
      sType = request.getParameter("type");
      copies = Integer.parseInt(request.getParameter("copyNr"));

      Main m=new Main();
        PrintWriter out = response.getWriter();
        try {
            Main.doMain(sType, copies);
            response.sendRedirect("generated.jsp?type="+sType+"&nr="+copies);
        } catch (SQLException ex) {
            Logger.getLogger(ProccesServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        

    }

   
 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


}
