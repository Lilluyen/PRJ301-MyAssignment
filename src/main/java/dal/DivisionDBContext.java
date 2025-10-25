/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Division;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author tdgg
 */
public class DivisionDBContext extends DBContext<Division>{

    @Override
    public ArrayList<Division> list() {
        ArrayList<Division> divisions = new ArrayList<>();
        try {
            String sql = """
                                     SELECT [departmentID]
                                           ,[name]
                                           ,[description]
                                       FROM [Division]""";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Division division = new Division();
                
                division.setId(rs.getInt("departmentID"));
                division.setDepartmentName(rs.getString("name"));
                
                divisions.add(division);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DivisionDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            closeConnection();
        }
        return divisions;
    }

    @Override
    public Division get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Division model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Division model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
