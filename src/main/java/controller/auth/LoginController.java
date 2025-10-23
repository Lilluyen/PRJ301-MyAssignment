package controller.auth;

import dal.UserDBContext;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
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
        
        UserDBContext db = new UserDBContext();
        User user = db.get(username, password);
        if(user != null){
            request.getSession().setAttribute("auth", user);
            response.sendRedirect("home.jsp");
        }else{
            request.setAttribute("username", username);
            request.setAttribute("pass", password);
            request.setAttribute("message", "username or password is not correct!");
            request.getRequestDispatcher("/views/auth/Login.jsp").forward(request, response);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // If user is authenticated, show the home page
        request.getRequestDispatcher("/views/auth/Login.jsp").forward(request, response);
    }

}
