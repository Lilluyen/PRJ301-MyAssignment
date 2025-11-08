/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.division;

import controller.iam.BaseAuthorizationController;
import dal.AgendaDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import model.Agenda;
import model.iam.User;
import utility.WeekHelper;

/**
 *
 * @author tdgg
 */
@WebServlet(urlPatterns = "/division/agenda")
public class AgendaController extends BaseAuthorizationController {

    @Override
    protected void processPost(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    protected void processGet(HttpServletRequest req, HttpServletResponse resp, User user) throws ServletException, IOException {
        int userID = user.getId();
        int offset = 0;
        try {
            offset = Integer.parseInt(req.getParameter("offset"));
        } catch (NumberFormatException e) {
            offset = 0;
        }

        String weekParam = req.getParameter("week");
        if ("next".equals(weekParam)) {
            offset++;
        } else if ("prev".equals(weekParam)) {
            offset--;
        }

        int pagesize = 5;
        String page = req.getParameter("page");
        page = (page == null) ? "1" : page;
        int pageindex = Integer.parseInt(page);

        Date weekStart = WeekHelper.getWeekStart(offset);
        Date weekEnd = WeekHelper.getWeekEnd(offset);

        AgendaDBContext dao = new AgendaDBContext();
        List<Agenda> agendas = dao.getAgendaByDepartment(weekStart, userID, pageindex, pagesize);

        dao = new AgendaDBContext();
        int count = dao.count(weekStart.toString(), userID);

        int totalpage = (count % pagesize == 0) ? (count / pagesize) : (count / pagesize) + 1;

        req.setAttribute("totalpage", totalpage);
        req.setAttribute("pageindex", pageindex);
        req.setAttribute("action", "agenda");
        req.setAttribute("method", "get");
        req.setAttribute("offset", offset);
        req.setAttribute("weekStart", weekStart);
        req.setAttribute("weekEnd", weekEnd);
        req.setAttribute("agendas", agendas);
        req.getRequestDispatcher("/views/division/agenda.jsp").forward(req, resp);
    }

}
