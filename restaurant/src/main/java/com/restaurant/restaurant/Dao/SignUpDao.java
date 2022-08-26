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
public class SignUpDao {
    
    
    public boolean register(String username ,String name,String email, String password){
        
        String query = "INSERT INTO Customers (Username, name, Email, password) VALUE (?,?,?,?);";
        String url = "jdbc:mysql://localhost:3306/restaurant";
        String user = "root";
        String pass = "";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);
            PreparedStatement st =  con.prepareStatement(query);
            
            st.setString(1, username);
            st.setString(2, name);            
            st.setString(3, email);
            st.setString(4, password);
            
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
