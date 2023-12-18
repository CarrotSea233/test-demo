package model.entity;

public class Score {
    private String scoreId;
    private String userId;
    private String testId;
    private String totalScore;
    private String state;
    private String theMarkUserId;

    public Score() {}

    public Score(String userId, String testId, String totalScore, String state) {
        this.userId = userId;
        this.testId = testId;
        this.totalScore = totalScore;
        this.state = state;
    }

    

    public Score(String userId, String testId, String totalScore, String state, String theMarkUserId) {
        this.userId = userId;
        this.testId = testId;
        this.totalScore = totalScore;
        this.state = state;
        this.theMarkUserId = theMarkUserId;
    }

    @Override
    public String toString() {
        return "Score [scoreId=" + scoreId + ", userId=" + userId + ", testId=" + testId + ", score=" + totalScore
                + ", state=" + state + "]";
    }

    

    public String getScoreId() {
        return scoreId;
    }

    public void setScoreId(String scoreId) {
        this.scoreId = scoreId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getTestId() {
        return testId;
    }

    public void setTestId(String testId) {
        this.testId = testId;
    }

    public String getTotalScore() {
        return totalScore;
    }

    public void setTotalScore(String totalScore) {
        this.totalScore = totalScore;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getTheMarkUserId() {
        return theMarkUserId;
    }

    public void setTheMarkUserId(String theMarkUserId) {
        this.theMarkUserId = theMarkUserId;
    }

    
}
