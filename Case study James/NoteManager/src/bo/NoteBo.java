package bo;

import dao.INoteDao;
import dao.NoteDao;
import model.Note;
import model.NoteType;

import java.util.List;

public class NoteBo  implements INoteBo{
    INoteDao noteDao=new NoteDao();
    @Override
    public List<Note> findAll() {
        return noteDao.findAll();
    }

    @Override
    public Note selectNote(int id) {
        return noteDao.selectNote(id);
    }

    @Override
    public void insertNote(Note note) {
     noteDao.insertNote(note);
    }

    @Override
    public boolean deleteNote(int id) {
        return noteDao.deleteNote(id);
    }

    @Override
    public boolean editNote(Note note) {
        return noteDao.editNote(note);
    }

    @Override
    public List<Note> searchNote(String title) {
        return noteDao.searchNote(title);
    }

    @Override
    public List<NoteType> selectAllNoteType() {
        return noteDao.selectAllNoteType();
    }
}
