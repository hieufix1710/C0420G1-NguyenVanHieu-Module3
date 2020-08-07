package controller;

import bo.IUserBo;
import bo.UserBo;
import dao.IUserDAO;
import dao.UserDAO;
import model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserServlet", urlPatterns = "/users")
public class UserServlet extends HttpServlet {
    private IUserBo userBo = new UserBo();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                insertUser(request, response);
                break;
            case "edit":
                editUser(request, response);
                break;
            case "delete":
                deleteUser(request, response);
                break;
            case "findByCountry":
                 findByCountry(request,response);
               break;
            default:
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showNewForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteFormUser(request, response);
                break;
            case "findByCountry":
                showFormFind(request,response);
                break;
            case "orderByName":
                orderByName(request,response);
                break;
            default:
                listUser(request, response);
                break;
        }

    }

    public void showNewForm(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/create.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void listUser(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userBo.selectAllUsers();
        request.setAttribute("users", userList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void deleteFormUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = this.userBo.selectUser(id);
        request.setAttribute("user", user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/delete.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = this.userBo.selectUser(id);
        boolean check = this.userBo.deleteUser(id);
        request.setAttribute("message", check);
        request.setAttribute("user", user);
        RequestDispatcher dispatcher = request.getRequestDispatcher("user/delete.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


    }

    public void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = this.userBo.selectUser(id);
        if (user == null) {
            request.getRequestDispatcher("index.jsp");
        } else {
            request.setAttribute("user", user);
            RequestDispatcher dispatcher = request.getRequestDispatcher("user/edit.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public void editUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(id, name, email, country);
        boolean check=this.userBo.updateUser(user);
        request.setAttribute("message",check);
        RequestDispatcher dispatcher
                = request.getRequestDispatcher("user/edit.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void insertUser(HttpServletRequest request, HttpServletResponse response) {
         String name=request.getParameter("name");
         String email=request.getParameter("email");
         String country=request.getParameter("country");
         User user=new User(0,name,email,country);
         this.userBo.insertUser(user);
         request.setAttribute("message","Create success !");
         RequestDispatcher dispatcher=request.getRequestDispatcher("user/create.jsp");
         try {
             dispatcher.forward(request,response);
         } catch (ServletException e) {
             e.printStackTrace();
         } catch (IOException e) {
             e.printStackTrace();
         }

    }

    public void showFormFind(HttpServletRequest request,HttpServletResponse response){
        RequestDispatcher dispatcher =request.getRequestDispatcher("user/find.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public void findByCountry(HttpServletRequest request,HttpServletResponse response){
         String country=request.getParameter("country");
        List<User> userList= userBo.findByCountry(country);
         request.setAttribute("users",userList);
         RequestDispatcher dispatcher=request.getRequestDispatcher("user/list.jsp");
         try {
             dispatcher.forward(request,response);
         } catch (ServletException e) {
             e.printStackTrace();
         } catch (IOException e) {
             e.printStackTrace();
         }
    }

    public void orderByName(HttpServletRequest request,HttpServletResponse response){
        List<User> userList=this.userBo.orderByName();
        request.setAttribute("users",userList);
        RequestDispatcher dispatcher=request.getRequestDispatcher("user/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }




}
