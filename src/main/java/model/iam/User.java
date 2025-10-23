package model.iam;

import java.util.ArrayList;
import model.BaseModel;
import model.Employee;

public class User extends BaseModel {

    private String userName;
    private String password;
    private String displayname;
    private Employee employee;
    private ArrayList<Role> roles = new ArrayList<>();

    public String getUserName() {
        return userName;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public ArrayList<Role> getRoles() {
        return roles;
    }

    public void setRoles(ArrayList<Role> roles) {
        this.roles = roles;
    }


    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getDisplayname() {
        return displayname;
    }

    public void setDisplayname(String displayname) {
        this.displayname = displayname;
    }

}
