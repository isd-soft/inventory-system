/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
 
import java.sql.*;
import java.util.*;
import model.Item;
import util.Database;
 
public class ItemDao {
 
    private Connection connection;
 
    public ItemDao() {
        connection = Database.getConnection();
    }
 
    public void checkItem(Item item) {
        try {
            PreparedStatement ps = connection.prepareStatement("select item_id from items where item_id = ?");
            ps.setString(1, item.getItem_id());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) // found
            {
                updateItem(item);
            } else {
                addItem(item);
            }
        } catch (Exception ex) {
            System.out.println("Error in check() -->" + ex.getMessage());
        } 
    }
    public boolean addItem(Item item) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("insert into items(item_id, item_name, item_barcode, item_brand, item_model, item_serial, type_id) values (0, ?, ?, ?, ?, ?, ?)");
            // Parameters start with 1
            //preparedStatement.setString(1, item.getItem_id());
            preparedStatement.setString(1, item.getItem_name());
            preparedStatement.setString(2, item.getItem_barcode());            
            preparedStatement.setString(3, item.getItem_brand());
            preparedStatement.setString(4, item.getItem_model());
            preparedStatement.setString(5, item.getItem_serial()); 
            preparedStatement.setString(6, item.getType_id()); 
            preparedStatement.executeUpdate();
            preparedStatement.close();
             connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
 
    public void deleteItem(String itemId) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("delete from items where item_id=?");
            // Parameters start with 1
            preparedStatement.setString(1, itemId);
            preparedStatement.executeUpdate();
            preparedStatement.close();
             connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 
    public void updateItem(Item item) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("update items set item_name=?, item_barcode=?, item_brand=?, item_model=?, item_serial=?, type_id=? "
                    + "where item_id=?");
            // Parameters start with 1

            preparedStatement.setString(1, item.getItem_name());
            preparedStatement.setString(2, item.getItem_barcode());
            preparedStatement.setString(3, item.getItem_brand());
            preparedStatement.setString(4, item.getItem_model());
            preparedStatement.setString(5, item.getItem_serial());
            preparedStatement.setString(6, item.getType_id());
            
            preparedStatement.setString(7, item.getItem_id());
            preparedStatement.executeUpdate();
            preparedStatement.close();
             connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 
    public List<Item> getAllItems() {
        List<Item> items = new ArrayList<Item>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from items");
            while (rs.next()) {
                Item item = new Item();
               item.setItem_id(rs.getString("item_id"));
               item.setItem_name(rs.getString("item_name"));
               item.setItem_barcode(rs.getString("item_barcode"));
               item.setItem_brand(rs.getString("item_brand"));
               item.setItem_model(rs.getString("item_model"));
               item.setItem_serial(rs.getString("item_serial"));
               item.setType_id(rs.getString("type_id"));
                items.add(item);
                                              
            }
            rs.close();
             statement.close();
             connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
 
        return items;
    }
 
    public Item getItemById(String itemId) {
        Item item = new Item();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from items where item_id=?");
            preparedStatement.setString(1, itemId);
            ResultSet rs = preparedStatement.executeQuery();
 
            if (rs.next()) {
                item.setItem_id(rs.getString("item_id"));
                item.setItem_name(rs.getString("item_name"));
                item.setItem_barcode(rs.getString("item_barcode"));
                item.setItem_brand(rs.getString("item_brand"));
                item.setItem_model(rs.getString("item_model"));
                item.setItem_serial(rs.getString("item_serial"));
                item.setType_id(rs.getString("type_id"));
            }
            rs.close();
             preparedStatement.close();
             connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
 
        return item;
    }
    
    public List<Item> getAllItems1() {
        List<Item> items = new ArrayList<Item>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from items");
            while (rs.next()) {
                Item item = new Item();
               item.setItem_id(rs.getString("item_id"));
               item.setItem_name(rs.getString("item_name"));
               item.setItem_barcode(rs.getString("item_barcode"));
               item.setItem_brand(rs.getString("item_brand"));
               item.setItem_model(rs.getString("item_model"));
               item.setItem_serial(rs.getString("item_serial"));
               item.setType_id(rs.getString("type_id"));
                items.add(item);
                                              
            }
            rs.close();
             statement.close();
            // connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
 
        return items;
    }
    
    public List<Item> get_listunassigneds()
    {
       
        List<Item>items=new ArrayList<>();
        try{
           Statement statement = connection.createStatement();
            String sql="SELECT items.item_name, items.item_barcode, items.item_brand, items.item_model, items.item_serial, types.type_name, items.item_id "+
           "from assigns "+
           "RIGHT JOIN items "+
           "ON items.item_barcode=assigns.item_barcode "+
           "JOIN types ON "+
           "items.type_id=types.type_id "+
           "WHERE assigns.emp_id is NULL ";
            ResultSet rs = statement.executeQuery(sql) ;
             while(rs.next()){
             Item it=new Item();
             it.setItem_name(rs.getString(1));
             it.setItem_barcode(rs.getString(2)); 
             it.setItem_brand(rs.getString(3));
             it.setItem_model(rs.getString(4));
             it.setItem_serial(rs.getString(5));
             it.setType_name(rs.getString(6));
             it.setType_id(rs.getString(7)); 
             items.add(it);
             }
             
             rs.close();
             statement.close();
             connection.close();
        }catch(Exception e)
        {
            System.out.println("eroare in ItemDao metoda get_listunassigneds()!!!!! "+e);
        }
        
        return items;
    }
    
}