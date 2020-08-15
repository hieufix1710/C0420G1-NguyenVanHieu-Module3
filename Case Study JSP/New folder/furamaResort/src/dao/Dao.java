package dao;

import javafx.geometry.Pos;
import model.*;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Dao implements IDao {
       private    BaseDAO baseDAO=new BaseDAO();
      private     Connection connection=this.baseDAO.getConnection();
    @Override
    public List<Customer> findAll() {
        List<Customer> customerList=new ArrayList<>();
        Customer customer=null;
        try {
            PreparedStatement preparedStatement=connection.prepareStatement("select IDkhachhang,IDloaikhach,hoten,ngaysinh,CMND,sodienthoai,email,diachi from khachhang");
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int idCustomer=resultSet.getInt("IDkhachhang");
                int idTypeCustomer=resultSet.getInt("IDloaikhach");
                String name=resultSet.getString("hoten");
                String birthday=resultSet.getString("ngaysinh");
                String CMND=resultSet.getString("CMND");
                String phone=resultSet.getString("sodienthoai");
                String email=resultSet.getString("email");
                String address=resultSet.getString("diachi");
                customer=new Customer(idCustomer,idTypeCustomer,name,birthday,CMND,phone,email,address);
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  customerList;
    }

    @Override
    public void edit(int id,Customer customer) {
        try {
            CallableStatement callableStatement=connection.prepareCall("{call updateInfor(?,?,?,?,?,?,?,?)}");
            callableStatement.setInt(1,id);
            callableStatement.setString(2,customer.getName());
            callableStatement.setString(3,customer.getBirthday());
            callableStatement.setString(4,customer.getCMND());
            callableStatement.setString(5,customer.getPhone());
            callableStatement.setString(6,customer.getEmail());
            callableStatement.setString(7,customer.getAddress());
            callableStatement.setInt(8,customer.getTypeId());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean delete(int id) {
        try {
            CallableStatement callableStatement=connection.prepareCall("{call deleteCustomer(?)}");
            callableStatement.setInt(1,id);
            callableStatement.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return false;
    }

    @Override
    public Customer findById(int id) {
        Customer customer=null;
        try {
            PreparedStatement preparedStatement=connection.prepareStatement("select IDkhachhang,IDloaikhach,hoten,ngaysinh,CMND,sodienthoai,email,diachi from khachhang\n" +
                    "" +
                    "where IDkhachhang=?");
            preparedStatement.setInt(1,id);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int idCustomer=resultSet.getInt("IDkhachhang");
                int idTypeCustomer=resultSet.getInt("IDloaikhach");
                String name=resultSet.getString("hoten");
                String birthday=resultSet.getString("ngaysinh");
                String CMND=resultSet.getString("CMND");
                String phone=resultSet.getString("sodienthoai");
                String email=resultSet.getString("email");
                String address=resultSet.getString("diachi");
                customer=new Customer(idCustomer,idTypeCustomer,name,birthday,CMND,phone,email,address);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    @Override
    public boolean create(Customer customer) {

        try {
            PreparedStatement preparedStatement=connection.prepareStatement("insert into khachhang (IDkhachhang, IDloaikhach,hoten,ngaysinh,CMND,sodienthoai,email,diachi)\n" +
                    "values (?,?,?,?,?,?,?,?)");
            preparedStatement.setInt(1,customer.getId());
            preparedStatement.setInt(2,customer.getTypeId());
            preparedStatement.setString(3,customer.getName());
            preparedStatement.setString(4,customer.getBirthday());
            preparedStatement.setString(5,customer.getCMND());
            preparedStatement.setString(6,customer.getPhone());
            preparedStatement.setString(7,customer.getEmail());
            preparedStatement.setString(8,customer.getAddress());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }

    @Override
    public List<CustomerType> selectType() {
        List<CustomerType> list=new ArrayList<>();
        CustomerType customerType=null;
        try {
            PreparedStatement preparedStatement=connection.prepareStatement("select IDloaikhach,tenloaikhach from loaikhach");
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("IDloaikhach");
                String name=resultSet.getString("tenloaikhach");
                customerType=new CustomerType(id,name);
                list.add(customerType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;

    }

    @Override
    public List<Service> showListService() {
        Service service=null;
        List<Service> serviceList=new ArrayList<>();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement("select IDdichvu,tendichvu,dientich,sotang,songuoitoida,chiphithue,IDkieuthue,IDloaidichvu,trangthai from dichvu;");
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("IDdichvu");
                String name=resultSet.getString("tendichvu");
                double area=resultSet.getDouble("dientich");
                int numberFloor=resultSet.getInt("sotang");
                int maxPeople=resultSet.getInt("songuoitoida");
                double feeRent=resultSet.getDouble("chiphithue");
                int idTypeRent=resultSet.getInt("IDkieuthue");
                int idTypeService=resultSet.getInt("IDloaidichvu");
                String status=resultSet.getString("trangthai");
                service=new Service(id,name,area,numberFloor,maxPeople,feeRent,idTypeRent,idTypeService,status);
                serviceList.add(service);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return serviceList;
    }

    @Override
    public void addNewService(Service service) {
        try {
            CallableStatement callableStatement=connection.prepareCall("{call addNewService(?,?,?,?,?,?,?,?,?)}");
            callableStatement.setInt(1,service.getId());
            callableStatement.setString(2,service.getName());
            callableStatement.setDouble(3,service.getArea());
            callableStatement.setInt(4,service.getNumberOfFloors());
            callableStatement.setInt(5,service.getMaxPeople());
            callableStatement.setDouble(6,service.getFeeRent());
            callableStatement.setInt(7,service.getIdTypeRent());
            callableStatement.setInt(8,service.getIdTypeService());
            callableStatement.setString(9,service.getStatus());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public List<TypeRent> showTypeRent() {
        List<TypeRent> typeRentList=new ArrayList<>();
        TypeRent typeRent=null;
        try {
            PreparedStatement preparedStatement=connection.prepareStatement("select IDkieuthue,tenkieuthue,gia from kieuthue");
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("IDkieuthue");
                String name=resultSet.getString("tenkieuthue");
                double price=resultSet.getDouble("gia");
                typeRent=new TypeRent(id,name,price);
                typeRentList.add(typeRent);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  typeRentList;
    }

    @Override
    public List<TypeService> showTypeService() {
        List<TypeService> typeServiceList=new ArrayList<>();
        TypeService typeService=null;
        try {
            PreparedStatement preparedStatement=connection.prepareStatement("select IDloaidichvu,tenloaidichvu from loaidichvu");
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("IDloaidichvu");
                String name=resultSet.getString("tenloaidichvu");
                typeService=new TypeService(id,name);
                typeServiceList.add(typeService);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  typeServiceList;
    }

    @Override
    public List<Employee> showListEmployee() {
         List <Employee> employeeList=new ArrayList<>();
         Employee employee=null;
        try {
            CallableStatement callableStatement=connection.prepareCall("{call showListEmployee()}");
            ResultSet resultSet=callableStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("IDnhanvien");
                String name=resultSet.getString("hoten");
                int idPosition=resultSet.getInt("IDvitri");
                int idLevel=resultSet.getInt("IDtrinhdo");
                int idDepartment=resultSet.getInt("IDbophan");
                String birthday=resultSet.getString("ngaysinh");
                int CMND=resultSet.getInt("CMND");
                double salary=resultSet.getDouble("luong");
                String phone=resultSet.getString("sodienthoai");
                String email=resultSet.getString("email");
                String address=resultSet.getString("diachi");
                employee=new Employee(id,name,idPosition,idLevel,idDepartment,birthday,CMND,salary,phone,email,address);
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return  employeeList;

    }

    @Override
    public List<Position> showListPosition() {
        List<Position> positionList=new ArrayList<>();
        Position position=null;
        try {
            PreparedStatement preparedStatement=connection.prepareStatement("select * from vitri");
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("IDvitri");
                String name=resultSet.getString("tenvitri");
                position=new Position(id,name);
                positionList.add(position);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return positionList;
    }

    @Override
    public List<Level> showListLevel() {
        List<Level> levelList=new ArrayList<>();
        Level level=null;
        try {
            PreparedStatement preparedStatement=connection.prepareStatement("select * from trinhdo");
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("IDtrinhdo");
                String name=resultSet.getString("trinhdo");
                level=new Level(id,name);
                levelList.add(level);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return levelList;
    }

    @Override
    public List<Department> showListDepartment() {
        List<Department> departmentList=new ArrayList<>();
        Department department=null;
        try {
            PreparedStatement preparedStatement=connection.prepareStatement("select * from bophan");
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("IDbophan");
                String name=resultSet.getString("tenbophan");
                department=new Department(id,name);
                departmentList.add(department);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return departmentList;
    }

    @Override
    public void createNewEmployee(Employee employee) {
        try {
            PreparedStatement preparedStatement=connection.prepareStatement("insert into nhanvien (IDnhanvien,hoten,IDvitri,IDtrinhdo,IDbophan,ngaysinh,CMND,luong,sodienthoai,email,diachi)" +
                    "values (?,?,?,?,?,?,?,?,?,?,?) ");
            preparedStatement.setInt(1,employee.getId());
            preparedStatement.setString(2,employee.getName());
            preparedStatement.setInt(3,employee.getIdPosition());
            preparedStatement.setInt(4,employee.getIdLevel());
            preparedStatement.setInt(5,employee.getIdDepartment());
            preparedStatement.setString(6,employee.getBirthday());
            preparedStatement.setInt(7,employee.getCMND());
            preparedStatement.setDouble(8,employee.getSalary());
            preparedStatement.setString(9,employee.getPhone());
            preparedStatement.setString(10,employee.getEmail());
            preparedStatement.setString(11,employee.getAddress());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Employee findEmployee(int id) {
        Employee employee=null;
        PreparedStatement preparedStatement= null;
        try {
            preparedStatement = connection.prepareStatement("select  * from nhanvien where IDnhanvien=?");
            preparedStatement.setInt(1,id);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                String name=resultSet.getString("hoten");
                int idPosition=resultSet.getInt("IDvitri");
                int idLevel=resultSet.getInt("IDtrinhdo");
                int idDepartment=resultSet.getInt("IDbophan");
                String birthday=resultSet.getString("ngaysinh");
                int CMND=resultSet.getInt("CMND");
                double salary=resultSet.getDouble("luong");
                String phone=resultSet.getString("sodienthoai");
                String email=resultSet.getString("email");
                String address=resultSet.getString("diachi");
                employee=new Employee(id,name,idPosition,idLevel,idDepartment,birthday,CMND,salary,phone,email,address);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;

    }

    @Override
    public void updateEmployee(Employee employee) {
        try {
            CallableStatement callableStatement=connection.prepareCall("{call updateEmployee(?,?,?,?,?,?,?,?,?,?,?)}");
            callableStatement.setInt(1,employee.getId());
            callableStatement.setString(2,employee.getName());
            callableStatement.setInt(3,employee.getIdPosition());
            callableStatement.setInt(4,employee.getIdLevel());
            callableStatement.setInt(5,employee.getIdDepartment());
            callableStatement.setString(6,employee.getBirthday());
            callableStatement.setInt(7,employee.getCMND());
            callableStatement.setDouble(8,employee.getSalary());
            callableStatement.setString(9,employee.getPhone());
            callableStatement.setString(10,employee.getEmail());
            callableStatement.setString(11,employee.getAddress());
            callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<User> login() {
        List<User> userList=new ArrayList<>();
        User user=null;
        try {
            PreparedStatement preparedStatement=connection.prepareStatement("select id,name,password,IDnhanvien from user");
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("id");
                String name=resultSet.getString("name");
                String password=resultSet.getString("password");
                int idEmployee=resultSet.getInt("IDnhanvien");
                user=new User(id,name,password,idEmployee);
                userList.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    @Override
    public void deleteEmployee(int id) {
        try {
            CallableStatement callableStatement=connection.prepareCall("{call deleteEmployee(?)}");
            callableStatement.setInt(1,id);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
