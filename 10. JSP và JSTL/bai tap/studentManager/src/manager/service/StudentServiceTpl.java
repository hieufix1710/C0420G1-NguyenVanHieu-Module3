package manager.service;

import manager.model.Student;


import java.util.ArrayList;
import java.util.List;

public class StudentServiceTpl implements StudentService {
    private static List<Student> studentList;
    static {
        studentList = new ArrayList<>();
        studentList.add(new Student(1, "Hieu", "12-12-1999", "Ha Noi"));
        studentList.add(new Student(2, "Hai", "12-12-1999", "Ha Noi"));
        studentList.add(new Student(3, "hAng", "12-12-1999", "Ha Noi"));
        studentList.add(new Student(4, "Hoanh", "12-12-1999", "Ha Noi"));
        studentList.add(new Student(5, "Huong", "12-12-1999", "Ha Noi"));
    }
    @Override
    public List<Student> findAll() {
        return studentList;
    }

    @Override
    public void save(Student student) {
            studentList.add(student);
    }

    @Override
    public void update(int id, Student student) {
        studentList.get(id-1).setName(student.getName());
        studentList.get(id-1).setBirthday(student.getBirthday());
        studentList.get(id-1).setAddress(student.getAddress());
    }

    @Override
    public void delete(Student student) {
         studentList.remove(student);
    }

    @Override
    public Student findById(int id) {
        return studentList.get(id-1);
    }
}
