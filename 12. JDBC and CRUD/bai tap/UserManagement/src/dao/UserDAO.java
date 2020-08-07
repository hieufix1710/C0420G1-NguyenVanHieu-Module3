package dao;

import model.User;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements IUserDAO {
    BaseDAO baseDAO=new BaseDAO();
    private static final String INSERT_USERS_SQL = "INSERT INTO users" + "  (name, email, country) VALUES " +
            " (?, ?, ?);";

    private static final String SELECT_USER_BY_ID = "select id,name,email,country from users where id =?";
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String UPDATE_USERS_SQL = "update users set name = ?,email= ?, country =? where id = ?;";

    private static final  String FIND_BY_COUNTRY_SQL="{call findByCountry(?)}";
    private static final  String ORDER_BY_NAME="{call orderByName()}";




    @Override
    public void insertUser(User user)  {
        try {
            PreparedStatement preparedStatement=this.baseDAO.getConnection().prepareStatement(INSERT_USERS_SQL);
            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getCountry());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public User selectUser(int id) {
        PreparedStatement preparedStatement= null;
        User user=null;
        try {
            preparedStatement = this.baseDAO.getConnection().prepareStatement(SELECT_USER_BY_ID);
            preparedStatement.setInt(1,id);

            ResultSet resultSet=preparedStatement.executeQuery();


            while (resultSet.next()){
                String name=resultSet.getString("name");
                String email=resultSet.getString("email");
                String country=resultSet.getString("country");
                user=new User(id,name,email,country);



            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;


    }

    @Override
    public List<User> selectAllUsers() {
        List<User> userList=new ArrayList<>();
        try {
            PreparedStatement preparedStatement=this.baseDAO.getConnection().prepareStatement(SELECT_ALL_USERS);
            ResultSet resultSet=preparedStatement.executeQuery();
            User user;
            while (resultSet.next()){
                int id=resultSet.getInt("id");
                String name=resultSet.getString("name");
                String email=resultSet.getString("email");
                String country=resultSet.getString("country");
                user=new User(id,name,email,country);
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public boolean deleteUser(int id)  {
        boolean rowDelete =false;
        try {
            PreparedStatement preparedStatement=this.baseDAO.getConnection().prepareStatement(DELETE_USERS_SQL);
            preparedStatement.setInt(1,id);
            rowDelete=preparedStatement.executeUpdate()>0;
        }catch (SQLException e){
            e.getStackTrace();
        }
        return rowDelete;

    }

    @Override
    public boolean updateUser(User user)  {
        boolean rowUpdated=false;
        try {
            PreparedStatement preparedStatement=this.baseDAO.getConnection().prepareStatement(UPDATE_USERS_SQL);
            preparedStatement.setInt(4,user.getId());
            preparedStatement.setString(1,user.getName());
            preparedStatement.setString(2,user.getEmail());
            preparedStatement.setString(3,user.getCountry());
            rowUpdated=preparedStatement.executeUpdate()>0;
        }catch (SQLException e){
            e.getStackTrace();
        }

        return rowUpdated;
    }

    @Override
    public List<User> findByCountry(String country) {
        List<User> list=new ArrayList<>();
        try {
            CallableStatement callableStatement=this.baseDAO.getConnection().prepareCall(FIND_BY_COUNTRY_SQL);
            callableStatement.setString(1,country);

            ResultSet resultSet=callableStatement.executeQuery();
            User user=null;

            while (resultSet.next()){
                int id=resultSet.getInt("id");
                String name=resultSet.getString("name");
                String email=resultSet.getString("email");
                String resultCountry=resultSet.getString("country");
                user=new User(id,name,email,resultCountry);
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public List<User> orderByName() {
        List<User> userList=new ArrayList<>();
        try {
            CallableStatement callableStatement=this.baseDAO.getConnection().prepareCall(ORDER_BY_NAME);
            ResultSet resultSet=callableStatement.executeQuery();
            User user=null;
            while (resultSet.next()){
                int id=resultSet.getInt("id");
                String name=resultSet.getString("name");
                String email=resultSet.getString("email");
                String country=resultSet.getString("country");
                user=new User(id,name,email,country);
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

//    private void printSQLException(SQLException ex) {
//        for (Throwable e : ex) {
//            if (e instanceof SQLException) {
//                e.printStackTrace(System.err);
//                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
//                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
//                System.err.println("Message: " + e.getMessage());
//                Throwable t = ex.getCause();
//                while (t != null) {
//                    System.out.println("Cause: " + t);
//                    t = t.getCause();
//                }
//            }
//        }
//    }


}
