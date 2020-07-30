import model.Customer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "controller", urlPatterns = "/in")
public class controller extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList=new ArrayList<>();
        String name=request.getParameter("name");
        String birthday=request.getParameter("birthday");
        String address=request.getParameter("address");
        String image=request.getParameter("image");

        Customer customer=new Customer(name,birthday,address,image);
        customerList.add(customer);

        request.setAttribute("customerList",customerList);
        request.getRequestDispatcher("Result.jsp").forward(request,response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
