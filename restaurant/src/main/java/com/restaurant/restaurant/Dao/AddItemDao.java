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

/**
 *
 * @author Mohit
 */
public class AddItemDao {
    
    public boolean create(Items it){
        
        String query = "INSERT INTO Items (cuisine, Item_Name, Item_price) VALUE (?, ?, ?);";
        String url = "jdbc:mysql://localhost:3306/restaurant";
        String user = "root";
        String pass = "";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);
            PreparedStatement st =  con.prepareStatement(query);
            
            st.setString(1, it.getCuisine());
            st.setString(2,it.getName() );            
            st.setString(3,String.valueOf(it.getPrice()));
            
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
    
    
}
