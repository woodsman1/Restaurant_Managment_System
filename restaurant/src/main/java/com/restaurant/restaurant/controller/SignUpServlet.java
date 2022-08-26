/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.restaurant.restaurant.controller;
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
@WebServlet(name = "SignUpServlet", urlPatterns = {"/SignUpServlet"})
public class SignUpServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String conf_pass = request.getParameter("conf_pass");
        
        
        SignUpDao sp = new SignUpDao();
        
        if(pass == conf_pass) response.sendRedirect("SignUp.jsp");
        
        if(sp.register(username, name, email, pass)) 
            response.sendRedirect("login.jsp");
        else
            response.sendRedirect("SignUp.jsp");
    }


    @Override
    public String getServletInfo() {
        return "In SignUp Servlet";
    }// </editor-fold>

}
