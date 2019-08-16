/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Concat;
import model.Item;
import util.Database;

/**
 *
 * @author Mihai1
 */
public class ConcatDao {
   private Connection connection;
 
    public ConcatDao() {
        connection = Database.getConnection();
    }
 
    public void checkAssign(Concat concat) {
        boolean aces=true,aces1=true;
        ItemDao item_dao=new ItemDao();
         List<Concat> licon=getAllAssigns1();
         List<Item> liitems=item_dao.getAllItems1();
        for(int i=0;i<licon.size();++i){
            if(licon.get(i).get_barcodes().equals(concat.get_barcodes()))aces=false;
             System.out.println("egale"+licon.get(i).get_barcodes()+" "+concat.get_barcodes());
                }
           /* for(int i=0;i<liitems.size();++i){
            if(liitems.get(i).getItem_barcode().equals(concat.get_barcodes()))aces1=false;
            // System.out.println("egale1"+licon.get(i).get_barcodes()+" "+concat.get_barcodes());
                }
        
        */
        System.out.println("testam validarea "+aces);
        if(aces==true){
        try {
            System.out.println("sa apelat  checkAssign!!!!!");
            PreparedStatement ps = connection.prepareStatement("select item_barcode from assigns where item_barcode = ?");
            ps.setString(1, concat.get_barcodes());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) // found
            {
                updateAssign(concat);
            } else {
                addAssign(concat);
            }
        } catch (Exception ex) {
            System.out.println("Error in check() -->" + ex.getMessage());
        } 
        }
    }
    public void addAssign(Concat concat){
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("insert into assigns (item_barcode, emp_id) values (?, ?)");        
            preparedStatement.setString(1, concat.get_barcodes());
            preparedStatement.setString(2, concat.getEmps_id());
  
            preparedStatement.executeUpdate();
              preparedStatement.close();
                connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
    }
 
    public void deleteAssign(String assignId) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("delete from assigns where item_barcode=?");
            //PreparedStatement preparedStatement = connection.prepareStatement("update assigns set emp_id=? " + "where item_barcode=?");
            //preparedStatement.setString(1, "o");
            preparedStatement.setString(1, assignId);
            preparedStatement.executeUpdate();
             preparedStatement.close();
                connection.close();
 
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 
    public void updateAssign(Concat concat) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("update assigns set emp_id=? "
                    + "where item_barcode=?");
            // Parameters start with 1
            
            preparedStatement.setString(1, concat.getEmps_id());
            preparedStatement.setString(2, concat.get_barcodes()); 
            
            preparedStatement.executeUpdate();
               preparedStatement.close();
                connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 
    public List<Concat> getAllAssigns() {
        List<Concat> a = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from assigns");
            while (rs.next()) {
               Concat assign = new Concat();
               assign.set_barcodes(rs.getString("item_barcode"));
               assign.setEmps_id(rs.getString("emp_id"));
               a.add(assign);                
            }
            rs.close();
             statement.close();
                connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        };           
        return a;
    }
 
    public Concat getConcatId(String assignId) {
        Concat m = new Concat();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from assigns where item_barcode=?");
            preparedStatement.setString(1, assignId);
            ResultSet rs = preparedStatement.executeQuery();
 
            if (rs.next()) {
                m.set_barcodes(rs.getString("item_barcode"));
                m.setEmps_id(rs.getString("emp_id"));

            }
            rs.close();
             preparedStatement.close();
                connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
 
        return m;
    }

    
    public List<Concat> getAllAssigns1() {
        List<Concat> a = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from assigns");
            while (rs.next()) {
               Concat assign = new Concat();
               assign.set_barcodes(rs.getString("item_barcode"));
               assign.setEmps_id(rs.getString("emp_id"));
               a.add(assign);                
            }
            rs.close();
             statement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        };           
        return a;
    }
    

}
