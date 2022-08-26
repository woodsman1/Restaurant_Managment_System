/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.restaurant.controller;

import com.restaurant.restaurant.Dao.AddItemDao;
import com.restaurant.restaurant.module.Items;
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
@WebServlet(name = "AddItemServlet", urlPatterns = {"/AddItem"})
public class AddItemServlet extends HttpServlet {



    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Items it = new Items();
        AddItemDao ai = new AddItemDao();
        
        it.setName(request.getParameter("name"));
        it.setCuisine(request.getParameter("cuisine"));
        it.setPrice(Double.parseDouble(request.getParameter("price")));
        
        if(ai.create(it)){
            response.sendRedirect("staff0.jsp");
        }
        else{
            System.out.println("unsuccesfull");
            response.sendRedirect("createitem.jsp");
        }
    }



}
