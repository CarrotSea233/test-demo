

function toTheExam(examId) {
    window.location.href = '/test-demo/jsp/teacher/exam/the-exam-view.jsp?examId=' + examId;
}

function delTheExam(examId) {
    window.location.href = '/test-demo/teacher/del-exam-servlet?examId=' + examId;
}

function addExamQuestion(examId) {
    window.location.href = '/test-demo/jsp/teacher/exam/exam-add-question.jsp?examId=' + examId;
}

function delTheExamQuestion(reqId, examId) {
    window.location.href = '/test-demo/teacher/exam-del-question-servlet?reqId=' + reqId + "&examId=" + examId;
}