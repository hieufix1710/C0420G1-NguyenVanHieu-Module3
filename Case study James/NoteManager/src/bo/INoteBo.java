package bo;

import model.Note;
import model.NoteType;

import java.util.List;

public interface INoteBo {
     List<Note> findAll();
     Note selectNote(int id);
     void insertNote(Note note);
     boolean deleteNote(int id);
     boolean editNote(Note note);
     List<Note> searchNote(String title);
     List<NoteType> selectAllNoteType();
}
