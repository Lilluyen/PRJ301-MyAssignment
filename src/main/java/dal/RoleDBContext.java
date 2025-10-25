/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.iam.Role;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.iam.Feature;

/**
 *
 * @author tdgg
 */
public class RoleDBContext extends DBContext<Role> {

    public ArrayList<Role> getRolesByUserIDNotDuplicate(int id){
        ArrayList<Role> roles = new ArrayList<>();
        try {
            String sql = """
                                     SELECT r.[roleID]
                                           ,[roleName]
                                           ,[desription]
                                       FROM [Role] as r JOIN [User_Role] ur ON ur.roleID = r.roleID
                                       WHERE ur.userID = ?""";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Role role = new Role();
                role.setId(rs.getInt("roleID"));
                role.setRoleName(rs.getString("roleName"));
                
                roles.add(role);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }finally{
            closeConnection();
        }
        return roles;
    }
    
    public ArrayList<Role> getRolesByUserID(int id) {
        ArrayList<Role> roles = new ArrayList<>();
        try {
            String sql = """
                                     SELECT r.roleID
                                     \t\t,r.roleName
                                     \t\t,f.featureID
                                     \t\t,f.[url]
                                     FROM [User] as u JOIN [User_Role] as ur ON u.userID = ur.userID
                                     JOIN [Role] as r ON r.roleID = ur.roleID
                                     JOIN [Role_Feature] rf ON rf.roleID = ur.roleID
                                     JOIN [Feature] as f ON f.featureID = rf.featureID
                                     WHERE u.userID = ?""";

            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            Role current = new Role();
            current.setId(-1);
            while (rs.next()) {
                int roleId = rs.getInt("roleID");
                if (roleId != current.getId()) {
                    current = new Role();
                    current.setId(roleId);
                    current.setRoleName(rs.getString("roleName"));
                }
                Feature feature = new Feature();
                feature.setId(rs.getInt("featureID"));
                feature.setUrl(rs.getString("url"));
                current.getFeatures().add(feature);
                roles.add(current);
            }
        } catch (SQLException ex) {
            Logger.getLogger(RoleDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return roles;
    }

    @Override
    public ArrayList<Role> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Role get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Role model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Role model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
