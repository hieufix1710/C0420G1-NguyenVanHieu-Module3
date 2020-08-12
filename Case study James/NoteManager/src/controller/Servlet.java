package controller;

import bo.INoteBo;
import bo.NoteBo;
import model.Note;
import model.NoteType;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(name = "Servlet",urlPatterns = "/notes")
public class Servlet extends HttpServlet {
    INoteBo noteBo = new NoteBo();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                create(request,response);
                break;
            case "update":
                update(request,response);
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
            case  "view":
                view(request,response);
                break;
            case "edit":
                edit(request, response);
                break;
            case "delete":
                delete(request,response);
                break;
            default:
                showList(request,response);
                break;
        }
    }

    public void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Note> noteList = this.noteBo.findAll();
        List<NoteType> noteTypeList = this.noteBo.selectAllNoteType();
        request.setAttribute("noteList", noteList);
        request.setAttribute("noteTypeList", noteTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("note/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void create(HttpServletRequest request, HttpServletResponse response){
        String name=request.getParameter("name");
        String description =request.getParameter("description");
        int type=Integer.parseInt(request.getParameter("noteTypeId"));
        String startTime="";
        this.noteBo.insertNote(new Note(0,name,description,type,startTime));
        showList(request,response);

    }

    public void view(HttpServletRequest request,HttpServletResponse response){
        int id=Integer.parseInt(request.getParameter("id"));
        Note note=this.noteBo.selectNote(id);
        List<NoteType> noteTypeList=this.noteBo.selectAllNoteType();
        request.setAttribute("noteTypeList",noteTypeList);
        request.setAttribute("noteView",note);
        RequestDispatcher dispatcher=request.getRequestDispatcher("note/view.jsp");
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
        Note note=this.noteBo.selectNote(id);
        List<NoteType> noteTypeList=this.noteBo.selectAllNoteType();
        request.setAttribute("noteTypeList",noteTypeList);
        request.setAttribute("noteEdit",note);
        RequestDispatcher dispatcher=request.getRequestDispatcher("note/edit.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void update(HttpServletRequest request,HttpServletResponse response){
        int id=Integer.parseInt(request.getParameter("id"));
        String name=request.getParameter("name");
        String description=request.getParameter("description");
        int type=Integer.parseInt(request.getParameter("noteTypeId"));
        this.noteBo.editNote(new Note(id,name,description,type,""));
        showList(request,response);
    }

    public void delete(HttpServletRequest request,HttpServletResponse response ){
        int id=Integer.parseInt(request.getParameter("id"));
        this.noteBo.deleteNote(id);
        showList(request,response);
    }

}
