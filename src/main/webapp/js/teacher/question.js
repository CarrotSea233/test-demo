

function toTheQuestion(questionId) {
    window.location.href = '/test-demo/jsp/teacher/question/the-question-view.jsp?questionId=' + questionId;
}

function delTheQuestion(questionId) {
    window.location.href = '/test-demo/teacher/del-question-servlet?questionId=' + questionId;

}