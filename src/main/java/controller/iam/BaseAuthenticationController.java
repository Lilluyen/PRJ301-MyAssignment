package controller.auth;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.iam.User;


public abstract class BaseAuthentiCation extends HttpServlet {

    private boolean isAuthenticated(HttpServletRequest request) {
        // Implement authentication check logic
        return request.getSession().getAttribute("user") != null;
    }

    protected abstract void doPost(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException;
    protected abstract void doGet(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (isAuthenticated(request)) {
            User user = (User) request.getSession().getAttribute("user");
            doPost(request, response, user);
            // Proceed with the request
        } else {
            request.getRequestDispatcher("/views/auth/Login.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (isAuthenticated(request)) {
            User user = (User) request.getSession().getAttribute("user");
            doGet(request, response, user);
            // Proceed with the request
        } else {
            request.getRequestDispatcher("/views/auth/Login.jsp").forward(request, response);
        }
    }
}
