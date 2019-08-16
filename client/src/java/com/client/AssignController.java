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
 
//import dao.AssignDao;
//import model.Assign;
 
public class AssignController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String LIST_ASSIGN = "/emp_items.jsp";
  
 
    public AssignController() {
        super();
    }
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         System.out.println("am intrat in do Get!!!!!");
        String forward="";
        String action = request.getParameter("action");
         clients cl=new clients();
        if (action.equalsIgnoreCase("delete")){
                  
            if(request.getParameter("com").equals("keks")){
            String assignId = request.getParameter("assignId");
                        //dao.deleteAssign(assignId);     
                        cl.cliaent_delete_assign(assignId);
           forward="/search.jsp?barcode="+assignId;
            }else{
          
            String assignId = request.getParameter("assignId");
            String back=request.getParameter("com");
            String[] bb=back.split(" ");
            //dao.deleteAssign(assignId);
            cl.cliaent_delete_assign(assignId);
            
            forward = LIST_ASSIGN+"?com="+bb[0]+"+"+bb[1];
            }
            request.setAttribute("assigns", cl.client_get_all_assign());                      
            
        } else if (action.equalsIgnoreCase("edit")){
            String assignId = request.getParameter("empId");
           // Concat assign = dao.getAssignById(assignId);
           Concat assign = cl.cliaent_get_assign_id(assignId);
            request.setAttribute("assign", assign);           
            
        } else if (action.equalsIgnoreCase("listAssign")){
            forward = LIST_ASSIGN;
            request.setAttribute("assigns",cl.client_get_all_assign());  
            
        } else {
                      
        }
 
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("am intrat in do Post!!!!!");
        clients cl=new clients();
        Concat assign = new Concat();
        assign.setBarcodes(request.getParameter("item_barcode"));
        assign.setEmpsId(request.getParameter("emp_id"));

        String assignid = request.getParameter("item_barcode");
        String a = request.getParameter("empId");
        
            assign.setBarcodes(assignid);
            assign.setEmpsId(a);
            
        // dao.checkAssign(assign);
           cl.cliaent_check_assign(assign);
            
        String rr=request.getParameter("com");
        System.out.println(rr);

            String[] bb=rr.split(" ");
        String forward = LIST_ASSIGN+"?com="+bb[0]+"+"+bb[1];
        
       // request.setAttribute("assigns", dao.getAllAssigns());
       
      request.setAttribute("assigns", cl.client_get_all_assign());
        
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);

    }
}