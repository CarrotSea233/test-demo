package mapper;

import java.util.List;

import model.entity.Question;

public interface QuestionMapper {
    
    void insertQuestion(Question question);

    List<Question> findQuestions(Question question);
    
    List<Question> listQuestions();

    Question getQuestionById(String questionId);

    void updateQuestion(Question question);

    void deleteQuestion(String questionId);

    List<Question> listQuestionsExceptTheExamPart(String examId);
}
