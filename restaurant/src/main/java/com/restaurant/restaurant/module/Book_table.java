/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.restaurant.module;

import com.restaurant.restaurant.controller.BookingServlet;
import java.sql.Time;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author Mohit
 */
public class Book_table extends Table{
    
    protected java.sql.Date sql_date;
    protected java.sql.Time sql_time;
    protected java.sql.Time end_sql_time;
    protected int Booking_Id;
    protected int no_persons;
    protected String contact_number;
    protected int duration;

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }
    

    public String getContact_number() {
        return contact_number;
    }

    public void setContact_number(String contact_number) {
        this.contact_number = contact_number;
    }

    public java.sql.Date getSql_date() {
        return sql_date;
    }

    public void setSql_date(String date_raw) {
        DateFormat format = new SimpleDateFormat("d MMMM, yyyy", Locale.ENGLISH);
        Date date;
        
        try {
            date = format.parse(date_raw);
            this.sql_date = new java.sql.Date(date.getTime());
            
        } catch (ParseException ex) {
            Logger.getLogger(BookingServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Time getSql_time() {
        return sql_time;
    }

    public void setSql_time(String time) {
        DateFormat format = new SimpleDateFormat("hh:mm a");
        try {
            Date d1 = format.parse(time);
            this.sql_time = new java.sql.Time(d1.getTime());
            this.end_sql_time = new java.sql.Time(d1.getTime());
            
        } catch (ParseException ex) {
            Logger.getLogger(BookingServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int getBooking_Id() {
        return Booking_Id;
    }

    public void setBooking_Id(int Booking_Id) {
        this.Booking_Id = Booking_Id;
    }

    public int getNo_persons() {
        return no_persons;
    }

    public void setNo_persons(int no_persons) {
        this.no_persons = no_persons;
    }
    
    public Time getEndTime(){
        int hr = this.sql_time.getHours();
        hr = hr+this.duration;
        this.end_sql_time.setHours(hr);
        return end_sql_time;
    }
    
}
