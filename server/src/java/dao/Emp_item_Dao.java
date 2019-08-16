
package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Item;
import model.Reset;
import model.Type;
import util.Database;

/**
 *
 * @author Mihai1
 */
public class Emp_item_Dao {
  
     private Connection connection;
 
    public Emp_item_Dao() {
        connection = Database.getConnection();
    }
    
   public List<Reset> get_resultset(String name,String surname)
    {
        List<Reset> result=new ArrayList<>();
         ResultSet resultset = null;
        try{
         Statement statement = connection.createStatement();
           String sql="SELECT types.type_name, items.item_name, items.item_barcode, users.emp_ID "+
                   "FROM items "+
                   "INNER JOIN types "+
                   "ON items.type_id=types.type_id "+
                   "INNER JOIN assigns "+
                   "ON assigns.item_barcode=items.item_barcode "+
                   "INNER JOIN users "+
                   "ON assigns.emp_id=users.emp_ID "+
                   "WHERE users.name='" + name + "'" + " AND users.surname='" + surname + "'";
               resultset = statement.executeQuery(sql) ;
               
               while(resultset.next())
               {
                    Reset res=new Reset();
                   res.set_val1(resultset.getString(1));
                   res.set_val2(resultset.getString(2));
                   res.set_val3(resultset.getString(3));
                   res.set_val4(resultset.getString(4));
                   result.add(res);
               }
               for(int i=0;i<result.size();i++){
               System.out.println("afisam List:"+result.get(i).get_val1()+" "+result.get(i).get_val2());
               }
               resultset.close();
              statement.close();
              connection.close();
              return result; 
        }catch(Exception e){
            System.out.println("eror in method get_resultset!!!!:"+e);
        }
        
       return null;
    }
    
    
   public List<Reset> get_resultset1(String name,String surname)
    {
          List<Reset> result=new ArrayList<>();
         ResultSet resultset = null;
         
        try{
         Statement statement = connection.createStatement();
          String sql2="SELECT types.type_name, items.item_name, items.item_barcode, users.emp_ID "+
                   "FROM items "+
                   "INNER JOIN types "+
                   "ON items.type_id=types.type_id "+
                   "INNER JOIN assigns "+
                   "ON assigns.item_barcode=items.item_barcode "+
                   "INNER JOIN users "+
                   "ON assigns.emp_id=users.emp_ID "+
                   "WHERE users.name='" + name + "'" + " AND users.surname='" + surname + "'";
               resultset = statement.executeQuery(sql2) ;
    
             while(resultset.next())
               {
                    Reset res=new Reset();
                   res.set_val1(resultset.getString(1));
                   res.set_val2(resultset.getString(2));
                   res.set_val3(resultset.getString(3));
                   res.set_val4(resultset.getString(4));
                   result.add(res);
               }
               resultset.close();
              statement.close();
              connection.close();
              return result; 
        }catch(Exception e){
            System.out.println("eror in method get_resultset!!!!:"+e);
        }
        
       return null;
               
    }
      
   public List<Reset> get_resultset2(String name,String surname)
    {
         List<Reset> result=new ArrayList<>();
         ResultSet resultset = null; 
        
      try{
         Statement statement = connection.createStatement();
         String sql3="SELECT users.emp_ID "+
                   "FROM users "+
                   "WHERE users.name='" + name + "'" + " AND users.surname='" + surname + "'";
            resultset = statement.executeQuery(sql3) ;
               while(resultset.next())
               {
                    Reset res=new Reset();
                   res.set_val1(resultset.getString(1));
                   result.add(res);
               }
               resultset.close();
              statement.close();
              connection.close();
              return result; 
        }catch(Exception e){
            System.out.println("eror in method get_resultset!!!!:"+e);
        }
        
       return null;
    } 
      
   
   public List<Reset> get_resultset3(String name,String surname)
    {
         List<Reset> result=new ArrayList<>();
         ResultSet resultset = null;
         
      try{
         Statement statement = connection.createStatement();
         String sq="SELECT users.emp_ID "+
                   "FROM users "+
                   "WHERE users.name='" + name + "'" + " AND users.surname='" + surname + "'";
              resultset = statement.executeQuery(sq) ;
              while(resultset.next())
               {
                   Reset res=new Reset();
                   res.set_val1(resultset.getString(1));
                   result.add(res);
               }
               resultset.close();
              statement.close();
              connection.close();
              return result; 
        }catch(Exception e){
            System.out.println("eror in method get_resultset!!!!:"+e);
        }
        
       return null;
    } 
   
   
   public void execute_delete_AssignCont(String barcode)
   {
       try{
      Statement del=connection.createStatement();
        String sqld="DELETE FROM oldgoods WHERE item_barcode='"+barcode+ "'";
        del.executeUpdate(sqld);
        del.close();
        connection.close();
       }
       catch(Exception e){
       System.out.println("Eroare Emp_item_Dao.java metoda execute_delete_AssignCont!!!!: "+e);
       }
   }
   
  public void execute_insert_AssignCont(String barcode,String empid)
   {
        try{
         Statement ins=connection.createStatement();
        String add="INSERT INTO ASSIGNS (item_barcode, emp_id) values ('" + barcode + "','" + empid + "') ";
        ins.executeUpdate(add);
         ins.close();
        connection.close();
         }
       catch(Exception e){
        System.out.println("Eroare Emp_item_Dao.java metoda execute_insert_AssignCont!!!!: "+e);
       }
   }
   
   public List<Reset> serch_date(String id)
   {
        List<Reset> result=new ArrayList<>();
         ResultSet resultset = null;
         
        try{
         Statement statement = connection.createStatement();
        String sql="SELECT items.item_barcode, items.item_name, types.type_name, users.name, users.surname, items.item_id " +
            "FROM items "+
            "INNER JOIN types "+
            "ON items.type_id=types.type_id "+
            "LEFT JOIN assigns "+
            "ON items.item_barcode=assigns.item_barcode "+
            "LEFT JOIN users "+
            "ON assigns.emp_id=users.emp_ID "+
            "WHERE items.item_barcode= '" + id + "' ";
               resultset = statement.executeQuery(sql) ;
    
             while(resultset.next())
               {
                     Reset res=new Reset();
                     System.out.println("date din bg testare:"+resultset.getString(4));
                   res.set_val1(resultset.getString(1));
                   res.set_val2(resultset.getString(2));
                   res.set_val3(resultset.getString(3));
                   res.set_val4(resultset.getString(4));
                   res.set_val5(resultset.getString(5));
                   res.set_val6(resultset.getString(6));
                   result.add(res);
               }
               resultset.close();
              statement.close();
              connection.close();
               return result;
        }catch(Exception e){
            System.out.println("eror in method get_resultset!!!!:"+e);
        }
       return null;
   }
   
   
   
    public List<Reset> serch_date_2(String id)
   {
        List<Reset> result=new ArrayList<>();
         ResultSet resultset = null;
         
        try{
         Statement statement = connection.createStatement();
         
          String sql2="SELECT emp_name, emp_surname, date, status "+
            "FROM history "+
            "WHERE history.item_barcode='" + id + "' "+
            "ORDER BY history.date";
      
               resultset = statement.executeQuery(sql2) ;
    
             while(resultset.next())
               {
                     Reset res=new Reset();
                   res.set_val1(resultset.getString(1));
                   res.set_val2(resultset.getString(2));
                   res.set_val3(resultset.getString(3));
                   res.set_val4(resultset.getString(4));
                   result.add(res);
               }
               resultset.close();
              statement.close();
              connection.close();
               return result;
        }catch(Exception e){
            System.out.println("eror in method serch_date_2!!!!:"+e);
        }
       return null;
   }
    
    
    public List<Type> generator_work_barcodes()
    {
         ResultSet resultset = null;
         List<Type> typ=new ArrayList<>();
        
        try{
             Statement statement = connection.createStatement();
             String sql = "select * from types";
               resultset = statement.executeQuery(sql) ; 
             while(resultset.next())
               {
                   Type mod=new Type();
                   mod.setType_name(resultset.getString("type_name"));
                    mod.setType_id(resultset.getString("type_id"));
                     mod.setType_prefix(resultset.getString("type_prefix"));
                     typ.add(mod);
               }
               resultset.close();
              statement.close();
              connection.close();
               return typ;
        }
        catch(Exception e)
        {
            System.out.println("eroare generator_work!!!!!!!!!");
        }
        return null;
    }
    
    
    public List<Item> generator_work_main(String barcode)
    {
         List<Item> ite=new ArrayList<>();
         ResultSet resultset = null;
        try{
             Statement statement = connection.createStatement();
              String sql = "select item_barcode from items where item_barcode=\"" +  barcode + "\";";
               resultset = statement.executeQuery(sql) ; 
             while(resultset.next())
               {
                   Item mod=new Item();
                   mod.setItem_barcode(resultset.getString("item_barcode"));
                     ite.add(mod);
               }
               resultset.close();
              statement.close();
              connection.close();
               return ite;
        }
        catch(Exception e)
        {
            System.out.println("eroare generator_work_12!!!!!!!!!");
        }
        return null;
    }
    
}
