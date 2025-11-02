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
@WebServlet(urlPatterns = "/request/edit")
public class EditController extends BaseAuthorizationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        RequestForLeave requestForLeave = new RequestForLeave();
        
        int requestId = Integer.parseInt(req.getParameter("id"));
        requestForLeave.setId(requestId);
        
        Role role = new Role();
        role.setId(Integer.parseInt(req.getParameter("role")));
        requestForLeave.setRole(role);
        requestForLeave.setFromDate(Date.valueOf(req.getParameter("fromDate")));
        requestForLeave.setToDate(Date.valueOf(req.getParameter("toDate")));
        requestForLeave.setReason(req.getParameter("reason"));
        requestForLeave.setStatus(0);
        
        RequestForLeaveDBContext db = new RequestForLeaveDBContext();
        db.update(requestForLeave);
        resp.sendRedirect(req.getContextPath() + "/request/modify");
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        int requestId = Integer.parseInt(req.getParameter("id"));
        RequestForLeaveDBContext reqForLeaveDB = new RequestForLeaveDBContext();
        RoleDBContext roleDB = new RoleDBContext();
        DivisionDBContext divisionDB = new DivisionDBContext();
        
        
        ArrayList<Role> roles = roleDB.getRolesByUserIDNotDuplicate(user.getId());
        ArrayList<Division> divisions = divisionDB.list();
        RequestForLeave requestInfo = reqForLeaveDB.get(requestId);
        
        req.setAttribute("requestInfo", requestInfo);
        req.setAttribute("roles", roles);
        req.setAttribute("divisions", divisions);
        
        req.getRequestDispatcher("/views/request/edit.jsp").forward(req, resp);
    }

}
