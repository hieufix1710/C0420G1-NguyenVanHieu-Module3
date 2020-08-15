package controller;

import bo.Bo;
import bo.IBo;
import dao.Dao;
import dao.IDao;
import model.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Servlet", urlPatterns = "/furama_resort")
public class Servlet extends HttpServlet {
    IBo bo = new Bo();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String activity = request.getParameter("activity");
        if (activity == null) {
            activity = "";
        }
        switch (activity) {
            case "createNewCustomer":
                createNewCustomer(request, response);
                break;
            case "update":
                update(request, response);
                break;
            case "addNewService":
                addNewService(request, response);
                break;
            case "createNewEmployee":
                createNewEmployee(request, response);
                break;
            case "updateEmployee":
                updateEmployee(request, response);
                break;
            case "login":
                login(request, response);
                break;
            default:
                break;
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String activity = request.getParameter("activity");
        if (activity == null) {
            activity = "";
        }
        switch (activity) {
            case "view":
                view(request, response);
                break;
            case "edit":
                showEdit(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "showListCustomer":
                showList(request, response);
                break;
            case "showListEmployee":
                showListEmployee(request, response);
                break;
            case "about":
                about(request, response);
                break;
            case "deleteEmployee":
                deleteEmployee(request, response);
                break;

            case "editEmployee":
                showEditEmployee(request, response);
                break;

            default:

                break;
        }
    }

    public void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = this.bo.findAll();
        List<CustomerType> customerTypeList = this.bo.selectType();
        List<TypeService> typeServiceList = this.bo.showTypeService();
        List<TypeRent> typeRentList = this.bo.showTypeRent();
        request.setAttribute("customers", customerList);
        request.setAttribute("customerType", customerTypeList);
        request.setAttribute("typeService", typeServiceList);
        request.setAttribute("typeRent", typeRentList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("furama/tableCustomer.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void createNewCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idCustomer"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String CMND = request.getParameter("CMND");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int typeId = Integer.parseInt(request.getParameter("customerType"));
        this.bo.create(new Customer(id, typeId, name, birthday, CMND, phone, email, address));
        showList(request, response);
    }

    public void view(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.bo.findById(id);
        List<CustomerType> customerType = this.bo.selectType();
        request.setAttribute("customer", customer);
        request.setAttribute("customerType", customerType);
        RequestDispatcher dispatcher = request.getRequestDispatcher("furama/view.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void showEdit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.bo.findById(id);
        request.setAttribute("customer", customer);
        List<CustomerType> customerTypeList = this.bo.selectType();
        request.setAttribute("customerType", customerTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("furama/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void update(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idCustomer"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String CMND = request.getParameter("CMND");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int typeId = Integer.parseInt(request.getParameter("customerType"));
        this.bo.edit(id, new Customer(id, typeId, name, birthday, CMND, phone, email, address));
        showList(request, response);
    }

    public void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        this.bo.delete(id);
        showList(request, response);
    }

    public void addNewService(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idService"));
        String name = request.getParameter("nameService");
        double area = Double.parseDouble(request.getParameter("area"));
        int numberFloor = Integer.parseInt(request.getParameter("numberOfFloors"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        double feeRent = Double.parseDouble(request.getParameter("feeRent"));
        int idTypeRent = Integer.parseInt(request.getParameter("typeRent"));
        int idTypeService = Integer.parseInt(request.getParameter("typeService"));
        String status = request.getParameter("status");
        this.bo.addNewService(new Service(id, name, area, numberFloor, maxPeople, feeRent, idTypeRent, idTypeService, status));
        showList(request, response);


    }

    public void showListEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Employee> employeeList = this.bo.showListEmployee();
        List<Position> positionList = this.bo.showListPosition();
        List<Level> levelList = this.bo.showListLevel();
        List<Department> departmentList = this.bo.showListDepartment();

        request.setAttribute("employees", employeeList);
        request.setAttribute("positions", positionList);
        request.setAttribute("levels", levelList);
        request.setAttribute("departments", departmentList);

        RequestDispatcher dispatcher = request.getRequestDispatcher("furama/tableEmployee.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void createNewEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idEmployee"));
        String name = request.getParameter("nameEmployee");
        String birthday = request.getParameter("birthdayEmployee");
        int CMND = Integer.parseInt(request.getParameter("CMNDEmployee"));
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phoneEmployee");
        String email = request.getParameter("emailEmployee");
        String address = request.getParameter("addressEmployee");
        int idVitri = Integer.parseInt(request.getParameter("position"));
        int idLevel = Integer.parseInt(request.getParameter("level"));
        int idDepartment = Integer.parseInt(request.getParameter("department"));
        this.bo.createNewEmployee(new Employee(id, name, idVitri, idLevel, idDepartment, birthday, CMND, salary, phone, email, address));
        showListEmployee(request, response);
    }

    public void updateEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("idEmployee"));
        String name = request.getParameter("nameEmployee");
        String birthday = request.getParameter("birthdayEmployee");
        int CMND = Integer.parseInt(request.getParameter("CMNDEmployee"));
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phoneEmployee");
        String email = request.getParameter("emailEmployee");
        String address = request.getParameter("addressEmployee");
        int idVitri = Integer.parseInt(request.getParameter("position"));
        int idLevel = Integer.parseInt(request.getParameter("level"));
        int idDepartment = Integer.parseInt(request.getParameter("department"));
        this.bo.updateEmployee(new Employee(id, name, idVitri, idLevel, idDepartment, birthday, CMND, salary, phone, email, address));
        showListEmployee(request, response);

    }


    public void login(HttpServletRequest request, HttpServletResponse response) {
        String userName = request.getParameter("user");
        String password = request.getParameter("password");
        List<User> userList = this.bo.login();
        for (User user : userList) {
            if (userName.equals(user.getName()) && password.equals(user.getPassword())) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("furama/firstPage.jsp");
                try {
                    dispatcher.forward(request, response);
                } catch (ServletException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            } else {
                request.setAttribute("message", "User name or password not valid !");
                RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                try {
                    dispatcher.forward(request, response);
                } catch (ServletException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

    }

    public void about(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("furama/about.jsp");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        this.bo.deleteEmployee(id);
        showListEmployee(request, response);

    }

    public void showEditEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = this.bo.findEmployee(id);
        request.setAttribute("employee", employee);

        List<Position> positionList = this.bo.showListPosition();
        List<Level> levelList = this.bo.showListLevel();
        List<Department> departmentList = this.bo.showListDepartment();

        request.setAttribute("positions", positionList);
        request.setAttribute("levels", levelList);
        request.setAttribute("departments", departmentList);


        RequestDispatcher dispatcher = request.getRequestDispatcher("furama/editEmployee.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
