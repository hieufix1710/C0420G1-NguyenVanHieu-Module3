package ProductManager.controller;

import ProductManager.model.Product;
import ProductManager.service.ProductService;
import ProductManager.service.ProductServiceTpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = "/products")
public class ProductServlet extends HttpServlet {
    ProductService productService=new ProductServiceTpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           String action=request.getParameter("action");
           if (action==null){
               action="";
           }
           switch (action){
               case "create":
                   createProduct(request,response);
                   break;
               case "edit":
                   editProduct(request,response);
                   break;
               case "delete":
                   deleteProduct(request,response);
                   break;
               default:
                   break;
           }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "create":
                showFormCreate(request,response);
                break;
            case "edit":
                showEditForm(request,response);
                break;
            case "delete":
                showFormDelete(request,response);
                break;
            case "view":
                viewProduct(request,response);
                break;
            default:
                listProduct(request,response);
                break;
        }
    }

    public void listProduct(HttpServletRequest request,HttpServletResponse response){
        List<Product> products=this.productService.findAll();
        request.setAttribute("products",products);
        RequestDispatcher dispatcher=request.getRequestDispatcher("product/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void showFormCreate(HttpServletRequest request,HttpServletResponse response){
        RequestDispatcher dispatcher=request.getRequestDispatcher("product/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void createProduct(HttpServletRequest request,HttpServletResponse response){
        int id=Integer.parseInt(request.getParameter("id"));
        String name=request.getParameter("name");
        String price=request.getParameter("price");
        String description=request.getParameter("description");
        this.productService.create(new Product(id,name,price,description));
        request.setAttribute("message","Create success !");
        RequestDispatcher dispatcher=request.getRequestDispatcher("product/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void showEditForm(HttpServletRequest request,HttpServletResponse response){
        int id= Integer.parseInt(request.getParameter("id"));
        Product product=this.productService.findById(id);
        if (product==null){
            request.getRequestDispatcher("index.jsp");
        }else {
            RequestDispatcher dispatcher=request.getRequestDispatcher("product/update.jsp");
            try {
                dispatcher.forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }
    public void editProduct(HttpServletRequest request,HttpServletResponse response){
        int id=Integer.parseInt(request.getParameter("id"));
        String name=request.getParameter("name");
        String price=request.getParameter("price");
        String description=request.getParameter("description");
        Product product=this.productService.findById(id);
        if (product==null){
            request.getRequestDispatcher("index.jsp");
        }else {
            product.setName(name);
            product.setPrice(price);
            product.setDescription(description);
            RequestDispatcher dispatcher=request.getRequestDispatcher("product/update.jsp");
            request.setAttribute("message","Update success !");
            try {
                dispatcher.forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    public void showFormDelete(HttpServletRequest request,HttpServletResponse response){
        int id=Integer.parseInt(request.getParameter("id"));
        Product product=this.productService.findById(id);
        request.setAttribute("product",product);
        RequestDispatcher dispatcher=request.getRequestDispatcher("product/delete.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    public void deleteProduct(HttpServletRequest request,HttpServletResponse response){
        int id=Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        if (product==null){
            request.getRequestDispatcher("index.jsp");
        }else {
            this.productService.delete(id);
            request.setAttribute("message","Delete success !");
            RequestDispatcher dispatcher=request.getRequestDispatcher("product/delete.jsp");

            try {
                dispatcher.forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    public void viewProduct(HttpServletRequest request,HttpServletResponse response){
        int id=Integer.parseInt(request.getParameter("id"));
        Product product=this.productService.findById(id);
        if (product==null){
            request.getRequestDispatcher("index.jsp");
        }else {
            request.setAttribute("product",product);
            RequestDispatcher dispatcher=request.getRequestDispatcher("product/view.jsp");
            try {
                dispatcher.forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
