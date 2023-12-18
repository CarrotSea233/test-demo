

function toTheTest(testId) {
    window.location.href = '/test-demo/jsp/teacher/test/the-test-view.jsp?testId=' + testId;
}

function delTheTest(testId) {
    window.location.href = '/test-demo/teacher/del-test-servlet?testId=' + testId;

}

function toTheStudentTest(testId, userId) {
    window.location.href = '/test-demo/jsp/teacher/mark/the-student-test-view.jsp?testId=' + testId + '&userId=' + userId;
}

function toTheTestScore(testId) {
    window.location.href = '/test-demo/jsp/teacher/score/the-test-score-view.jsp?testId=' + testId;
}

function toTheStudentTestScore(testId, userId) {
    window.location.href = '/test-demo/jsp/teacher/score/the-student-test-view.jsp?testId=' + testId + '&userId=' + userId;
}