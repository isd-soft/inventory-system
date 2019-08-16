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
 

public class AccountController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static String INSERT_OR_EDIT_ACCOUNT = "/account.jsp";
    private static String LIST_ACCOUNT = "/listaccount.jsp";

 
    public AccountController() {
        super();
    }
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String forward="";
        String action = request.getParameter("action");
            clients cl=new clients();
           System.out.println("Sa apelat AccountController!!!!!GET");
        if (action.equalsIgnoreCase("delete")){
           // String accountId = request.getParameter("accountId");
            //dao.deleteAccount(accountId);
            cl.client_delete_Account(request.getParameter("accountId"));
            forward = LIST_ACCOUNT;
            request.setAttribute("accounts", cl.client_get_all_account());    
        } else if (action.equalsIgnoreCase("edit")){
            forward = INSERT_OR_EDIT_ACCOUNT;
            String accountId = request.getParameter("accountId");
            //Account account = dao.getAccountById(accountId);
            Account account = cl.client_get_Account_byID(accountId);
             request.setAttribute("account", account);
        } else if (action.equalsIgnoreCase("listAccount")){
             System.out.println("Sa apelat listAccount!!!!!!");
            forward = LIST_ACCOUNT;
           
        }else if(action.equalsIgnoreCase("regnew")){
            System.out.println("a intrat in regnewaccount!!!!!");
            Account ac=new Account();
            ac.setEmail(request.getParameter("email"));
             ac.setUname(request.getParameter("uname"));
            ac.setPass(request.getParameter("pass"));
            ac.setStatus(request.getParameter("status"));
            cl.client_add_Account(ac);
             forward = LIST_ACCOUNT;
        }
        else {
            forward = INSERT_OR_EDIT_ACCOUNT;
        }
 
        RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         System.out.println("Sa apelat AccountController!!!!!POST");
        clients cl=new clients();
        Account account = new Account();
        account.setId(request.getParameter("id"));
        account.setEmail(request.getParameter("email"));
        account.setUname(request.getParameter("uname"));
        account.setPass(request.getParameter("pass"));
        account.setStatus(request.getParameter("status"));
        
        String accountid = request.getParameter("id");
            account.setId(accountid);
            //dao.checkAccount(account);
               cl.client_check_Account(account);
        RequestDispatcher view = request.getRequestDispatcher(LIST_ACCOUNT);
        request.setAttribute("accounts", cl.client_get_all_account());
        view.forward(request, response);
    }
}