package com.client;

import java.util.ArrayList;
import java.util.List;

public class clients{
     
     
    public void client_send_add_data(String num,String pren,String phone,String date)
    {
        ProcesData_Service service=new ProcesData_Service();
        ProcesData port=service.getProcesDataPort();
        port.adduser(num,pren,phone,date);
        
    }
    
   public void client_send_add_data_type(String id,String num,String prefix)
    {
        ProcesData_Service service=new ProcesData_Service();
        ProcesData port=service.getProcesDataPort();
        port.addType(id, num,prefix);
        
    }
   
    public void client_send_add_data_item(String item_id,String item_name,String item_barcode,String item_brand,
          String item_model,String item_serial,String type_id)
    {
        ProcesData_Service service=new ProcesData_Service();
        ProcesData port=service.getProcesDataPort();
        port.addItem(item_id, item_name, item_barcode, item_brand, item_model, item_serial, type_id);
        
    }
    
   public List<User> client_send_get_all_user()
    {
        ProcesData_Service service=new ProcesData_Service();
        ProcesData port=service.getProcesDataPort();
        return port.getAllUser();
    }
     
   public List<Type> client_send_get_all_type()
    {
        ProcesData_Service service=new ProcesData_Service();
        ProcesData port=service.getProcesDataPort();
        return port.getAllTypes();
    }
     
   public List<Item> client_send_get_all_item()
    {
        ProcesData_Service service=new ProcesData_Service();
        ProcesData port=service.getProcesDataPort();
        return port.getAllItems();
    } 
      
   public void client_send_update_data(User user)
    {
        ProcesData_Service service=new ProcesData_Service();
        ProcesData port=service.getProcesDataPort();
        port.updateUser(user);
    }
   
     
     public void client_send_delete_data(String user_id)
        {
            ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
            port.deleteUser(user_id);
        }
     
     public void client_send_delete_type(String type_id)
     {
           ProcesData_Service service=new ProcesData_Service();
           ProcesData port=service.getProcesDataPort();
           port.deleteType(type_id);
     }
     
      public void client_send_delete_item(String item_id)
     {
           ProcesData_Service service=new ProcesData_Service();
           ProcesData port=service.getProcesDataPort();
           port.deleteItem(item_id);
     }
      
        
      public User client_send_get_user_id(String user_id)
        {
            ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
            User user=port.getUserById(user_id);
            return user;
        }
      
        public Type client_send_get_type_id(String type_id)
        {
            ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
            Type type=port.getTypeById(type_id);
            return type;
        }
        
           public Item client_send_get_item_id(String item_id)
        {
            ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
           Item item=port.getItemById(item_id);
            return item;
        }
           
        public ArrayList<String> client_get_all_names()
        {
            ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
            return (ArrayList<String>)port.getAllNames();
        }
        
       public List<Reset> client_get_ResultSet(String fn,String ln)
       {
          ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
            return port.empItems1(fn,ln);
       }
       
         public List<Reset> client_get_ResultSet1(String fn,String ln)
       {
          ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
            return port.empItems2(fn, ln);
       }
         
         
      public List<Reset> client_get_ResultSet2(String fn,String ln)
       {
          ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
            return port.empItems3(fn,ln);
       }
         
      public List<Reset> client_get_ResultSet3(String fn,String ln)
       {
          ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
            return port.empItems4(fn, ln);
       }
      
      public List<Concat> client_get_all_assign()
      {
          ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
            return port.getAllAssign();
      }
      
      public void cliaent_check_assign(Concat conncat)
      {
         ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
            port.checkUssign(conncat);
      }
      
     public void cliaent_delete_assign(String id)
      {
         ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
            port.deleteUnssign(id);
      }
     
     public Concat cliaent_get_assign_id(String id)
      {
         ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
            return port.getUnssignId(id);
      }
     
     public List<Account> client_get_all_account()
     {
        ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
         return port.getAllAccount();
     }
     
      public void client_delete_Account(String accountId)
     {
        ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
            port.deleteAccount(accountId);
     }
     
    public Account client_get_Account_byID(String accountId)
    {
      ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
      return port.getAccountByID(accountId);
    }
      
    
  public void client_check_Account(Account ac)
    {
         ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
             port.checkAccount(ac);
    }
  
    public void client_add_Account(Account ac)
    {
         ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
             port.addAccount(ac);
    }
     
   public Account client_login_confirm(String name,String pass)
    {
         ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
             return port.loginConfirm(name, pass);
    }
   
  public List<Item> client_get_litunassigned()
    {
         ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
             return port.getListUnassigneds();
    }
  
   public void client_execute_delete_AssignCont(String barcode)
    {
         ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
            port.executeDeleteAssignCont1(barcode);
             
    }
   
  public void client_execute_insert_AssignCont(String barcode,String id)
    {
         ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
             port.executeInsertAssignCont1(barcode, id);
    }
  
   public List<Reset> client_serch_date1(String id)
    {
         ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
             return port.serchDateGet1(id);
    }
   
   
   public List<Reset> client_serch_date2(String id)
    {
         ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
             return port.serchDateGet2(id);
    }
   
      
   
   public List<Type> client_generator_work_barcodes()
    {
         ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
             return port.generatorWorkBarcode();
    }
   
      
   public List<Item>  client_generator_work_mains(String barcode)
    {
         ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
             return port.generatorWorkMains(barcode);
    }
   
   
         
   public List<Reset>  client_get_raport_catitem()
    {
         ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
             return port.getRaportCatitem();
    }
   
         
   public List<Reset> client_get_raport_catitems_1(String mm)
    {
         ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
             return port.getRaportCatitems1(mm);
    }
   
   
     public List<Reset> client_get_raport_empitems()
    {
         ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
             return port.getRaportEmpitems();
    }
     
    public List<Reset> client_get_raport_empitems_1(String mm)
    {
         ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
             return port.getRaportEmpitems1(mm);
    }
    
    public List<Reset> client_get_raport_empitems_2()
    {
         ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
             return port.getRaportEmpitems2();
    }
    
    
  public List<Reset> client_get_raport_fostangajat()
    {
         ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
             return port.getRaportFostangajat();
    }
  
  
  public List<Reset> client_get_raport_infoangajat(String rs)
    {
         ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
             return port.getRaportInfoangajat(rs);
    }
  
    
  public List<Reset> get_raport_infitem()
    {
         ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
             return port.getRaportInfitem();
    }
  
   public List<Reset> get_raport_infitem_1(String rs)
    {
         ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
             return port.getRaportInfitem1(rs);
    }
    
    public List<Reset> get_raport_infitem_2()
    {
         ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
             return port.getRaportInfitem2();
    }  
   
    
        public List<Reset> get_raport_intemes()
    {
         ProcesData_Service service=new ProcesData_Service();
            ProcesData port=service.getProcesDataPort();
             return port.getRaportIntemes();
    }  

}
