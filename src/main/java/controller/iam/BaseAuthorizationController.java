/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.iam;

import dal.RoleDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.iam.Feature;
import model.iam.Role;
import model.iam.User;

/**
 *
 * @author tdgg
 */
public abstract class BaseAuthorizationController extends BaseAuthenticationController {

    public boolean isAuthorized(User user, HttpServletRequest request) {
        if (user.getRoles().isEmpty()) {
            RoleDBContext db = new RoleDBContext();
            user.setRoles(db.getRolesByUserID(user.getId()));
            request.getSession().setAttribute("auth", user);
        }

        String url = request.getServletPath();
        for (Role role : user.getRoles()) {
            for (Feature feature : role.getFeatures()) {
                if (feature.getUrl().equals(url)) {
                    return true;
                }
            }
        }
        return false;
    }

    protected abstract void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException;

    protected abstract void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException {
        if (isAuthorized(user, request)) {
            processPost(request, response, user);
        } else {
            request.getSession().setAttribute("message", "denied");
            response.sendRedirect(request.getContextPath() + "/home");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user) throws ServletException, IOException {
        if (isAuthorized(user, request)) {
            processGet(request, response, user);
        } else {
            request.getSession().setAttribute("message", "denied");
            response.sendRedirect(request.getContextPath() + "/home");
        }
    }

}
