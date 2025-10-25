package controller.auth;

import dal.UserDBContext;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.iam.User;

@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String rememberMe = request.getParameter("remember");
        
        Cookie usernameCookie = new Cookie("usernameCookie", username);
            Cookie passwordCookie = new Cookie("passwordCookie", password);
            Cookie rememberCookie = new Cookie("remCookie", rememberMe);
            if (rememberMe != null) {
                usernameCookie.setMaxAge(60*60);
                passwordCookie.setMaxAge(60*60);
                rememberCookie.setMaxAge(60*60);
            }else{
                usernameCookie.setMaxAge(0);
                passwordCookie.setMaxAge(0);
                rememberCookie.setMaxAge(0);
            }
            response.addCookie(usernameCookie);
            response.addCookie(passwordCookie);
            response.addCookie(rememberCookie);

        UserDBContext db = new UserDBContext();
        User user = db.get(username, password);
        if (user != null) {
            request.getSession().setAttribute("auth", user);
            response.sendRedirect(request.getContextPath() + "/home");
        } else {
            request.setAttribute("username", username);
            request.setAttribute("pass", password);
            request.setAttribute("message", "Username or Password is incorrect !");
            request.getRequestDispatcher("/views/auth/Login.jsp").forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // If user is authenticated, show the home page
        request.getRequestDispatcher("/views/auth/Login.jsp").forward(request, response);
    }

}
