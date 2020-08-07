package dao;

import model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {

    void insertUser(User user);

    User selectUser(int id);

    List<User> selectAllUsers();

    boolean deleteUser(int id);

    boolean updateUser(User user);

    List<User> findByCountry(String country);
    List<User> orderByName();


}
