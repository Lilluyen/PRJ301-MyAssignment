/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.auth;

import controller.iam.BaseAuthenticationController;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import model.iam.User;

/**
 *
 * @author tdgg
 */
@WebServlet(urlPatterns = "/logout")
public class LogoutController extends BaseAuthenticationController {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException {
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response,
            User user) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cooky : cookies) {
                if (cooky.getName().equals("usernameCookie")
                        || cooky.getName().equals("passwordCookie")) {
                    cooky.setValue("");
                    cooky.setMaxAge(0);
                    cooky.setPath("/");
                    response.addCookie(cooky);
                }
            }
            response.sendRedirect(request.getContextPath() + "/");
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response,
            User user) throws ServletException, IOException {
        processRequest(request, response, user);
    }
    
}
