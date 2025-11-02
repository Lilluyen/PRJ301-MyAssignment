/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Agenda;
import model.Employee;

/**
 *
 * @author tdgg
 */
public class AgendaDBContext extends DBContext<Agenda>{

    public List<Agenda> getAgendaByDepartment(Date weekStart, int userID){
        List<Agenda> list = new ArrayList<>();
        try {
            String sql = """
                                     SELECT wa.*, e.fullName
                                             FROM WeeklyAgenda wa
                                             JOIN Employee e ON e.employeeID = wa.employeeID
                                             WHERE wa.weekStart = ?
                                               AND e.departmentID = (
                                                   SELECT departmentID
                                                   FROM Employee
                                                   WHERE employeeID = (
                                                       SELECT employeeID FROM Erollment WHERE userID = ?
                                                   )
                                               )
                                             ORDER BY e.fullName;""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setDate(1, weekStart);
            stm.setInt(2, userID);
            ResultSet rs = stm.executeQuery();
        while (rs.next()) {
            Agenda a = new Agenda();
            
            Employee e = new Employee();
            
            e.setId(rs.getInt("employeeID"));
            e.setFullName(rs.getString("fullName"));
            a.setEmployee(e);
            
            a.setMonday(rs.getString("monday"));
            a.setTuesday(rs.getString("tuesday"));
            a.setWednesday(rs.getString("wednesday"));
            a.setThursday(rs.getString("thursday"));
            a.setFriday(rs.getString("friday"));
            a.setSaturday(rs.getString("saturday"));
            a.setSunday(rs.getString("sunday"));
            list.add(a);
        }
        } catch (SQLException ex) {
            Logger.getLogger(AgendaDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            closeConnection();
        }
        return list;
    }
    
    
    @Override
    public ArrayList<Agenda> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Agenda get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Agenda model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Agenda model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
