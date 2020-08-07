package bo;

import model.Student;

import java.util.List;

public interface IStudentBo {
       List<Student> findAll();
       void save(Student student);
       void delete(int id);
       void update(int id,Student student);
       Student findById(int id);
}
