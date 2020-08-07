package manager.controller;

import manager.model.Student;
import manager.service.StudentService;
import manager.service.StudentServiceTpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentServlet",urlPatterns = "/students")
public class StudentServlet extends HttpServlet {
    private StudentService studentService=new StudentServiceTpl();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action =request.getParameter("action");
        if (action==null){
            action="";
        }
        switch (action){
            case "create":
                create(request,response);
                break;
            case "edit":
                edit(request,response);
                break;
            case "delete":
                delete(request,response);
                break;
            case "view":
                break;
            default:
                listStudent(request,response);
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          String action =request.getParameter("action");
          if (action==null){
              action="";
          }
          switch (action){
              case "create":
                  showFormCreate(request,response);
                  break;
              case "edit":
                  showFormEdit(request,response);
                  break;
              case "delete":
                  showFormDelete(request,response);
                  break;
              case "view":

                  break;
              default:
                  listStudent(request,response);
                  break;
          }
    }

    public void listStudent(HttpServletRequest request,HttpServletResponse response){
        List<Student> studentList =this.studentService.findAll();
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
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void create(HttpServletRequest request,HttpServletResponse response){
        String id=request.getParameter("id");
        String name=request.getParameter("name");
        String birthday=request.getParameter("birthday");
        String address=request.getParameter("address");
        this.studentService.findAll().add(new Student(Integer.parseInt(id),name,birthday,address));
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

    public void edit(HttpServletRequest request,HttpServletResponse response){
        int id=Integer.parseInt(request.getParameter("id"));
        String name=request.getParameter("name");
        String birthday=request.getParameter("birthday");
        String address=request.getParameter("address");
        Student student=this.studentService.findById(id);
        if (student==null){
            request.getRequestDispatcher("index.jsp");
        }else {
            student.setName(name);
            student.setBirthday(birthday);
            student.setAddress(address);
            this.studentService.update(id,student);
            request.setAttribute("message","Update success !");
            RequestDispatcher dispatcher=request.getRequestDispatcher("student/edit.jsp");
            try {
                dispatcher.forward(request,response);
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }


    }
    public void showFormEdit(HttpServletRequest request,HttpServletResponse response){
        RequestDispatcher dispatcher=request.getRequestDispatcher("student/edit.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void delete(HttpServletRequest request,HttpServletResponse response){
        int id=Integer.parseInt(request.getParameter("id"));
        Student student=this.studentService.findById(id);
        request.setAttribute("student",student);
        if (student==null){
            request.getRequestDispatcher("index.jsp");
        }else {
            this.studentService.delete(student);
            request.setAttribute("message","Delete success !");
            RequestDispatcher dispatcher=request.getRequestDispatcher("student/delete.jsp");
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
        Student student=this.studentService.findById(id);
        request.setAttribute("student",student);

        RequestDispatcher dispatcher=request.getRequestDispatcher("student/delete.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
