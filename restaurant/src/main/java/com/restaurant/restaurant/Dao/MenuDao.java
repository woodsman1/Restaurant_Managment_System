/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.restaurant.Dao;

import com.restaurant.restaurant.module.Items;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

/**
 *
 * @author Mohit
 */
public class MenuDao {
    
    
    public Vector<Items> get_items(){
        
        String query = "SELECT * FROM Items;";
        String url = "jdbc:mysql://localhost:3306/restaurant";
        String user = "root";
        String pass = "";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);
            PreparedStatement st = con.prepareStatement(query);
            
            ResultSet rs = st.executeQuery();
            
            Vector<Items> v1 = new Vector();
            
            while(rs.next()){
                Items obj = new Items();
                obj.setId(rs.getInt("Item_ID"));
                obj.setCuisine(rs.getString("cuisine"));
                obj.setName(rs.getString("Item_Name"));
                obj.setPrice(rs.getFloat("Item_price"));
                
                v1.add(obj);
            }
            con.close();
            return v1;
            
            
        } catch (Exception e) {
            e.getStackTrace();
            System.out.println("error : " + e);
        }
        
        System.out.println("step 2 not completed");
        
        return null;
    }
    
}
