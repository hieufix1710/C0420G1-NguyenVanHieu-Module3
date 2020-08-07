package manager.service;

import manager.model.Student;

import java.util.List;

public interface StudentService {
    List<Student> findAll();
    void save(Student student);
    void update(int id,Student student);
    void delete(Student student);
    Student findById(int id);
}
