package com.server;


import dao.AccountDao;
import dao.ConcatDao;
import dao.Emp_item_Dao;
import dao.ItemDao;
import dao.RaportDao;
import dao.TypeDao;
import dao.UserDao;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;
import model.Account;
import model.Concat;
import model.Item;
import model.Reset;
import model.Type;
import model.User;

@WebService(serviceName="proces_data")
public class proces_data {
     
    @WebMethod(operationName="adduser")
    public void adduser(@WebParam(name="nume") String nume,
            @WebParam(name="surname") String surname,@WebParam(name="phone") String phone,@WebParam(name="dob") String dob){
         User user = new User();
        user.setName(nume);
        user.setPhone(phone);
        try {
            Date reg = new SimpleDateFormat("yyyy/MM/dd").parse(dob);
            user.setHired(reg);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        user.setSurname(surname); 
        UserDao dao=new UserDao();
        dao.addUser(user);
    }
    
    @WebMethod(operationName="addType")
    public void addType(@WebParam(name="id") String id,@WebParam(name="name") String name,@WebParam(name="prefix") String prefix)
    {
         Type type = new Type();
        type.setType_id(id);
        type.setType_name(name);
        String typeid = id;
        type.setType_id(typeid);
         type.setType_prefix(prefix);
        TypeDao dao=new TypeDao();
        dao.checkType(type);
    }
    
        @WebMethod(operationName="addItem")
    public void addItem(@WebParam(name="item_id") String item_id,@WebParam(name="item_name") String item_name,@WebParam(name="item_barcode") String item_barcode,@WebParam(name="item_brand") String item_brand,
           @WebParam(name="item_model") String item_model,@WebParam(name="item_serial") String item_serial,@WebParam(name="type_id") String type_id)
    {
        Item item = new Item();
        item.setItem_id(item_id);
        item.setItem_name(item_name);
        item.setItem_barcode(item_barcode);
        item.setItem_brand(item_brand);
        item.setItem_model(item_model);
        item.setItem_serial(item_serial);
        item.setType_id(type_id);

            ItemDao dao=new ItemDao();
            dao.checkItem(item);
    }
    
            @WebMethod(operationName="addItem1")
    public boolean addItem1(@WebParam(name="item_id") String item_id,@WebParam(name="item_name") String item_name,@WebParam(name="item_barcode") String item_barcode,@WebParam(name="item_brand") String item_brand,
           @WebParam(name="item_model") String item_model,@WebParam(name="item_serial") String item_serial,@WebParam(name="type_id") String type_id)
    {
        Item item = new Item();
        item.setItem_id(item_id);
        item.setItem_name(item_name);
        item.setItem_barcode(item_barcode);
        item.setItem_brand(item_brand);
        item.setItem_model(item_model);
        item.setItem_serial(item_serial);
        item.setType_id(type_id);

            ItemDao dao=new ItemDao();
           return dao.addItem(item);
    }
    
   @WebMethod(operationName="deleteUser")
    public void deleteUser(@WebParam(name="userId") String userId)
    {
        UserDao dao=new UserDao();
        dao.deleteUser(userId);
    }
    
    @WebMethod(operationName="deleteType")
    public void deleteType(@WebParam(name="typeId") String typeId)
    {
        TypeDao dao=new TypeDao();
        dao.deleteType(typeId);
    }
    
      @WebMethod(operationName="deleteItem")
    public void deleteItem(@WebParam(name="itemId") String itemId)
    {
       ItemDao dao=new ItemDao();
        dao.deleteItem(itemId);
    }
    
   @WebMethod(operationName="getAllUser")
    public List<User> getAllUser()
    {
        UserDao dao=new UserDao();
        return dao.getAllUsers();
    }
    
     public List<Type> getAllTypes()
     {
        TypeDao type_dao=new TypeDao();
        return type_dao.getAllTypes();
     }
     
  @WebMethod(operationName="getAllItems")
    public List<Item> getAllItems()
    {
        ItemDao dao=new ItemDao();
        return dao.getAllItems();
    }
    
    @WebMethod(operationName="getUserById")
    public User getUserById(@WebParam(name="user_Id") String user_Id)
    {
         UserDao dao=new UserDao();
        return dao.getUserById(user_Id);
    }
    
   @WebMethod(operationName="getTypeById")
    public Type getTypeById(@WebParam(name="type_Id") String type_Id)
    {
         TypeDao dao=new TypeDao();
        return dao.getTypeById(type_Id);
    }
    
    
   @WebMethod(operationName="getItemById")
    public Item getItemById(@WebParam(name="item_Id") String item_Id)
    {
         ItemDao dao=new ItemDao();
        return dao.getItemById(item_Id);
    }
    
     @WebMethod(operationName="updateUser")
    public void updateUser(@WebParam(name="user") User user)
    {
         UserDao dao=new UserDao();
         dao.updateUser(user);
    }
    
          
       @WebMethod(operationName="getAllNames")
    public ArrayList<String> getAllNames()
    {
        UserDao dao=new UserDao();
        return dao.getAllNames();
    }
      
    @WebMethod(operationName="emp_items1")
    public List<Reset> emp_items1(@WebParam(name="name") String name,@WebParam(name="surname") String surname)
    {
        Emp_item_Dao emp_dao=new Emp_item_Dao();
        return emp_dao.get_resultset(name,surname);
    }
    
    
      @WebMethod(operationName="emp_items2")
    public  List<Reset> emp_items2(@WebParam(name="name1") String name1,@WebParam(name="surname1") String surname1)
    {
        Emp_item_Dao emp_dao=new Emp_item_Dao();
        return emp_dao.get_resultset1(name1,surname1);
    }
    
          @WebMethod(operationName="emp_items3")
    public  List<Reset> emp_items3(@WebParam(name="name2") String name2,@WebParam(name="surname2") String surname2)
    {
        Emp_item_Dao emp_dao=new Emp_item_Dao();
        return emp_dao.get_resultset2(name2,surname2);
    }
    
   @WebMethod(operationName="emp_items4")
    public  List<Reset> emp_items4(@WebParam(name="name3") String name3,@WebParam(name="surname3") String surname3)
    {
        Emp_item_Dao emp_dao=new Emp_item_Dao();
        return emp_dao.get_resultset3(name3,surname3);
    }

    
    @WebMethod(operationName="get_all_assign")
    public List<Concat> get_all_assign()
    {
       ConcatDao dao=new ConcatDao();
        return dao.getAllAssigns();
    }
    
        
    @WebMethod(operationName="check_ussign")
    public void check_ussign(Concat assign)
    {
       ConcatDao dao=new ConcatDao();
        dao.checkAssign(assign);
    }
    
    @WebMethod(operationName="delete_unssign")
    public void delete_unssign(@WebParam(name="id") String id)
    {
    ConcatDao dao=new ConcatDao();
    dao.deleteAssign(id);
    }
    
     @WebMethod(operationName="get_unssign_id")
    public Concat get_unssign_id(@WebParam(name="id1") String id1)
    {
    ConcatDao dao=new ConcatDao();
    return dao.getConcatId(id1);
    }
    
  
    @WebMethod(operationName="get_all_account")
    public List<Account> get_all_account()
    {
        AccountDao dao=new AccountDao();
        return dao.getAllAccounts();
    }
    
    @WebMethod(operationName="delete_Account")
    public void delete_Account(@WebParam(name="accountId") String accountId)
    {
      AccountDao dao=new AccountDao();
      dao.deleteAccount(accountId);
    }
          
    @WebMethod(operationName="get_Account_byID")
    public Account get_Account_byID(@WebParam(name="accountId") String accountId)
    {
      AccountDao dao=new AccountDao();
      return dao.getAccountById(accountId);
    }
    
   
  @WebMethod(operationName="check_Account")
    public void check_Account(@WebParam(name="ac") Account ac)
    {
      AccountDao dao=new AccountDao();
      dao.checkAccount(ac);
    }
    
   @WebMethod(operationName="add_Account")
    public void add_Account(@WebParam(name="ac") Account ac)
    {
      AccountDao dao=new AccountDao();
      dao.addAccount(ac);
    }
    
     @WebMethod(operationName="login_confirm")
    public Account login_confirm(@WebParam(name="name") String name,@WebParam(name="pass") String pass)
    {
      AccountDao dao=new AccountDao();
      return dao.login_confirm(name, pass);
    }
    
    
    @WebMethod(operationName="get_list_unassigneds")
    public List<Item> get_list_unassigneds()
    {
      ItemDao dao=new ItemDao();
      return dao.get_listunassigneds();
    }
       
    
   @WebMethod(operationName="execute_delete_AssignCont1")
    public void execute_delete_AssignCont1(@WebParam(name="barcode") String barcode)
    {
       Emp_item_Dao dao=new Emp_item_Dao();
       dao.execute_delete_AssignCont(barcode);
    }
    
    
  @WebMethod(operationName="execute_insert_AssignCont1")
    public void execute_insert_AssignCont1(@WebParam(name="barcode") String barcode,@WebParam(name="id") String id)
    {
      Emp_item_Dao dao=new Emp_item_Dao();
       dao.execute_insert_AssignCont(barcode, id);
    }
    
   @WebMethod(operationName="serch_date_get_1")
    public List<Reset> serch_date_get_1(@WebParam(name="id") String id)
    {
      Emp_item_Dao dao=new Emp_item_Dao();
       return dao.serch_date(id);
    }
    
    
    @WebMethod(operationName="serch_date_get_2")
    public List<Reset>  serch_date_get_2(@WebParam(name="id") String id)
    {
      Emp_item_Dao dao=new Emp_item_Dao();
       return dao.serch_date_2(id);
    }
    
     @WebMethod(operationName="generator_work_barcode")
    public List<Type>  generator_work_barcodes()
    {
      Emp_item_Dao dao=new Emp_item_Dao();
       return dao.generator_work_barcodes();
    }
    
        @WebMethod(operationName="generator_work_mains")
    public List<Item> generator_work_mains(@WebParam(name="id") String barcode)
    {
      Emp_item_Dao dao=new Emp_item_Dao();
       return dao.generator_work_main(barcode);
    }
    
        
  @WebMethod(operationName="get_raport_catitem")
    public List<Reset>  get_raport_catitem()
    {
      RaportDao dao=new RaportDao();
       return dao.get_raport_catitems();
    }
   
    
    @WebMethod(operationName="get_raport_catitems_1")
    public List<Reset> get_raport_catitems_1(@WebParam(name="mm") String mm)
    {
      RaportDao dao=new RaportDao();
       return dao.get_raport_catitems_1(mm);
    }
    
    
    @WebMethod(operationName="get_raport_empitems")
    public List<Reset> get_raport_empitems()
    {
      RaportDao dao=new RaportDao();
       return dao.get_raport_empitems();
    }
    
       @WebMethod(operationName="get_raport_empitems_1")
    public List<Reset> get_raport_empitems_1(@WebParam(name="mm") String mm)
    {
      RaportDao dao=new RaportDao();
       return dao.get_raport_empitems_1(mm);
    }
    
      @WebMethod(operationName="get_raport_empitems_2")
    public List<Reset> get_raport_empitems_2()
    {
      RaportDao dao=new RaportDao();
       return dao.get_raport_empitems_2();
    }
    
    
   @WebMethod(operationName="get_raport_fostangajat")
    public List<Reset> get_raport_fostangajat()
    {
      RaportDao dao=new RaportDao();
       return dao.get_raport_fostangajat();
    }
    
       @WebMethod(operationName="get_raport_infoangajat")
    public List<Reset>  get_raport_infoangajat(@WebParam(name="rs") String rs)
    {
      RaportDao dao=new RaportDao();
       return dao.get_raport_infoangajat(rs);
    }
     
    
    @WebMethod(operationName="get_raport_infitem")
     public List<Reset> get_raport_infitem()
     {
         RaportDao dao=new RaportDao();
       return dao.get_raport_infitem();
     }
     
       @WebMethod(operationName="get_raport_infitem_1")
     public List<Reset> get_raport_infitem_1(@WebParam(name="rs") String rs)
     {
         RaportDao dao=new RaportDao();
       return dao.get_raport_infitem_1(rs);
     }
     
       @WebMethod(operationName="get_raport_infitem_2")
     public List<Reset> get_raport_infitem_2()
     {
         RaportDao dao=new RaportDao();
       return dao.get_raport_infitem_2();
     }
  
     @WebMethod(operationName="get_raport_intemes")
     public List<Reset> get_raport_intemes()
     {
       RaportDao dao=new RaportDao();
       return dao.get_raport_intemes();
     }
     

}
