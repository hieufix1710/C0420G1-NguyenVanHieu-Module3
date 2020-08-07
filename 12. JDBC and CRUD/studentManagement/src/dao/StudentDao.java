package dao;

import model.Student;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDao implements IStudentDao {
    private BaseDao baseDao=new BaseDao();
    private Connection connection=this.baseDao.getConnection();
    private static final String FIND_ALL_STUDENT_SQL="{call findAll()}";
    private static final String SAVE_NEW_STUDENT="{call insertNewStudent(?,?)}";
    private static final String SAVE_NEW_ACCOUNT="{call insertNewAccount(?,?)}";
    private static final String SAVE_NEW_CLASS="{call insertNewClass(?,?)}";

    private static final String DELETE_STUDENT="delete from student where id = ?";
    private static final String FIND_BY_ID="select id,name,date_of_birth from student where id = ?";

    @Override
    public List<Student> findAll() {
        List<Student> studentList=new ArrayList<>();
        CallableStatement callableStatement= null;
        try {
            callableStatement = connection.prepareCall(FIND_ALL_STUDENT_SQL);
            ResultSet resultSet=callableStatement.executeQuery();
            Student student=null;
            while (resultSet.next()){
                int id=resultSet.getInt("id");
                String name=resultSet.getString("name");
                String birthday=resultSet.getString("date_of_birth");
                String account =resultSet.getString("account");
                String password =resultSet.getString("password");
                String className=resultSet.getString("className");
                String typeClass=resultSet.getString("typeClass");
                student=new Student(id,name,birthday,account,password,className,typeClass);
                studentList.add(student);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return studentList;

    }

    @Override
    public void save(Student student) {
        try {
            connection.setAutoCommit(false);
            CallableStatement callableStatement=connection.prepareCall(SAVE_NEW_STUDENT);
            callableStatement.setString(1,student.getName());
            callableStatement.setString(2,student.getBirthday());
            callableStatement.executeUpdate();

            CallableStatement callableStatement1=connection.prepareCall(SAVE_NEW_ACCOUNT);
            callableStatement1.setString(1,student.getAccount());
            callableStatement1.setString(2,student.getPassword());
            callableStatement1.executeUpdate();

            CallableStatement callableStatement2=connection.prepareCall(SAVE_NEW_CLASS);
            callableStatement2.setString(1,student.getClassName());
            if ("Full time".equals(student.getTypeClass())){
                callableStatement2.setString(2,"1");
            }
            if ("Past time".equals(student.getTypeClass())){
                callableStatement2.setString(2,"2");
            }
            callableStatement2.executeUpdate();

            connection.commit();
            connection.setAutoCommit(true);

        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    @Override
    public void delete(int id) {

    }

    @Override
    public void update(int id, Student student) {

    }

    @Override
    public Student findById(int id) {
        return null;
    }
}
