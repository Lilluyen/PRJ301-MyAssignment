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
import java.util.ArrayList;
import model.RequestForLeave;
import model.iam.User;

/**
 *
 * @author tdgg
 */
@WebServlet(urlPatterns = "/request/modify")
public class ModifyController extends BaseAuthorizationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        processRequest(req, resp, user);
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        processRequest(req, resp, user);
    }

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        int userId = user.getId();
        
        int pagesize = 5;
        String page = req.getParameter("page");
        page = (page == null) ? "1" : page;
        int pageindex = Integer.parseInt(page);

        RequestForLeaveDBContext leaveDB = new RequestForLeaveDBContext();
        ArrayList<RequestForLeave> leavesRequestList = leaveDB.getByEmployee(userId, pageindex, pagesize);
        
        leaveDB = new RequestForLeaveDBContext();
        int count = leaveDB.countOwn(user.getId());

        int totalpage = (count % pagesize == 0) ? (count / pagesize) : (count / pagesize) + 1;

        req.setAttribute("totalpage", totalpage);
        req.setAttribute("pageindex", pageindex);
        req.setAttribute("action", "modify");
        req.setAttribute("method", "get");
        req.setAttribute("requestList", leavesRequestList);
        req.getRequestDispatcher("/views/request/list_edit.jsp").forward(req, resp);
    }

}
