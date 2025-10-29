/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

import model.Division;
import model.Employee;
import model.RequestForLeave;
import model.iam.Role;

/**
 *
 * @author tdgg
 */
public class RequestForLeaveDBContext extends DBContext<RequestForLeave> {

    public ArrayList<RequestForLeave> getByEmployeeAndSubodiaries(int id) {
        ArrayList<RequestForLeave> requestForLeaves = new ArrayList<>();
        try {
            String sql = """
                                     With Subordinates as (
                                     Select e.employeeID
                                     ,e.fullName
                                     ,e.supervisorID
                                     ,0 as [level]
                                     From Employee e
                                     Where e.employeeID = ?
                                                      Union All
                                    Select e.employeeID
                                     ,e.fullName
                                     ,e.supervisorID
                                     ,s.[level] + 1
                                     From Employee e Join Subordinates s On e.supervisorID = s.employeeID
                                     )
                                     SELECT r.requestID
                                     ,r.createdBy
                                     ,s.fullName as createdName
                                     ,r.createdTime
                                     ,r.fromDate
                                     ,r.toDate
                                     ,r.reason
                                     ,r.[status]
                                     ,r.processedTime
                                     ,r.processedBy
                                     ,e.fullName as processName
                                     ,r.processNote
                                                      FROM Subordinates s Join RequestForLeave r ON s.employeeID = r.createdBy
                                     Left Join Employee e On e.employeeID = r.processedBy""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                RequestForLeave requestForLeave = new RequestForLeave();

                requestForLeave.setCreatedTime(rs.getTimestamp("createdTime"));
                requestForLeave.setFromDate(rs.getDate("fromDate"));
                requestForLeave.setToDate(rs.getDate("toDate"));
                requestForLeave.setId(rs.getInt("requestID"));
                requestForLeave.setNote(rs.getString("processNote"));
                requestForLeave.setReason(rs.getString("reason"));
                requestForLeave.setStatus(rs.getInt("status"));
                requestForLeave.setProcessedTime(rs.getTimestamp("processedTime"));

                Employee createdBy = new Employee();
                createdBy.setId(rs.getInt("createdBy"));
                createdBy.setFullName(rs.getString("createdName"));
                requestForLeave.setCreatedBy(createdBy);

                int processedById = rs.getInt("processedBy");
                if (processedById != 0) {
                    Employee processedBy = new Employee();
                    processedBy.setId(processedById);
                    processedBy.setFullName(rs.getString("processName"));
                    requestForLeave.setProcessedBy(processedBy);
                }
                requestForLeaves.add(requestForLeave);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RequestForLeaveDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        finally{
            closeConnection();
        }
        return requestForLeaves;
    }

    @Override
    public ArrayList<RequestForLeave> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public RequestForLeave get(int id) {
        try {
            String sql = """
                                     SELECT [requestID]
                                            ,[createdBy]
                                            ,e.fullName
                                            ,[createdTime]
                                            ,d.departmentID
                                            ,d.[name]
                                            ,r.[roleID]
                                            ,rl.roleName
                                            ,[fromDate]
                                            ,[toDate]
                                            ,[reason]
                                        FROM [RequestForLeave] r JOIN Employee e ON e.employeeID = r.createdBy
                                        JOIN Division d ON d.departmentID = e.departmentID
                                        JOIN [Role] rl ON r.roleID = rl.roleID
                                        WHERE r.requestID = ?""";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                RequestForLeave requestForLeave = new RequestForLeave();
                requestForLeave.setId(rs.getInt("requestID"));
                Employee createdBy = new Employee();
                createdBy.setId(rs.getInt("createdBy"));
                createdBy.setFullName(rs.getString("fullName"));
                
                Division dividion = new Division();
                dividion.setId(rs.getInt("departmentID"));
                dividion.setDepartmentName(rs.getString("name"));
                createdBy.setDivision(dividion);
                requestForLeave.setCreatedBy(createdBy);
                
                Role role = new Role();
                role.setId(rs.getInt("roleID"));
                role.setRoleName(rs.getString("roleName"));
                requestForLeave.setRole(role);
                
                requestForLeave.setFromDate(rs.getDate("fromDate"));
                requestForLeave.setToDate(rs.getDate("toDate"));
                requestForLeave.setReason(rs.getString("reason"));
                
                return requestForLeave;
            }
        } catch (SQLException ex) {
            Logger.getLogger(RequestForLeaveDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            closeConnection();
        }
        return null;
    }

    @Override
    public void insert(RequestForLeave model) {
        try {
            String sql = """
                                     INSERT INTO [RequestForLeave]
                                                ([createdBy]
                                                ,[roleID]
                                                ,[createdTime]
                                                ,[fromDate]
                                                ,[toDate]
                                                ,[reason]
                                                ,[status])
                                          VALUES
                                                (?
                                                ,?
                                                ,?
                                                ,?
                                                ,?
                                                ,?
                                                ,?)""";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            
            stm.setInt(1, model.getCreatedBy().getId());
            stm.setInt(2, model.getRole().getId());
            model.setCreatedTime(new java.util.Date());
            stm.setTimestamp(3, new java.sql.Timestamp(model.getCreatedTime().getTime()));
            stm.setDate(4, model.getFromDate());
            stm.setDate(5, model.getToDate());
            stm.setString(6, model.getReason().trim());
            stm.setInt(7, model.getStatus());
            
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RequestForLeaveDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            closeConnection();
        }
    }

    @Override
    public void update(RequestForLeave model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }


    public void updateReview(RequestForLeave model) {
        String sql = """
                                 UPDATE [RequestForLeave]
                                    SET [status] = ?
                                       ,[processedTime] = ?
                                       ,[processedBy] = ?
                                       ,[processNote] = ?
                                  WHERE requestID = ?""";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, model.getStatus());
            model.setProcessedTime(new java.util.Date());
            stm.setTimestamp(2, new java.sql.Timestamp(model.getProcessedTime().getTime()));
            stm.setInt(3, model.getProcessedBy().getId());
            stm.setString(4, model.getNote());
            stm.setInt(5, model.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(RequestForLeaveDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            closeConnection();
        }
    }



    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
