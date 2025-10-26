/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.request;

import controller.iam.BaseAuthorizationController;
import dal.DivisionDBContext;
import dal.RoleDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Division;
import model.RequestForLeave;
import model.iam.Role;
import model.iam.User;

/**
 *
 * @author tdgg
 */
@WebServlet(urlPatterns = "/request/employee-review")
public class EmployeeReviewController extends BaseAuthorizationController{

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        DivisionDBContext divisionDB = new DivisionDBContext();
        RoleDBContext roleDB = new RoleDBContext();
        
        RequestForLeave requestInfo = (RequestForLeave)req.getAttribute("requestInfo");
        
        ArrayList<Division> listDivisions = divisionDB.list();
        ArrayList<Role> listRoles = roleDB.getRolesByUserIDNotDuplicate(requestInfo.getCreatedBy().getId());
        
        
        req.setAttribute("display", "display: none;");
        req.setAttribute("divisions", listDivisions);
        req.setAttribute("roles", listRoles);
        req.setAttribute("info", requestInfo);
        req.getRequestDispatcher("/views/request/review.jsp").forward(req, resp);
    }
    
}
