/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.request;

import java.io.IOException;
import java.util.ArrayList;

import controller.iam.BaseAuthorizationController;
import dal.DivisionDBContext;
import dal.RequestForLeaveDBContext;
import dal.RoleDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Division;
import model.Employee;
import model.RequestForLeave;
import model.iam.Role;
import model.iam.User;

/**
 *
 * @author tdgg
 */
@WebServlet(urlPatterns = "/request/supervisor-review")
public class SupervisorReviewController extends BaseAuthorizationController{

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        int requestID = Integer.parseInt(req.getParameter("id"));
        String action = req.getParameter("action");
        String note = req.getParameter("note");

        RequestForLeaveDBContext requestDB = new RequestForLeaveDBContext();

        RequestForLeave requestForLeave = new RequestForLeave();
        requestForLeave.setId(requestID);
        requestForLeave.setNote(note);
        requestForLeave.setStatus(action.equals("Approve") ? 1 : 2);

        Employee   processedBy = new Employee();
        processedBy.setId(user.getId());
        requestForLeave.setProcessedBy(processedBy);

        requestDB.updateReview(requestForLeave);
        resp.sendRedirect("list");

    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        DivisionDBContext divisionDB = new DivisionDBContext();
        RoleDBContext roleDB = new RoleDBContext();
        
        
        RequestForLeave requestInfo = (RequestForLeave)req.getAttribute("requestInfo");
        ArrayList<Division> listDivisions = divisionDB.list();
        ArrayList<Role> listRoles = roleDB.getRolesByUserIDNotDuplicate(requestInfo.getCreatedBy().getId());
        
        req.setAttribute("divisions", listDivisions);
        req.setAttribute("roles", listRoles);
        req.setAttribute("info", requestInfo);
        req.getRequestDispatcher("/views/request/review.jsp").forward(req, resp);
    }

    

    
    
}
