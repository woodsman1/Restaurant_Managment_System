/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.restaurant.Dao;

import com.restaurant.restaurant.module.Staff;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Mohit
 */
public class StaffLoginDao {
    
    public boolean check(Staff obj){
        
        String query = "select * from Chefs where Chef_ID=? and password=?;";
        String url = "jdbc:mysql://localhost:3306/restaurant";
        String user = "root";
        String pass = "";
        
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);
            PreparedStatement st = con.prepareStatement(query);
            
            st.setString(1, obj.getUsername());
            st.setString(2, obj.getPassword());
            
            ResultSet rs = st.executeQuery();
            
            
            if(rs.next()){
                return true;
            }
            con.close();
            
        } catch (Exception e) {
            e.getStackTrace();
            System.out.println("error : " + e);
        }
        
        System.out.println("step 2 staff not completed");
        
        
        
        return false;
    }
    
    
    public boolean admin_check(Staff obj){
        
        String query = "select * from superuser where username=? and password=?;";
        String url = "jdbc:mysql://localhost:3306/restaurant";
        String user = "root";
        String pass = "";
        
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);
            PreparedStatement st = con.prepareStatement(query);
            
            st.setString(1, obj.getUsername());
            st.setString(2, obj.getPassword());
            
            ResultSet rs = st.executeQuery();
            
            
            if(rs.next()){
                return true;
            }
            con.close();
            
        } catch (Exception e) {
            e.getStackTrace();
            System.out.println("error : " + e);
        }
        
        System.out.println("step 2 of admin not completed");
        
        
        
        return false;
    }
    
}
