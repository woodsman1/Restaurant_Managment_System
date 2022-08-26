/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.restaurant.controller;

import com.restaurant.restaurant.Dao.StaffLoginDao;
import com.restaurant.restaurant.module.Staff;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mohit
 */
@WebServlet(name = "StaffLoginServlet", urlPatterns = {"/StaffLogin"})
public class StaffLoginServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Staff obj = new Staff();
        StaffLoginDao sld = new StaffLoginDao();
        
        obj.setUsername(request.getParameter("chef_id"));;
        obj.setPassword(request.getParameter("pass"));
        
        System.out.println("In the StaffLoginservlet");
        
        if(sld.admin_check(obj)){
            HttpSession session = request.getSession();
            session.setAttribute("admin", obj.getUsername());
            System.out.println("! done with admin sign in !");
            response.sendRedirect("admin.jsp");
        }
        else{
            System.out.println("! error in admin sign in !");
  
            if(sld.check(obj)){
                HttpSession session = request.getSession();
                session.setAttribute("chef_username", obj.getUsername());
                response.sendRedirect("staff0.jsp");
            }
            else{
                response.sendRedirect("StaffLogin.jsp");
            }
            
        }
        
        
        
    }


}
