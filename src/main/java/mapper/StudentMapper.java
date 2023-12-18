package mapper;

import java.util.List;

import model.entity.Student;
import model.view.StudentView;

public interface StudentMapper {
    
    Student getStudentByUserId(Integer userId);

    StudentView getStudentViewByUserId(String userId);

    void updateStudent(Student student);

    List<StudentView> findStudents(StudentView studentView);

    void deleteStudent(String string);
}
