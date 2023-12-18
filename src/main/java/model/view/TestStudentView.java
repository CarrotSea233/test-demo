package model.view;

public class TestStudentView {
    private String testId;
    private String testName;
    private String className;

    private String scoreId;
    private String userId;
    private String userName;
    private String totalScore;

    private String theMarkUserId;
    private String theMarkUserName;


    public TestStudentView() {}

    


    public TestStudentView(String testId, String testName, String className, String userName, String theMarkUserName) {
        this.testId = testId;
        this.testName = testName;
        this.className = className;
        this.userName = userName;
        this.theMarkUserName = theMarkUserName;
    }




    public TestStudentView(String testId) {
        this.testId = testId;
    }




    public String getTestId() {
        return testId;
    }


    public void setTestId(String testId) {
        this.testId = testId;
    }


    public String getTestName() {
        return testName;
    }


    public void setTestName(String testName) {
        this.testName = testName;
    }


    public String getClassName() {
        return className;
    }


    public void setClassName(String className) {
        this.className = className;
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


    public String getUserName() {
        return userName;
    }


    public void setUserName(String userName) {
        this.userName = userName;
    }


    public String getTotalScore() {
        return totalScore;
    }


    public void setTotalScore(String totalScore) {
        this.totalScore = totalScore;
    }


    public String getTheMarkUserId() {
        return theMarkUserId;
    }


    public void setTheMarkUserId(String theMarkUserId) {
        this.theMarkUserId = theMarkUserId;
    }


    public String getTheMarkUserName() {
        return theMarkUserName;
    }


    public void setTheMarkUserName(String theMarkUserName) {
        this.theMarkUserName = theMarkUserName;
    }

    
}
