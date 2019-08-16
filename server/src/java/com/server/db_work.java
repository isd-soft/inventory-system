
package com.server;
import java.sql.Connection;
import java.sql.DriverManager;


public class db_work {
    protected final String url="jdbc:mysql://localhost:3306/test1";
    protected final String username="root";
    protected final String pass="758291";
    
    Connection con;
    java.sql.Statement stat;
    
   public db_work()
   {
       try{
          /* con=DriverManager.getConnection(url,username,pass);
           stat=con.createStatement();*/
       }
       catch(Exception e){
           
       }
   }
    
   
   public void update_user()
   {
       
   }
       
   public void delete_user()
   {
       
   }

   
   public int add_users(int id,String first_name,String last_name)
   {
       try{
          
        Class.forName("com.mysql.jdbc.Driver");
         con=DriverManager.getConnection(url,username,pass);
        java.sql.Statement stat=con.createStatement();
    String sql="Insert into employees(emp_id,last_name,first_name) values("+id+",'"+first_name+"','"+last_name+"');";   
        stat.executeUpdate(sql);
        stat.close();
        con.close();      
       }
       catch(Exception e){
       }     
       
       return 0;
   }
   
   
}
