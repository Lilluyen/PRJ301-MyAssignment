/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.request;

import controller.iam.BaseAuthorizationController;
import dal.DivisionDBContext;
import dal.RequestForLeaveDBContext;
import dal.RoleDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import model.Division;
import model.RequestForLeave;
import model.iam.Role;
import model.iam.User;

/**
 *
 * @author tdgg
 */
@WebServlet(urlPatterns = "/request/create")
public class CreateController extends BaseAuthorizationController {
    
    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        RequestForLeave requestForLeave = new RequestForLeave();
        
        requestForLeave.setCreatedBy(user.getEmployee());
        requestForLeave.setFromDate(Date.valueOf(req.getParameter("fromDate")));
        requestForLeave.setToDate(Date.valueOf(req.getParameter("toDate")));
        requestForLeave.setReason(req.getParameter("reason"));
        requestForLeave.setStatus(0);
        
        RequestForLeaveDBContext db = new RequestForLeaveDBContext();
        db.insert(requestForLeave);
        resp.sendRedirect(req.getContextPath() + "/request/list");
    }
    
    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        DivisionDBContext divisionDB = new DivisionDBContext();
        RoleDBContext roleDB = new RoleDBContext();
        ArrayList<Division> listDivisions = divisionDB.list();
        ArrayList<Role> listRoles = roleDB.getRolesByUserIDNotDuplicate(user.getId());
        req.setAttribute("divisions", listDivisions);
        req.setAttribute("roles", listRoles);
        req.getRequestDispatcher("/views/request/create.jsp").forward(req, resp);
    }
    
}
