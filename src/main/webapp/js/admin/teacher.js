

function toTheTeacher(userId) {
    window.location.href = '/test-demo/jsp/admin/teacher-menu/the-teacher-information.jsp?userId=' + userId;
}

function delTheTeacher(userId) {
    window.location.href = '/test-demo/admin/del-teacher-servlet?userId=' + userId;

}