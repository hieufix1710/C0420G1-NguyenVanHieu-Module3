package bo;

import dao.Dao;
import dao.IDao;
import model.*;

import java.util.List;

public class Bo implements IBo {
    IDao dao=new Dao();
    @Override
    public List<Customer> findAll() {
        return dao.findAll();
    }

    @Override
    public void edit(int id,Customer customer) {
          dao.edit(id,customer);
    }

    @Override
    public boolean delete(int id) {
        return dao.delete(id);
    }

    @Override
    public Customer findById(int id) {
        return dao.findById(id);
    }

    @Override
    public boolean create(Customer customer) {
        return dao.create(customer);
    }

    @Override
    public List<CustomerType> selectType() {
        return this.dao.selectType();
    }

    @Override
    public List<Service> showListService() {
        return dao.showListService();
    }

    @Override
    public void addNewService(Service service) {
        dao.addNewService(service);
    }

    @Override
    public List<TypeRent> showTypeRent() {
        return dao.showTypeRent();
    }

    @Override
    public List<TypeService> showTypeService() {
        return dao.showTypeService();
    }

    @Override
    public List<Employee> showListEmployee() {
        return dao.showListEmployee();
    }

    @Override
    public List<Position> showListPosition() {
        return dao.showListPosition();
    }

    @Override
    public List<Level> showListLevel() {
        return dao.showListLevel();
    }

    @Override
    public List<Department> showListDepartment() {
        return dao.showListDepartment();
    }

    @Override
    public void createNewEmployee(Employee employee) {
        dao.createNewEmployee(employee);
    }

    @Override
    public Employee findEmployee(int id) {
        return  dao.findEmployee(id);
    }

    @Override
    public void updateEmployee(Employee e) {
        dao.updateEmployee(e);
    }

    @Override
    public List<User> login() {
        return dao.login();
    }
}
