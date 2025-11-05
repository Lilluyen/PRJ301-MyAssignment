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
@WebServlet(urlPatterns = "/request/list")
public class ListController extends BaseAuthorizationController {

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {

        int pagesize = 5;
        String page = req.getParameter("page");
        page = (page == null) ? "1" : page;
        int pageindex = Integer.parseInt(page);

        RequestForLeaveDBContext db = new RequestForLeaveDBContext();
        ArrayList<RequestForLeave> listRequestForLeaves = db.getByEmployeeAndSubodiaries(user.getId(), pageindex, pagesize);

        db = new RequestForLeaveDBContext();
        int count = db.countEmployeeAndSubonaires(user.getId());

        int totalpage = (count % pagesize == 0) ? (count / pagesize) : (count / pagesize) + 1;

        req.setAttribute("totalpage", totalpage);
        req.setAttribute("pageindex", pageindex);
        req.setAttribute("action", "list");
        req.setAttribute("method", "get");
        req.setAttribute("requestList", listRequestForLeaves);
        req.getRequestDispatcher("/views/request/list.jsp").forward(req, resp);
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
