/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.request;

import controller.iam.BaseAuthorizationController;
import dal.RequestForLeaveDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.RequestForLeave;
import model.iam.User;

/**
 *
 * @author tdgg
 */
@WebServlet(urlPatterns = "/request/review")
public class ReviewController extends BaseAuthorizationController {
    
    protected void processRequest(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        int requestId = Integer.parseInt(req.getParameter("id"));
        RequestForLeaveDBContext reqForLeaveDB = new RequestForLeaveDBContext();
        
        
        RequestForLeave requestInfo = reqForLeaveDB.get(requestId);
        
        
        if(requestInfo.getCreatedBy().getId() == user.getId()){
            req.setAttribute("requestInfo", requestInfo);
            req.getRequestDispatcher("/request/employee-review").forward(req, resp);
        }else{
            req.setAttribute("requestInfo", requestInfo);
            req.getRequestDispatcher("/request/supervisor-review").forward(req, resp);
        }
        
    }
    
    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        processRequest(req, resp, user);
    }
    
    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        processRequest(req, resp, user);
    }
    
}
