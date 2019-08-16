/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.client;
 
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
 
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 

 
public class UserController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT = "/user.jsp";
    private static String LIST_USER = "/listuser.jsp";
     private static String EDIT_USER = "/user_edit.jsp";
 
 
    public UserController() {
        super();
    }
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      String forward="";  
      String action=request.getParameter("action");
      
        if (action.equalsIgnoreCase("delete")){
            forward = LIST_USER;
            String userId = request.getParameter("userId");
              clients delete_us=new clients();
              delete_us.client_send_delete_data(userId);
              
        } else if (action.equalsIgnoreCase("edit")){
            
            forward = EDIT_USER;
            String userId = request.getParameter("userId");
             clients get_user=new clients();
            User user = get_user.client_send_get_user_id(userId);
             request.setAttribute("user", user);
             
        } else if (action.equalsIgnoreCase("listUser")){
           forward = LIST_USER;   
           System.out.println("A intrat in listuser!!!!!!!!!!");
        } 
    else {
            forward = INSERT_OR_EDIT;
        }
        
      RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
        
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    { 
      String action=request.getParameter("action");  
      if(action.equalsIgnoreCase("update"))
      {
            String userId = request.getParameter("emp_ID");
            User user=new User();
            user.setEmpID(userId);
            user.setName(request.getParameter("nume"));
            user.setSurname(request.getParameter("surname"));
            user.setPhone(request.getParameter("phone")); 
            user.setDate(request.getParameter("dob"));
            System.out.println("data din user_edit!!!!:"+request.getParameter("dob"));
      
             clients set_update=new clients();
            set_update.client_send_update_data(user);
          
          System.out.println("o intrat in update!!!!!!!!!!!!!!!!!");
          
      }
      else if(action.equalsIgnoreCase("update_12")){
       clients add=new clients();
       add.client_send_add_data(request.getParameter("nume"), 
       request.getParameter("surname"), request.getParameter("phone"),request.getParameter("dob"));
      }
      
       RequestDispatcher view = request.getRequestDispatcher(LIST_USER);
        view.forward(request, response);
    }
    
    
}