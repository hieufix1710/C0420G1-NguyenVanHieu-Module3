package controller;

import bo.IStudentBo;
import bo.StudentBo;
import model.Student;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentServlet", urlPatterns = "/students")
public class StudentServlet extends HttpServlet {
    IStudentBo studentBo=new StudentBo();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String action=request.getParameter("action");
         if (action==null){
             action="";
         }
         switch (action){
             case "create":
               create(request,response);
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
            default:
                showAll(request,response);
                break;

        }
    }

    public void showAll(HttpServletRequest request,HttpServletResponse response){
        List<Student> studentList=this.studentBo.findAll();
        request.setAttribute("students",studentList);
        RequestDispatcher dispatcher=request.getRequestDispatcher("student/list.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void showFormCreate(HttpServletRequest request,HttpServletResponse response){
        RequestDispatcher dispatcher=request.getRequestDispatcher("student/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (IOException | ServletException e) {
            e.printStackTrace();
        }
    }

    public void create(HttpServletRequest request,HttpServletResponse response){
        String name=request.getParameter("name");
        String birthday=request.getParameter("birthday");
        String account=request.getParameter("account");
        String password=request.getParameter("password");
        String className=request.getParameter("className");
        String typeClass=request.getParameter("typeClass");
        this.studentBo.save(new Student(0,name,birthday,account,password,className,typeClass));
        request.setAttribute("message","Create success !");
        RequestDispatcher dispatcher=request.getRequestDispatcher("student/create.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
