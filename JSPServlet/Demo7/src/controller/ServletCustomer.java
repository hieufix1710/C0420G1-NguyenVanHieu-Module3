package controller;


import model.Customer;
import model.CustomerManager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name = "ServletCustomer",urlPatterns = "/abc")
public class ServletCustomer extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        String name=request.getParameter("name");
        String birthday=request.getParameter("birthday");
        String address=request.getParameter("address");

        CustomerManager customerManager=new CustomerManager();
        customerManager.list().add(new Customer(Integer.parseInt(id),name,birthday,address));
        request.setAttribute("customerList",customerManager.list());
        request.getRequestDispatcher("display.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}
