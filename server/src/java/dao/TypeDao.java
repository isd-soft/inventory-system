/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;
 
import java.sql.*;
import java.util.*;
import model.Type;
import util.Database;
 
public class TypeDao {
 
    private Connection connection;
 
    public TypeDao() {
        connection = Database.getConnection();
    }
 
    public void checkType(Type type) {
        try {
            PreparedStatement ps = connection.prepareStatement("select type_id from types where type_id = ?");
            ps.setString(1, type.getType_id());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) // found
            {
                updateType(type);
            } else {
                addType(type);
            }
        } catch (Exception ex) {
            System.out.println("Error in check() -->" + ex.getMessage());
        } 
    }
    public void addType(Type type) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("insert into types (type_name, type_prefix, type_id) values (?, ?, 0)");           
            preparedStatement.setString(1, type.getType_name());
            preparedStatement.setString(2, type.getType_prefix());
            preparedStatement.executeUpdate();
            
            preparedStatement.close();
             connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 
    public void deleteType(String typeId) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("delete from types where type_id=?");
            // Parameters start with 1
            preparedStatement.setString(1, typeId);
            preparedStatement.executeUpdate();
            preparedStatement.close();
             connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 
    public void updateType(Type type) {
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("update types set type_name=?, type_prefix=? "
                    + "where type_id=?");
            // Parameters start with 1
            
            preparedStatement.setString(1, type.getType_name());
            preparedStatement.setString(2, type.getType_prefix());
            preparedStatement.setString(3, type.getType_id()); 
            
            preparedStatement.executeUpdate();
              preparedStatement.close();
             connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 
    public List<Type> getAllTypes() {
        List<Type> types = new ArrayList<Type>();
        try {
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery("select * from types");
            while (rs.next()) {
                Type type = new Type();
               type.setType_id(rs.getString("type_id"));
               type.setType_name(rs.getString("type_name"));
               type.setType_prefix(rs.getString("type_prefix"));
               types.add(type);                
            }
             rs.close();
             statement.close();
             connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return types;
    }
 
    public Type getTypeById(String typeId) {
        Type type = new Type();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement("select * from types where type_id=?");
            preparedStatement.setString(1, typeId);
            ResultSet rs = preparedStatement.executeQuery();
 
            if (rs.next()) {
                type.setType_id(rs.getString("type_id"));
                type.setType_name(rs.getString("type_name"));
                type.setType_prefix(rs.getString("type_prefix"));

            }
            rs.close();
             preparedStatement.close();
             connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
 
        return type;
    }
}