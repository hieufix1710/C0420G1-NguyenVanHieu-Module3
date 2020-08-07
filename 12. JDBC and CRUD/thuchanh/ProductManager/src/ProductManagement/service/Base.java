package ProductManagement.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Base {
    private Connection connection;
    private String jdbcURL = "jdbc:mysql://localhost:3306/product_manager";
    private String jdbcUsername = "root";
    private String jdbcPassword = "171019";

    public Base() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            this.connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
    public Connection getConnection() {
        return connection;
    }
}
