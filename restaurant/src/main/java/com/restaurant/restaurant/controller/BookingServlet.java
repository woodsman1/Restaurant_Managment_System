/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.restaurant.controller;

import com.restaurant.restaurant.Dao.BookingDao;
import com.restaurant.restaurant.module.Book_table;
import java.io.IOException;
import java.io.PrintWriter;
//import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mohit
 */
@WebServlet(name = "BookingServlet", urlPatterns = {"/Booking"})
public class BookingServlet extends HttpServlet {

  
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
//        DateFormat format = new SimpleDateFormat("d MMMM, yyyy", Locale.ENGLISH);
        Book_table b_table = new Book_table();
        BookingDao bd = new BookingDao();

//        String date_raw = request.getParameter("date");
        b_table.setSql_date(request.getParameter("date"));
        
//        String time = request.getParameter("time");
        b_table.setSql_time(request.getParameter("time"));
        
//        String persons_number = request.getParameter("person_number");
        b_table.setNo_persons(Integer.parseInt(request.getParameter("person_number")));
        
//        String phoneNo = request.getParameter("phone");
        b_table.setContact_number(request.getParameter("phone"));

        b_table.setDuration(Integer.parseInt(request.getParameter("duration")));
        
        System.out.println("! done till here !");
        
        System.out.println("start : "+ b_table.getSql_time() + "\nend : "+ b_table.getEndTime());
        
        PrintWriter out = response.getWriter();
        
        if(bd.check_avability(b_table)){
            out.println("Available");
            if (bd.reserve(b_table)){
                out.println("reserve succesfully :)");
            }
            else{
                 out.println("Sorry cant reserve :(");
            }
        }
        else{
            out.println("Sorry we are full :(");
        }
        
        
    }

}
