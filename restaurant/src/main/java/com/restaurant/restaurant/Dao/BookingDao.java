/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.restaurant.Dao;

import com.restaurant.restaurant.module.Book_table;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.DateFormat;  
import java.text.SimpleDateFormat;

/**
 *
 * @author Mohit
 */
public class BookingDao {
    
    public boolean check_avability(Book_table b){
        
        String query = "SELECT *\n" +
                       "FROM fooddesk AS fd\n" +
                       "LEFT JOIN Book_table AS bt\n" +
                       "ON fd.Table_ID = bt.Table_ID\n" +
                       "where (bt.Book_slot_date <> ? or bt.Booking_ID is NULL or bt.Book_slot_endtime < ?) and fd.capacity >= ?\n" +
                       "order by fd.capacity;";
        String url = "jdbc:mysql://localhost:3306/restaurant";
        String user = "root";
        String pass = "";
        
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);
            PreparedStatement st =  con.prepareStatement(query);

            
            st.setString(1, b.getSql_date().toString());
            st.setString(2, b.getSql_time().toString());            
            st.setString(3, Integer.toString(b.getNo_persons()));
            
            ResultSet rs = st.executeQuery();
            
            if(rs.next()){
                 b.setTableId(rs.getInt("Table_ID"));
                return true;
            }
            con.close();
            
        } catch (Exception e) {
            e.getStackTrace();
            System.out.println("error = " + e);
        }
        
        return false;
    }
    
    
    public boolean reserve(Book_table b){
        
        String query = "INSERT INTO Book_table(Book_slot_date, Book_slot_time, Book_slot_endtime, Table_ID) \n" +
                       "value (?, ?, ?, ?);";
        String url = "jdbc:mysql://localhost:3306/restaurant";
        String user = "root";
        String pass = "";
        
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, pass);
            PreparedStatement st =  con.prepareStatement(query);
            
            st.setString(1, b.getSql_date().toString());
            st.setString(2, b.getSql_time().toString());            
            st.setString(3, b.getEndTime().toString());
            st.setString(4, Integer.toString(b.getTableId()));
            
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
