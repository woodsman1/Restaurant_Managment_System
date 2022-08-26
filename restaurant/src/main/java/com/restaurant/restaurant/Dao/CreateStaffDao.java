/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.restaurant.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

/**
 *
 * @author Mohit
 */
public class CreateStaffDao {
    
    public boolean register(String username ,String name, String gender, String address, String salary, String password){
        
        String query = "INSERT INTO Chefs(Chef_ID, Chef_name, Chef_gender, chef_address, Chef_salary, password) value (?,?,?,?,?,?);";
        String url = "jdbc:mysql://localhost:3306/restaurant";
        String user = "root";
        String pass = "";
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);
            PreparedStatement st =  con.prepareStatement(query);
            
            st.setString(1, username);
            st.setString(2, name);            
            st.setString(3, gender);
            st.setString(4, address);
            st.setString(5, salary);
            st.setString(6, password);
            
            
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
