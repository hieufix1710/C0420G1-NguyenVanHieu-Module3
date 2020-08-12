package dao;

import model.Note;
import model.NoteType;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NoteDao implements INoteDao{
    BaseDAO baseDAO=new BaseDAO();
    Connection connection=this.baseDAO.getConnection();
    @Override
    public List<Note> findAll() {
        List<Note> noteList=new ArrayList<>();
        try {
            PreparedStatement preparedStatement=connection.prepareStatement("select id,name,description,type_id,startTime from note");
            Note note=null;
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("id");
                String name=resultSet.getString("name");
                String description =resultSet.getString("description");
                int type_id=resultSet.getInt("type_id");
                String startTime=resultSet.getString("startTime");
                note=new Note(id,name,description,type_id,startTime);
                noteList.add(note);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return noteList;
    }

    @Override
    public Note selectNote(int id) {
        Note note=null;
        try {
            PreparedStatement preparedStatement=connection.prepareStatement("select note.id,note.name,description,type_id as type ,startTime from note\n" +
                    "join note_type on note.type_id=note_type.id\n" +
                    "where note.id=?;");
            preparedStatement.setInt(1,id);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                String name=resultSet.getString("name");
                String description=resultSet.getString("description");
                int type=resultSet.getInt("type");
                String startTime=resultSet.getString("startTime");
                note=new Note(id,name,description,type,startTime);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return note;
    }

    @Override
    public void insertNote(Note note) {
        try {
            PreparedStatement preparedStatement=connection.prepareStatement("insert  into note (name,description,type_id,startTime) values (?,?,?,?)");
            preparedStatement.setString(1,note.getName());
            preparedStatement.setString(2,note.getDescription());
            preparedStatement.setInt(3,note.getTypeId());
            preparedStatement.setString(4,note.getStartTime());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean deleteNote(int id) {
        try {
            PreparedStatement preparedStatement=connection.prepareStatement("delete  from note where id=?");
            preparedStatement.setInt(1,id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }

    @Override
    public boolean editNote(Note note) {
        try {
            CallableStatement callableStatement=connection.prepareCall("{call updateInformation(?,?,?,?,?)}");
            callableStatement.setInt(1,note.getId());
            callableStatement.setString(2,note.getName());
            callableStatement.setString(3,note.getDescription());
            callableStatement.setInt(4,note.getTypeId());
            callableStatement.setString(5,note.getStartTime());
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }

    @Override
    public List<Note> searchNote(String title) {
        return null;
    }

    @Override
    public List<NoteType> selectAllNoteType() {
        List<NoteType> noteTypeList=new ArrayList<>();
        NoteType noteType=null;
        try {
            PreparedStatement preparedStatement=connection.prepareStatement("select * from note_type");
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                int id=resultSet.getInt("id");
                String type=resultSet.getString("name");
                noteType=new NoteType(id,type);
                noteTypeList.add(noteType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return noteTypeList;

    }
}
