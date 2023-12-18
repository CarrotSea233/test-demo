package model.entity;

import java.time.LocalDateTime;

public class Test {
    private String testId;
    private String testName;
    private String examId;
    private LocalDateTime testStartTime;
    private LocalDateTime testEndTime;
    private String className;


    public Test() {
    }


    public Test(String testId, String testName, String examId, LocalDateTime testStartTime, LocalDateTime testEndTime,
            String className) {
        this.testId = testId;
        this.testName = testName;
        this.examId = examId;
        this.testStartTime = testStartTime;
        this.testEndTime = testEndTime;
        this.className = className;
    }


    public Test(String testName, String examId, LocalDateTime testStartTime, LocalDateTime testEndTime,
            String className) {
        this.testName = testName;
        this.examId = examId;
        this.testStartTime = testStartTime;
        this.testEndTime = testEndTime;
        this.className = className;
    }

    


    public Test(String testId, String testName, String className) {
        this.testId = testId;
        this.testName = testName;
        this.className = className;
    }


    @Override
    public String toString() {
        return "Test [testId=" + testId + ", testName=" + testName + ", examId=" + examId + ", testStartTime="
                + testStartTime + ", testEndTime=" + testEndTime + ", className=" + className + "]";
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


    public String getExamId() {
        return examId;
    }


    public void setExamId(String examId) {
        this.examId = examId;
    }


    public LocalDateTime getTestStartTime() {
        return testStartTime;
    }


    public void setTestStartTime(LocalDateTime testStartTime) {
        this.testStartTime = testStartTime;
    }


    public LocalDateTime getTestEndTime() {
        return testEndTime;
    }


    public void setTestEndTime(LocalDateTime testEndTime) {
        this.testEndTime = testEndTime;
    }


    public String getClassName() {
        return className;
    }


    public void setClassName(String className) {
        this.className = className;
    }

    
    
}
