/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.restaurant.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mohit
 */
public class LoginDao {
    
    
    public boolean check(String username, String password){
        
        String query = "select * from Customers where Username=? and password=?;";
        String url = "jdbc:mysql://localhost:3306/restaurant";
        String user = "root";
        String pass = "";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);
            PreparedStatement st = con.prepareStatement(query);
            
            st.setString(1, username);
            st.setString(2, password);
            
            ResultSet rs = st.executeQuery();
            
            
            if(rs.next()){
                return true;
            }
            con.close();
            
        } catch (Exception e) {
            e.getStackTrace();
            System.out.println("error : " + e);
        }
        
        System.out.println("step 2 not completed");
        
        return false;
    }
    
    
    
}
