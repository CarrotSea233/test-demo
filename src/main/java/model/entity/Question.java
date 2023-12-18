package model.entity;

import java.util.Date;

public class Question {
    // questionId, questionTypes, questionName, creationTime, modificationTime, 
        // questionDescription, choiceA, choiceB, choiceC, choiceD, solution
    private String questionId;
    private String questionTypes;
    private String questionName;
    private String creationTime;
    private String modificationTime;
    private String questionDescription;
    private String choiceA;
    private String choiceB;
    private String choiceC;
    private String choiceD;
    private String solution;

    // 无参构造方法
    public Question() {
    }

    // 带参构造方法
    public Question(String questionId, String questionTypes, String questionName, String creationTime,
                    String modificationTime, String questionDescription, String choiceA, String choiceB,
                    String choiceC, String choiceD, String solution) {
        this.questionId = questionId;
        this.questionTypes = questionTypes;
        this.questionName = questionName;
        this.creationTime = creationTime;
        this.modificationTime = modificationTime;
        this.questionDescription = questionDescription;
        this.choiceA = choiceA;
        this.choiceB = choiceB;
        this.choiceC = choiceC;
        this.choiceD = choiceD;
        this.solution = solution;
    }

    

    public Question(String questionTypes, String questionName, String creationTime, String modificationTime,
            String questionDescription, String choiceA, String choiceB, String choiceC, String choiceD,
            String solution) {
        this.questionTypes = questionTypes;
        this.questionName = questionName;
        this.creationTime = creationTime;
        this.modificationTime = modificationTime;
        this.questionDescription = questionDescription;
        this.choiceA = choiceA;
        this.choiceB = choiceB;
        this.choiceC = choiceC;
        this.choiceD = choiceD;
        this.solution = solution;
    }

    

    public Question(String questionId, String questionTypes, String questionName, String questionDescription,
            String choiceA, String choiceB, String choiceC, String choiceD, String solution) {
        this.questionId = questionId;
        this.questionTypes = questionTypes;
        this.questionName = questionName;
        this.questionDescription = questionDescription;
        this.choiceA = choiceA;
        this.choiceB = choiceB;
        this.choiceC = choiceC;
        this.choiceD = choiceD;
        this.solution = solution;
    }

    public Question(String questionId, String questionTypes, String questionName, String creationTime,
            String modificationTime) {
        this.questionId = questionId;
        this.questionTypes = questionTypes;
        this.questionName = questionName;
        this.creationTime = creationTime;
        this.modificationTime = modificationTime;
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

    public String getCreationTime() {
        return creationTime;
    }

    public void setCreationTime(String creationTime) {
        this.creationTime = creationTime;
    }

    public String getModificationTime() {
        return modificationTime;
    }

    public void setModificationTime(String modificationTime) {
        this.modificationTime = modificationTime;
    }

    public String getQuestionDescription() {
        return questionDescription;
    }

    public void setQuestionDescription(String questionDescription) {
        this.questionDescription = questionDescription;
    }

    public String getChoiceA() {
        return choiceA;
    }

    public void setChoiceA(String choiceA) {
        this.choiceA = choiceA;
    }

    public String getChoiceB() {
        return choiceB;
    }

    public void setChoiceB(String choiceB) {
        this.choiceB = choiceB;
    }

    public String getChoiceC() {
        return choiceC;
    }

    public void setChoiceC(String choiceC) {
        this.choiceC = choiceC;
    }

    public String getChoiceD() {
        return choiceD;
    }

    public void setChoiceD(String choiceD) {
        this.choiceD = choiceD;
    }

    public String getSolution() {
        return solution;
    }

    public void setSolution(String solution) {
        this.solution = solution;
    }

    @Override
    public String toString() {
        return "Question [questionId=" + questionId + ", questionTypes=" + questionTypes + ", questionName="
                + questionName + ", creationTime=" + creationTime + ", modificationTime=" + modificationTime
                + ", questionDescription=" + questionDescription + ", choiceA=" + choiceA + ", choiceB=" + choiceB
                + ", choiceC=" + choiceC + ", choiceD=" + choiceD + ", solution=" + solution + "]";
    }

    
}
