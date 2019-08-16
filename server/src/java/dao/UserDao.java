/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
 
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import model.User;
import util.Database;
 
public class UserDao {
 
    private Connection connection;
    
    public UserDao() {
        connection = Database.getConnection();
    }
 
    public void addUser(User user) {
       
        boolean aces=true;
        System.out.print("name:"+user.getName());
        try {
            Statement statement = connection.createStatement();
              ResultSet rs=statement.executeQuery("Select name,surname,phone from users where name='"+user.getName()+"' and surname='"+user.getSurname()+"'"
                      + " and phone='"+user.getPhone()+"';");
              System.out.println("aces results:"+aces);
              while(rs.next())
              {
                  aces=false;  
              }
              rs.close();
              statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        // connection.close();
       if(aces==true){
        try(PreparedStatement preparedStatement = connection.prepareStatement("insert into users(emp_ID, name, surname, hired, phone) values (0, ?, ?, ?, ?)")) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getSurname());            
            preparedStatement.setDate(3, new java.sql.Date(user.getHired().getTime()));
            preparedStatement.setString(4, user.getPhone());  
            preparedStatement.executeUpdate();
           connection.close();     
        }
        catch(Exception e){}
       }
    }
 
    public void deleteUser(String userId) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("delete from users where emp_ID=?");
            preparedStatement.setString(1, userId);
            preparedStatement.executeUpdate();
             preparedStatement.close();
                connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 
    public void updateUser(User user) {
        try {        
      Statement statement = connection.createStatement();
      String sql="update users set name='"+user.getName()+"',surname='"+user.getSurname()+"',phone='"+user.getPhone()+"',hired='"+user.getDate()+"' where emp_ID="+user.getEmp_ID()+";";
            statement.executeUpdate(sql);
             statement.close();
                connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<User>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from users");
            while (rs.next()) {
                User user = new User();
               user.setEmp_ID(rs.getString("emp_ID"));
               user.setName(rs.getString("name"));
               user.setSurname(rs.getString("surname"));
               user.setPhone(rs.getString("phone"));
               user.setHired(rs.getDate("hired"));
                users.add(user);           
            }
            rs.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
 
        return users;
    }
 
    public User getUserById(String userId) {
        User user = new User();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from users where emp_ID=?");
            preparedStatement.setString(1, userId);
            ResultSet rs = preparedStatement.executeQuery();
 
            if (rs.next()) {
                user.setEmp_ID(rs.getString("emp_ID"));
                user.setName(rs.getString("name"));
                user.setSurname(rs.getString("surname"));
                user.setPhone(rs.getString("phone"));
                user.setHired(rs.getDate("hired"));
            }
            rs.close();
             preparedStatement.close();
                connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
 
        return user;
    }
    
      public ArrayList<String> getAllNames(){
            ArrayList<String> as=new ArrayList<>();
         try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from users");

            while (rs.next()) {
                as.add(rs.getString(2)+" "+rs.getString(3));
                              
            }
            rs.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
 
        return as;
    }
    
}