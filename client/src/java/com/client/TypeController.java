/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.client;
 
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 

 
public class TypeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT_TYPE = "/type.jsp";
    private static String LIST_TYPE = "/listtype.jsp";
    
    public TypeController() {
        super();
       
    }
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward="";
        String action = request.getParameter("action");
 
        if (action.equalsIgnoreCase("delete")){
            forward = LIST_TYPE;
            clients cl=new clients();
            cl.client_send_delete_type(request.getParameter("typeId"));          
        } else if (action.equalsIgnoreCase("edit")){
            forward = INSERT_OR_EDIT_TYPE;
        } else if (action.equalsIgnoreCase("listType")){
            forward = LIST_TYPE;
        } else {
            forward = INSERT_OR_EDIT_TYPE;
        }
 
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
        clients cl=new clients();
        cl.client_send_add_data_type(request.getParameter("type_id"),request.getParameter("type_name"),request.getParameter("type_prefix"));      
        RequestDispatcher view = request.getRequestDispatcher(LIST_TYPE);
        view.forward(request, response);
         
    }
}