/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.restaurant.controller;

import com.restaurant.restaurant.Dao.SearchOrderDao;
import com.restaurant.restaurant.module.Order;
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
@WebServlet(name = "SearchOrderServlet", urlPatterns = {"/SearchOrder"})
public class SearchOrderServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        
        SearchOrderDao so = new SearchOrderDao();
        
        String Order_id = request.getParameter("order_id");
        String username = (String) session.getAttribute("username"); 
        
        System.out.println("username in search : "+username); 
        
        Order order = new Order();
        order = so.check(Order_id, username);
        
        if(order != null ){
            session.setAttribute("order", order);
            session.setAttribute("total", order.getOrder_price());
            session.setAttribute("order_id", Integer.parseInt(Order_id));
            response.sendRedirect("confirmation.jsp");
        }
        else{
            response.sendRedirect("customer.jsp");
        }
        
    }


}
