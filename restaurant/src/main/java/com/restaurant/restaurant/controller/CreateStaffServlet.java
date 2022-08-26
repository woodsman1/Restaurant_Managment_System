/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.restaurant.controller;

import com.restaurant.restaurant.Dao.CreateStaffDao;
import com.restaurant.restaurant.Dao.SignUpDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Mohit
 */
@WebServlet(name = "CreateStaffServlet", urlPatterns = {"/CreateStaff"})
public class CreateStaffServlet extends HttpServlet {




    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String salary = request.getParameter("salary");
        String address = request.getParameter("address");
        String pass = request.getParameter("password");
        
        
        CreateStaffDao sp = new CreateStaffDao();

        
        if(sp.register(username, name, gender, address, salary, pass)){
            System.out.println("new staff created");
            response.sendRedirect("admin.jsp");
        }
        else{
            System.out.println(" error in creating new staff created");
            response.sendRedirect("CreateNewStaff.jsp");
        }
    }


}
