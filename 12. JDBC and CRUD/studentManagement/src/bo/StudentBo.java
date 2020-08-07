package bo;

import dao.IStudentDao;
import dao.StudentDao;
import model.Student;

import java.util.List;

public class StudentBo implements IStudentBo {
    IStudentDao studentDao=new StudentDao();
    @Override
    public List<Student> findAll() {
        return studentDao.findAll();
    }

    @Override
    public void save(Student student) {
          studentDao.save(student);

    }

    @Override
    public void delete(int id) {
       studentDao.delete(id);
    }

    @Override
    public void update(int id, Student student) {

    }

    @Override
    public Student findById(int id) {
        return studentDao.findById(id);
    }
}
