
package com.restaurant.restaurant.controller;

import com.restaurant.restaurant.Dao.LoginDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("pass");
        
        LoginDao ld = new LoginDao();
        
        if(ld.check(username, password)){
            HttpSession session = request.getSession();
            session.setAttribute("username", username);
            System.out.println("username : " + username);
            response.sendRedirect("customer.jsp");
        }
        else{
            response.sendRedirect("login.jsp");
        }
    }

    
    @Override
    public String getServletInfo() {
        return "In login Servlet";
    }
}
