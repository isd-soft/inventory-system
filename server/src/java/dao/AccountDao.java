/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
 
import cript.MD5;
import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;
import util.Database;


public class AccountDao {
 
    private Connection connection;
 
    public AccountDao() {
        connection = Database.getConnection();
    }
 
    public void checkAccount(Account account) {
        System.out.println(" checkAccount acess!!");
        try {
            PreparedStatement ps = connection.prepareStatement("select id from accounts where id = ?");
            ps.setString(1, account.getId());
                ResultSet rs = ps.executeQuery();
                if (rs.next()) // found
                {
                    updateAccount(account);
                } 
            
        } catch (Exception ex) {
            System.out.println("Error in check() -->" + ex.getMessage());
        } 
    }

 
    public void deleteAccount(String accountId) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("delete from accounts where id=?");
            // Parameters start with 1
            preparedStatement.setString(1, accountId);
            preparedStatement.executeUpdate();
          preparedStatement.close();
          connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 
        public void addAccount(Account account) {
        try {
            System.out.println(" addAccount acess!!");
            MD5 crypt=new MD5();
            PreparedStatement preparedStatement = connection.prepareStatement("insert into accounts (email, uname, pass, status,regdate) values (?, ?, ?, ?,CURDATE())");
            // Parameters start with 1

            preparedStatement.setString(1, account.getEmail());
            preparedStatement.setString(2, account.getUname());            
            preparedStatement.setString(3, crypt.md5(account.getPass()));            
            preparedStatement.setString(4, account.getStatus());  
 
            preparedStatement.executeUpdate();
          preparedStatement.close();
          connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    
    
    
    public void updateAccount(Account account) {
        MD5 crypt=new MD5();
        
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("update accounts set email=?, uname=?, pass=?, status=? "
                    + "where id=?");
            // Parameters start with 1
            
            preparedStatement.setString(1, account.getEmail());
            preparedStatement.setString(2, account.getUname());

            preparedStatement.setString(3, crypt.md5(account.getPass()));
            preparedStatement.setString(4, account.getStatus());
            preparedStatement.setString(5, account.getId());
            preparedStatement.executeUpdate();
              preparedStatement.close();
          connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 
    public List<Account> getAllAccounts() {
        List<Account> accounts = new ArrayList<Account>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from accounts");
            while (rs.next()) {
               Account account = new Account();
               account.setId(rs.getString("id"));
               account.setEmail(rs.getString("email"));
               account.setUname(rs.getString("uname"));
               account.setPass(rs.getString("pass"));
               account.setStatus(rs.getString("status"));
               accounts.add(account);                
       }
            rs.close();
             statement.close();
          connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
 
        return accounts;
    }
    
    
 
        
            public List<Account> getAllAccountID() {
        List<Account> accounts = new ArrayList<Account>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from accounts");
            while (rs.next()) {
               Account account = new Account();

               account.setId(rs.getString("id"));

               accounts.add(account);
                
                
                
            }
           rs.close();
           statement.close();
          connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
 
        return accounts;
    }
 
    public Account getAccountById(String accountId) {
        Account account = new Account();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from accounts where id=?");
            preparedStatement.setString(1, accountId);
            ResultSet rs = preparedStatement.executeQuery();
 
            if (rs.next()) {
                account.setId(rs.getString("id"));
                account.setEmail(rs.getString("email"));
                account.setUname(rs.getString("uname"));
                account.setPass(rs.getString("pass"));
                account.setStatus(rs.getString("status"));
            }
            rs.close();
             preparedStatement.close();
          connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
 
        return account;
    }
    
    public Account login_confirm(String name,String pass)
    {
        Account ac=new Account();
        try {
            MD5 crypt=new MD5();
            PreparedStatement preparedStatement = connection.prepareStatement("select * from accounts where uname=? and pass=? ;");
            preparedStatement.setString(1, name);
            preparedStatement.setString(2,crypt.md5(pass));
            ResultSet rs = preparedStatement.executeQuery();
            if(rs.next()){
                ac.setUname(name);
                ac.setStatus(rs.getString(6));
           rs.close();
            preparedStatement.close();
            connection.close();
             return ac;
            }
            rs.close();
            preparedStatement.close();
            connection.close();
      
             } catch (SQLException ex) {
            Logger.getLogger(AccountDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        ac.setUname("");
                ac.setStatus("");
         return ac;
    }
    
    
    
}