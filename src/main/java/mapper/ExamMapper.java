package mapper;

import java.util.List;

import model.entity.Exam;
import model.entity.ReExamQuestion;
import model.view.ExamQuestionsView;

public interface ExamMapper {

    void insertExam(Exam exam);

    Exam getExamById(String examId);

    Exam getExam(Exam exam);

    void insertReExamQuestion(ReExamQuestion reExamQuestion);

    List<ExamQuestionsView> listQuestionsByExamId(String examId);

    List<ReExamQuestion> listReExamQuestionByExamId(String examId);

    List<Exam> findExams(Exam exam);

    List<Exam> listExams();

    void deleteExam(String examId);

    void deleteExamQuestions(String examId);

    void updateExam(Exam exam);

    void updateTheQuestionScore(ReExamQuestion question);

    void delteteReExamQuestion(String reqId);

    ReExamQuestion getReExamQuestionByExamAndQuestionId(ReExamQuestion reExamQuestion);
    
}
