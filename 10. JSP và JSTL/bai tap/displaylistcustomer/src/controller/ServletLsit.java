package controller;

import model.Customer;
import model.CustomerManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ServletLsit",urlPatterns = "/displayServlet")
public class ServletLsit extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String name= request.getParameter("name");
            String birthday= request.getParameter("birthday");
            String address= request.getParameter("address");
            String image= request.getParameter("image");
        CustomerManager customerManager=new CustomerManager();
        customerManager.display().add(new Customer(name,birthday,address,image));
        request.setAttribute("customerList",customerManager.display());
        request.getRequestDispatcher("displayList.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
