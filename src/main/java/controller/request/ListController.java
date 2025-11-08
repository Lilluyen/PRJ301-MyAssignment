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
import java.sql.Date;
import utility.DateValidator;
import utility.StatusValidator;

/**
 *
 * @author tdgg
 */
@WebServlet(urlPatterns = "/request/list")
public class ListController extends BaseAuthorizationController {

    protected void processRequest(HttpServletRequest req, HttpServletResponse resp, User user
                            , String name, String fromDateRaw, String toDateRaw, Integer status, String method) throws ServletException, IOException {


        Date fromDate = null;
        Date toDate = null;
        
        
        if(fromDateRaw != null && DateValidator.isValidSqlDate(fromDateRaw)){
            fromDate = Date.valueOf(fromDateRaw);
        }
        
        if(toDateRaw != null && DateValidator.isValidSqlDate(toDateRaw)){
            toDate = Date.valueOf(toDateRaw);
        }

        int pagesize = 5;
        String page = req.getParameter("page");
        page = (page == null) ? "1" : page;
        int pageindex = Integer.parseInt(page);

        RequestForLeaveDBContext db = new RequestForLeaveDBContext();
        ArrayList<RequestForLeave> listRequestForLeaves = db.getByEmployeeAndSubodiaries(user.getId(), pageindex, pagesize,
                name, fromDate, toDate, status);

        db = new RequestForLeaveDBContext();
        int count = db.countEmployeeAndSubonaires(user.getId(), name, fromDate, toDate, status);

        int totalpage = (count % pagesize == 0) ? (count / pagesize) : (count / pagesize) + 1;

        System.out.println(totalpage);
        req.setAttribute("totalpage", totalpage);
        req.setAttribute("pageindex", pageindex);
        req.setAttribute("action", "list");
        req.setAttribute("method", "get");
        req.setAttribute("nameFilter", name);
        req.setAttribute("fromDateFilter", fromDate);
        req.setAttribute("toDateFilter", toDate);
        req.setAttribute("statusFilter", status);
        req.setAttribute("requestList", listRequestForLeaves);
        req.getRequestDispatcher("/views/request/list.jsp").forward(req, resp);
    }

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        String name = req.getParameter("name");
        String fromDateRaw = req.getParameter("fromDate");
        String toDateRaw = req.getParameter("toDate");
        String statusRaw = req.getParameter("status");
        Integer status = null;
        if(StatusValidator.isValid(statusRaw)){
            status = Integer.parseInt(statusRaw);
            if(status >= 3){
                status = null;
            }
        }

        
        processRequest(req, resp, user, name, fromDateRaw, toDateRaw, status, "get");
    }

}
