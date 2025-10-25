package controller.iam;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.iam.User;

public abstract class BaseAuthenticationController extends HttpServlet {

    private boolean isAuthenticated(HttpServletRequest request) {
        // Implement authentication check logic
        return request.getSession().getAttribute("auth") != null;
    }

    protected abstract void doPost(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException;

    protected abstract void doGet(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (isAuthenticated(request)) {
            User user = (User) request.getSession().getAttribute("auth");
            doPost(request, response, user);
            // Proceed with the request
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (isAuthenticated(request)) {
            User user = (User) request.getSession().getAttribute("auth");
            doGet(request, response, user);
            // Proceed with the request
        } else {
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }
}
