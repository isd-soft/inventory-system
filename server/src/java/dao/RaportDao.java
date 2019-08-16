/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Reset;
import util.Database;

/**
 *
 * @author Mihai1
 */
public class RaportDao {
        private Connection connection;
 
    public RaportDao(){
        connection = Database.getConnection();
    }
    
    
     public List<Reset> get_raport_catitems()
      {
            List<Reset> result=new ArrayList<>();
             ResultSet resultset = null;
            try{
             Statement statement = connection.createStatement();
            String sql="SELECT  types.type_name AS TYPE, "
            + "COUNT(*) AS TOTAL, "
            + "SUM(IF (items.item_barcode NOT IN (SELECT item_barcode from assigns), 1 ,0)) AS UNASSIGNED "
            + "FROM items "
            + "INNER JOIN types "
            + "ON items.type_id=types.type_id "
            + "GROUP BY type_name";
                   resultset = statement.executeQuery(sql) ;

                   while(resultset.next())
                   {
                        Reset res=new Reset();
                      res.set_val1(resultset.getString("TYPE"));
                      res.set_val2(resultset.getString("TOTAL"));
                      res.set_val3(resultset.getString("UNASSIGNED"));
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
     
  
     public List<Reset> get_raport_catitems_1(String rs2)
      {
            List<Reset> result=new ArrayList<>();
             ResultSet resultset = null;
            try{
             Statement statement = connection.createStatement();
          String sql="SELECT items.item_name, items.item_barcode, items.item_brand, "
        + "items.item_model, items.item_serial, items.type_id, users.name, users.surname "
        + "from items left join assigns on items.item_barcode=assigns.item_barcode "
        + "left join users on assigns.emp_id=users.emp_ID "
        + "where items.type_id=\""+rs2+"\" ";
          
                   resultset = statement.executeQuery(sql) ;

                   while(resultset.next())
                   {
                        Reset res=new Reset();
                      res.set_val1(resultset.getString(1));
                      res.set_val2(resultset.getString(2));
                      res.set_val3(resultset.getString(3));
                      res.set_val4(resultset.getString(4));
                      res.set_val5(resultset.getString(5));
                      res.set_val6(resultset.getString(6));
                      res.set_val7(resultset.getString(7));
                      res.set_val8(resultset.getString(8));
                     result.add(res);
                   }
                   resultset.close();
                  statement.close();
                  connection.close();
                  return result; 
            }catch(Exception e){
                System.out.println("eror in method get_raport_catitems_1!!!!:"+e);
            }

           return null;
     }
     
  
     public List<Reset> get_raport_empitems()
      {
            List<Reset> result=new ArrayList<>();
             ResultSet resultset = null;
            try{
             Statement statement = connection.createStatement();
      String sql="SELECT users.name, users.surname, assigns.item_barcode, assigns.emp_id from "
              + "assigns join users on assigns.emp_id=users.emp_ID group by assigns.emp_id";
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
                   resultset.close();
                  statement.close();
                  connection.close();
                  return result; 
            }catch(Exception e){
                System.out.println("eror in method get_raport_empitems!!!!:"+e);
            }
           return null;
     } 
     
     
     
    public List<Reset> get_raport_empitems_1(String ress)
      {
            List<Reset> result=new ArrayList<>();
             ResultSet resultset = null;
            try{
             Statement statement = connection.createStatement();
  String sql="SELECT types.type_name, items.item_name, "
        + "items.item_barcode, items.item_brand, items.item_model, items.item_serial from assigns "
        + "join items on assigns.item_barcode=items.item_barcode "
        + "join types on items.type_id=types.type_id where emp_id=\""+ress+"\"";
                   resultset = statement.executeQuery(sql) ;

                   while(resultset.next())
                   {
                        Reset res=new Reset();
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
                System.out.println("eror in method get_raport_empitems_1!!!!:"+e);
            }
           return null;
     }
     
      public List<Reset> get_raport_empitems_2()
      {
            List<Reset> result=new ArrayList<>();
             ResultSet resultset = null;
            try{
             Statement statement = connection.createStatement();
String sql="SELECT users.name,users.surname, count(assigns.item_barcode) FROM assigns "
        + "INNER JOIN users "
        + "ON assigns.emp_id=users.emp_ID "
        + "GROUP BY assigns.emp_id "
        + "ORDER BY users.name";
                   resultset = statement.executeQuery(sql) ;

                   while(resultset.next())
                   {
                        Reset res=new Reset();
                      res.set_val1(resultset.getString(1));
                      res.set_val2(resultset.getString(2));
                      res.set_val3(resultset.getString(3));
                     result.add(res);
                   }
                   resultset.close();
                  statement.close();
                  connection.close();
                  return result; 
            }catch(Exception e){
                System.out.println("eror in method get_raport_empitems_2!!!!:"+e);
            }
           return null;
     }
      
 
      
      
    public List<Reset> get_raport_fostangajat()
      {
            List<Reset> result=new ArrayList<>();
             ResultSet resultset = null;
            try{
             Statement statement = connection.createStatement();
                String sql="SELECT * from oldemployees";
                   resultset = statement.executeQuery(sql) ;

                   while(resultset.next())
                   {
                        Reset res=new Reset();
                      res.set_val1(resultset.getString(2));
                      res.set_val2(resultset.getString(3));
                      res.set_val3(resultset.getString(4));
                      res.set_val4(resultset.getString(5));
                      res.set_val5(resultset.getString(6));
                     result.add(res);
                   }
                   resultset.close();
                  statement.close();
                  connection.close();
                  return result; 
            }catch(Exception e){
                System.out.println("eror in method get_raport_fostangajat!!!!:"+e);
            }
           return null;
     } 
     
    
        public List<Reset> get_raport_infoangajat(String rs)
      {
            List<Reset> result=new ArrayList<>();
             ResultSet resultset = null;
            try{
             Statement statement = connection.createStatement();
             String sql="SELECT types.type_name, items.item_barcode, items.item_name, history.date, history.status from history "
        + "join items on history.item_barcode=items.item_barcode "
        + "join types on items.type_id=types.type_id where emp_id=\""+rs+"\" "
        + "ORDER BY date";
                   resultset = statement.executeQuery(sql) ;

                   while(resultset.next())
                   {
                        Reset res=new Reset();
                      res.set_val1(resultset.getString(1));
                      res.set_val2(resultset.getString(2));
                      res.set_val3(resultset.getString(3));
                      res.set_val4(resultset.getString(4));
                      res.set_val5(resultset.getString(5));
                     result.add(res);
                   }
                   resultset.close();
                  statement.close();
                  connection.close();
                  return result; 
            }catch(Exception e){
                System.out.println("eror in method get_raport_infoangajat!!!!:"+e);
            }
           return null;
     } 
    
     
    public List<Reset> get_raport_infitem()
      {
            List<Reset> result=new ArrayList<>();
             ResultSet resultset = null;
            try{
             Statement statement = connection.createStatement();
     String sql="SELECT types.type_name, items.item_name, items.item_barcode, users.name, users.surname, items.item_id from "
        + "assigns join items on assigns.item_barcode=items.item_barcode "
        + "join types on items.type_id=types.type_id "
        + "join users on assigns.emp_id=users.emp_ID";
                   resultset = statement.executeQuery(sql) ;

                   while(resultset.next())
                   {
                        Reset res=new Reset();
                      res.set_val1(resultset.getString(1));
                      res.set_val2(resultset.getString(2));
                      res.set_val3(resultset.getString(3));
                      res.set_val4(resultset.getString(4));
                      res.set_val5(resultset.getString(5));
                     result.add(res);
                   }
                   resultset.close();
                  statement.close();
                  connection.close();
                  return result; 
            }catch(Exception e){
                System.out.println("eror in method get_raport_infitem!!!!:"+e);
            }
           return null;
     }    
        
      public List<Reset> get_raport_infitem_1(String rs)
      {
            List<Reset> result=new ArrayList<>();
             ResultSet resultset = null;
            try{
             Statement statement = connection.createStatement();
String sql="SELECT * from history "
        + "where item_barcode=\""+rs+"\" "
        + "ORDER BY date";
                   resultset = statement.executeQuery(sql) ;

                   while(resultset.next())
                   {
                        Reset res=new Reset();
                      res.set_val1(resultset.getString(5));
                      res.set_val2(resultset.getString(6));
                      res.set_val3(resultset.getString(7));
                      res.set_val4(resultset.getString(8));
                     result.add(res);
                   }
                   resultset.close();
                  statement.close();
                  connection.close();
                  return result; 
            }catch(Exception e){
                System.out.println("eror in method get_raport_infitem!!!!:"+e);
            }
           return null;
     }     
      
   
   public List<Reset> get_raport_infitem_2()
      {
            List<Reset> result=new ArrayList<>();
             ResultSet resultset = null;
            try{
             Statement statement = connection.createStatement();
        String sql="SELECT types.type_name, items.item_name, items.item_barcode, items.item_id from "
                + "items "
                + "join types on items.type_id=types.type_id "
                + "WHERE items.item_barcode NOT IN (SELECT item_barcode from assigns)";
                   resultset = statement.executeQuery(sql) ;

                   while(resultset.next())
                   {
                        Reset res=new Reset();
                      res.set_val1(resultset.getString(1));
                      res.set_val2(resultset.getString(2));
                      res.set_val3(resultset.getString(3));
                     result.add(res);
                   }
                   resultset.close();
                  statement.close();
                  connection.close();
                  return result; 
            }catch(Exception e){
                System.out.println("eror in method get_raport_infitem_2!!!!:"+e);
            }
           return null;
     }     
      
   
    public List<Reset> get_raport_intemes()
      {
            List<Reset> result=new ArrayList<>();
             ResultSet resultset = null;
            try{
             Statement statement = connection.createStatement();
     String sql="SELECT * from items INNER JOIN types ON items.type_id=types.type_id";
                   resultset = statement.executeQuery(sql) ;

                   while(resultset.next())
                   {
                        Reset res=new Reset();
                      res.set_val1(resultset.getString(2));
                      res.set_val2(resultset.getString(3));
                      res.set_val3(resultset.getString(4));
                      res.set_val4(resultset.getString(5));
                      res.set_val5(resultset.getString(6));
                      res.set_val6(resultset.getString(9));
                     result.add(res);
                   }
                   resultset.close();
                  statement.close();
                  connection.close();
                  return result; 
            }catch(Exception e){
                System.out.println("eror in method get_raport_intem!!!!:"+e);
            }
           return null;
     }     
      
      
}
