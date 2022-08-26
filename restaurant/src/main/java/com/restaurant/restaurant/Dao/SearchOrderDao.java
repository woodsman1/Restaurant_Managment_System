/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.restaurant.Dao;

import com.restaurant.restaurant.module.Items;
import com.restaurant.restaurant.module.Order;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

/**
 *
 * @author Mohit
 */
public class SearchOrderDao {
    
    public Order check(String order_id, String username){
        
        Order order = new Order();
        
        Vector<String> item_name = new Vector();
        Vector<Double> item_price = new Vector();
        Vector<Integer> item_qunt = new Vector();
        
        
        String query = "SELECT it.Item_Name, Item_price, od.qnt\n" +
                        "FROM order_detail AS od\n" +
                        "LEFT JOIN Items AS it\n" +
                        "ON od.Item_ID = it.Item_ID\n" +
                        "where od.OrderID =? and od.Username=?;";
        
        String url = "jdbc:mysql://localhost:3306/restaurant";
        String user = "root";
        String pass = "";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);
            PreparedStatement st = con.prepareStatement(query);
            
            
            st.setString(1, order_id);
            st.setString(2, username); 
            
            ResultSet rs = st.executeQuery();

            
            while(rs.next()){
                item_name.add(rs.getString("Item_Name"));
                item_price.add(rs.getDouble("Item_price"));
                item_qunt.add(rs.getInt("qnt"));
            }
            
            order.setList_of_itemsID(item_name);
            order.setPrice_of_items(item_price);
            order.setQuantity(item_qunt);
            
            con.close();
            return order;
            
        } catch (Exception e) {
            e.getStackTrace();
            System.out.println("error : " + e);
        }
        
        
        return null;
    }
    
}
