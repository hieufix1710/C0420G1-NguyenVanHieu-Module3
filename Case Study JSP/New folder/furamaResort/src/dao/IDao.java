package dao;

import model.*;

import java.util.List;

public interface IDao {
    List<Customer> findAll();
    void edit(int id,Customer customer);
    boolean delete(int id);
    Customer findById(int id);
    boolean create (Customer customer);
    List<CustomerType> selectType();
    List<Service> showListService();
    void addNewService(Service service);
    List<TypeRent> showTypeRent();
    List<TypeService> showTypeService();
    List<Employee> showListEmployee();
    List<Position> showListPosition();
    List<Level> showListLevel();
    List<Department> showListDepartment();
    void createNewEmployee(Employee employee);
    Employee findEmployee(int id);
    void updateEmployee(Employee e);
    List<User> login();
}
