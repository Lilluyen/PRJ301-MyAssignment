package dal;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public abstract class DBContext <T extends model.BaseModel> {
    protected Connection connection;

    public DBContext() {
        
        String user = "lilluyen";
        String password = "123";
        String url = "jdbc:sqlserver://MSI:1433;databaseName=AssignmentPRJ301;encrypt=true;trustServerCertificate=true";
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = java.sql.DriverManager.getConnection(url, user, password);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public abstract ArrayList<T> list();
    public abstract T get(int id);
    public abstract void insert(T model);   
    public abstract void update(T model);
    public abstract void delete(int id);

}
