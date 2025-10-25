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
import model.iam.User;

/**
 *
 * @author tdgg
 */
public class UserDBContext extends DBContext<User>{
    
    public User get(String username, String password){
        try {
            String sql = """
                                     SELECT u.[userID]
                                           ,[userName]
                                           ,[displayname]
                                     \t    ,e.employeeID
                                     \t    ,e.fullName
                                     \t    ,e.dateOfBirth
                                     \t    ,e.gender
                                           ,d.departmentID
                                           ,d.[name]
                                     FROM [User] as u JOIN [Erollment] as er ON u.userID = er.userID
                                       JOIN [Employee] as e ON e.employeeID = er.employeeID
                                       JOIN [Division] as d ON d.departmentID = e.departmentID
                                     WHERE [userName] = ? AND [password] = ?""";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, username);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                User user = new User();
                user.setId(rs.getInt("userID"));
                user.setUserName(rs.getString("userName"));
                user.setDisplayname(rs.getString("displayname"));
                
                Employee employee = new Employee();
                employee.setId(rs.getInt("employeeID"));
                employee.setFullName(rs.getString("fullName"));
                employee.setDob(rs.getDate("dateOfBirth"));
                employee.setGender(rs.getBoolean("gender"));
                
                Division division = new Division();
                division.setId(rs.getInt("departmentID"));
                division.setDepartmentName(rs.getString("name"));
                employee.setDivision(division);
                
                user.setEmployee(employee);
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            closeConnection();
        }
        return null;
    }

    @Override
    public ArrayList<User> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public User get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(User model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(User model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
