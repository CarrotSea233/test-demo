

function toTheStudent(userId) {
    window.location.href = '/test-demo/jsp/admin/student-menu/the-student-information.jsp?userId=' + userId;
}

function delTheStudent(userId) {
    window.location.href = '/test-demo/admin/del-student-servlet?userId=' + userId;

}