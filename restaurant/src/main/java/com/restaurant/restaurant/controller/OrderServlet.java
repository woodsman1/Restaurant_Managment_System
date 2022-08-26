/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.restaurant.controller;

import com.restaurant.restaurant.Dao.MenuDao;
import com.restaurant.restaurant.Dao.PlaceOrderDao;
import com.restaurant.restaurant.module.Items;
import com.restaurant.restaurant.module.Order;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;
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
@WebServlet(name = "OrderServlet", urlPatterns = {"/Order"})
public class OrderServlet extends HttpServlet {


  

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        MenuDao mu = new MenuDao();
        Vector<Items> v1 = mu.get_items();
        
        Order order = new Order();
        
        Vector<Integer> temp_id = new Vector();
        Vector<String> item_id = new Vector();
        Vector<Double> item_price = new Vector();
        Vector<Integer> item_qunt = new Vector();
        
        for (int i = 0; i < v1.size(); i++){
            int id = v1.get(i).getId();
            int qunt = Integer.parseInt(request.getParameter(Integer.toString(id)));
            System.out.println( id+" :" +" "+qunt);
            
            if(qunt > 0){
                temp_id.add(id);
                item_id.add(v1.get(i).getName());
                item_price.add(v1.get(i).getPrice());
                item_qunt.add(qunt);
            } 
        }
        
        order.setList_of_itemsID(item_id);
        order.setPrice_of_items(item_price);
        order.setQuantity(item_qunt);
        
        double total = order.getOrder_price();
        
        HttpSession session = request.getSession();
        session.setAttribute("order", order);
        session.setAttribute("total", total);
        
        String username = (String) session.getAttribute("username");
        
        PlaceOrderDao po = new PlaceOrderDao();
        
        po.createOrder(order, temp_id, username);
        int order_id = po.getOrderId(username);
        session.setAttribute("order_id", order_id);
        
        response.sendRedirect("confirmation.jsp");
        
        

        
    }


}
