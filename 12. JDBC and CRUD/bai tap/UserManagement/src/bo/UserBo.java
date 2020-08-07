package bo;

import dao.IUserDAO;
import dao.UserDAO;
import model.User;

import java.util.List;

public class UserBo implements IUserBo {
    IUserDAO userDAO=new UserDAO();
    @Override
    public void insertUser(User user) {
        userDAO.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userDAO.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userDAO.selectAllUsers();
    }

    @Override
    public boolean deleteUser(int id) {
        return userDAO.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) {
        return userDAO.updateUser(user);
    }

    @Override
    public List<User> findByCountry(String country) {
        return userDAO.findByCountry(country);
    }



    @Override
    public List<User> orderByName() {
        return userDAO.orderByName();
    }


}
