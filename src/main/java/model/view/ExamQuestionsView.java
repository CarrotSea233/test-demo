package model.view;

public class ExamQuestionsView {
    private String reqId;
    private String examId;
    private String questionId;
    private String questionTypes;
    private String questionName;
    private String questionScore;
    private Integer orderNumber;
    
    public ExamQuestionsView() {
    }

    public ExamQuestionsView(String examId, String questionId, String questionTypes, String questionName,
            String questionScore, Integer orderNumber) {
        this.examId = examId;
        this.questionId = questionId;
        this.questionTypes = questionTypes;
        this.questionName = questionName;
        this.questionScore = questionScore;
        this.orderNumber = orderNumber;
    }

    
    

    public ExamQuestionsView(String reqId, String examId, String questionId, String questionTypes, String questionName,
            String questionScore, Integer orderNumber) {
        this.reqId = reqId;
        this.examId = examId;
        this.questionId = questionId;
        this.questionTypes = questionTypes;
        this.questionName = questionName;
        this.questionScore = questionScore;
        this.orderNumber = orderNumber;
    }

    public String getExamId() {
        return examId;
    }

    public void setExamId(String examId) {
        this.examId = examId;
    }

    public Integer getOrderNumber() {
        return orderNumber;
    }

    public void setOrderNumber(Integer orderNumber) {
        this.orderNumber = orderNumber;
    }

    public String getQuestionId() {
        return questionId;
    }

    public void setQuestionId(String questionId) {
        this.questionId = questionId;
    }

    public String getQuestionTypes() {
        return questionTypes;
    }

    public void setQuestionTypes(String questionTypes) {
        this.questionTypes = questionTypes;
    }

    public String getQuestionName() {
        return questionName;
    }

    public void setQuestionName(String questionName) {
        this.questionName = questionName;
    }

    public String getQuestionScore() {
        return questionScore;
    }

    public void setQuestionScore(String questionScore) {
        this.questionScore = questionScore;
    }

    public String getReqId() {
        return reqId;
    }

    public void setReqId(String reqId) {
        this.reqId = reqId;
    }

    @Override
    public String toString() {
        return "ExamQuestionsView [reqId=" + reqId + ", examId=" + examId + ", questionId=" + questionId
                + ", questionTypes=" + questionTypes + ", questionName=" + questionName + ", questionScore="
                + questionScore + ", orderNumber=" + orderNumber + "]";
    }


    
}
