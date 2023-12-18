package model.entity;


// req_id
// exam_id
// question_id
// question_score
// ordeer_number
public class ReExamQuestion {
    private String reqId;
    private String examId;
    private String questionId;
    private String questionScore;
    private String orderNumber;

    
    public ReExamQuestion(String reqId, String examId, String questionId, String questionScore, String orderNumber) {
        this.reqId = reqId;
        this.examId = examId;
        this.questionId = questionId;
        this.questionScore = questionScore;
        this.orderNumber = orderNumber;
    }


    public ReExamQuestion(String examId, String questionId, String questionScore, String orderNumber) {
        this.examId = examId;
        this.questionId = questionId;
        this.questionScore = questionScore;
        this.orderNumber = orderNumber;
    }



    public ReExamQuestion(String examId, String questionId, String questionScore) {
        this.examId = examId;
        this.questionId = questionId;
        this.questionScore = questionScore;
    }


    public ReExamQuestion(String examId, String questionId) {
        this.examId = examId;
        this.questionId = questionId;
    }


    public String getReqId() {
        return reqId;
    }


    public void setReqId(String reqId) {
        this.reqId = reqId;
    }


    public String getExamId() {
        return examId;
    }


    public void setExamId(String examId) {
        this.examId = examId;
    }


    public String getQuestionId() {
        return questionId;
    }


    public void setQuestionId(String questionId) {
        this.questionId = questionId;
    }


    public String getQuestionScore() {
        return questionScore;
    }


    public void setQuestionScore(String questionScore) {
        this.questionScore = questionScore;
    }


    public String getOrderNumber() {
        return orderNumber;
    }


    public void setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }


    @Override
    public String toString() {
        return "ReExamQuestion [reqId=" + reqId + ", examId=" + examId + ", questionId=" + questionId
                + ", questionScore=" + questionScore + ", orderNumber=" + orderNumber + "]";
    }

    
}