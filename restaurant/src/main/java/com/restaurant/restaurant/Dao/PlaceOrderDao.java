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
public class PlaceOrderDao {
    
    public boolean insert_items(int order_id, String username, int id, int qnt){
        
        String query = "insert into order_detail (OrderId, Username, Item_ID, qnt) value (?,?,?,?);";
        String url = "jdbc:mysql://localhost:3306/restaurant";
        String user = "root";
        String pass = "";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);
            PreparedStatement st =  con.prepareStatement(query);
            
            st.setString(1, Integer.toString(order_id));
            st.setString(2, username);
            st.setString(3, Integer.toString(id));
            st.setString(4, Integer.toString(qnt));
            
            int rs = st.executeUpdate();
            
            if(rs == 1){
                return true;
            }
            con.close();
            
        } catch (Exception e) {
            e.getStackTrace();
            System.out.println("error = " + e);
        }
        
        return false;
    }
    
    
    public boolean createOrder(Order order, Vector<Integer> temp_id, String username){
        
        String query = "insert into Orders (order_price, Username) value (?,?);";
        String url = "jdbc:mysql://localhost:3306/restaurant";
        String user = "root";
        String pass = "";
        
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);
            PreparedStatement st =  con.prepareStatement(query);
            
            st.setString(1, Double.toString(order.getOrder_price()));
            st.setString(2, username);
            
            int rs = st.executeUpdate();
            
            if(rs == 1){
                int order_Id = getOrderId(username);
                Vector<Integer> item_qunt = order.getQuantity();
                
                for (int i = 0; i < temp_id.size(); i++) {
                    insert_items(order_Id, username, temp_id.get(i), item_qunt.get(i));
                }

                return true;
            }
            con.close();
            
        } catch (Exception e) {
            e.getStackTrace();
            System.out.println("error = " + e);
        }
        
        
        
        return false;
    }
    
    
    public int getOrderId(String username){
        
        String query = "select * from Orders \n" +
                        "where username = ?\n" +
                        "order by OrderID desc limit 1";
        
        String url = "jdbc:mysql://localhost:3306/restaurant";
        String user = "root";
        String pass = "";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);
            PreparedStatement st =  con.prepareStatement(query);
            
            st.setString(1, username);
            
            ResultSet rs = st.executeQuery();
            
            if(rs.next()){
                return rs.getInt("OrderID");
            }
            con.close();
            
        } catch (Exception e) {
            e.getStackTrace();
            System.out.println("error = " + e);
        }
        
        return 0;
    }
    
}
