package model.entity;

public class Exam {
    private String examId;
    private String examName;
    private String creationTime;
    private String modificationTime; 

    public Exam() {}

    public Exam(String examName, String creationTime, String modificationTime) {
        this.examName = examName;
        this.creationTime = creationTime;
        this.modificationTime = modificationTime;
    }

    public Exam(String examId, String examName, String creationTime, String modificationTime) {
        this.examId = examId;
        this.examName = examName;
        this.creationTime = creationTime;
        this.modificationTime = modificationTime;
    }

    

    public Exam(String examId, String examName) {
        this.examId = examId;
        this.examName = examName;
    }

    @Override
    public String toString() {
        return "Exam [examId=" + examId + ", examName=" + examName + ", creationTime=" + creationTime
                + ", modificationTime=" + modificationTime + "]";
    }

    public String getExamId() {
        return examId;
    }

    public void setExamId(String examId) {
        this.examId = examId;
    }

    public String getExamName() {
        return examName;
    }

    public void setExamName(String examName) {
        this.examName = examName;
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

    
}
