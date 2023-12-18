

function toTheUser(userId, identity) {
    if(identity=='admin')
    window.location.href = '/test-demo/jsp/admin/admin-menu/the-admin-view.jsp?userId=' + userId;
    else if(identity=='teacher')
    window.location.href = '/test-demo/jsp/admin/teacher-menu/the-teacher-information.jsp?userId=' + userId;
    else if(identity=='student')
    window.location.href = '/test-demo/jsp/admin/student-menu/the-student-information.jsp?userId=' + userId;
}

function delTheLog(logId) {
    window.location.href = '/test-demo/login/del-log-servlet?logId=' + logId;

}