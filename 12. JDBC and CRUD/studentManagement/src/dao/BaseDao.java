package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class BaseDao {
        private Connection connection;
        private String jdbcURL = "jdbc:mysql://localhost:3306/codegym_management";
        private String jdbcUsername = "root";
        private String jdbcPassword = "171019";

        public BaseDao() {
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
