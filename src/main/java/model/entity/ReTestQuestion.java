package model.entity;

public class ReTestQuestion {
    private String rtqId;
    private String testId;
    private String questionId;
    private String userId;
    private String answer;
    private String theScore;

    public ReTestQuestion(){}

    public ReTestQuestion(String rtqId, String testId, String questionId, String userId, String answer,
            String theScore) {
        this.rtqId = rtqId;
        this.testId = testId;
        this.questionId = questionId;
        this.userId = userId;
        this.answer = answer;
        this.theScore = theScore;
    }

    public ReTestQuestion(String testId, String questionId, String userId, String answer, String theScore) {
        this.testId = testId;
        this.questionId = questionId;
        this.userId = userId;
        this.answer = answer;
        this.theScore = theScore;
    }

    

    public ReTestQuestion(String testId, String questionId, String userId) {
        this.testId = testId;
        this.questionId = questionId;
        this.userId = userId;
    }

    

    public ReTestQuestion(String testId, String questionId, String userId, String theScore) {
        this.testId = testId;
        this.questionId = questionId;
        this.userId = userId;
        this.theScore = theScore;
    }

    @Override
    public String toString() {
        return "ReTestQuestion [rtqId=" + rtqId + ", testId=" + testId + ", questionId=" + questionId + ", userId="
                + userId + ", answer=" + answer + ", theScore=" + theScore + "]";
    }

    public String getRtqId() {
        return rtqId;
    }

    public void setRtqId(String rtqId) {
        this.rtqId = rtqId;
    }

    public String getTestId() {
        return testId;
    }

    public void setTestId(String testId) {
        this.testId = testId;
    }

    public String getQuestionId() {
        return questionId;
    }

    public void setQuestionId(String questionId) {
        this.questionId = questionId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public String getTheScore() {
        return theScore;
    }

    public void setTheScore(String theScore) {
        this.theScore = theScore;
    }

    

    
}
