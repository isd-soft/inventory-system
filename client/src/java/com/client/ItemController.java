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
 

 
public class ItemController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT_ITEM = "/item.jsp";
    private static String LIST_ITEM = "/listitem.jsp";

 
    public ItemController() {
        super();
       
    }
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward="";
        String action = request.getParameter("action");
 
        if (action.equalsIgnoreCase("delete")){          
            forward = LIST_ITEM;   
            clients cl=new clients();
            cl.client_send_delete_item(request.getParameter("itemId"));
        } else if (action.equalsIgnoreCase("edit")){
            forward = INSERT_OR_EDIT_ITEM;
        } else if (action.equalsIgnoreCase("listItem")){
            forward = LIST_ITEM;
        } else {
            forward = INSERT_OR_EDIT_ITEM;
        }
 
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        clients cl=new clients();
        cl.client_send_add_data_item(request.getParameter("item_id"),request.getParameter("item_name"),
                request.getParameter("item_barcode"),request.getParameter("item_brand"),request.getParameter("item_model"), request.getParameter("item_serial"),
                request.getParameter("type_id"));
        RequestDispatcher view = request.getRequestDispatcher(LIST_ITEM);
        view.forward(request, response);
       
    }
}