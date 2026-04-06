<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Lỗi hệ thống</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>
<%@ include file="includes/header.jsp" %>

<div class="card border-danger shadow-sm">
    <div class="card-body">
        <h2 class="h4 text-danger">Đã xảy ra lỗi</h2>
        <div class="alert alert-danger mb-3" role="alert">
            <c:out value="${errorMessage}" />
        </div>
        <a class="btn btn-outline-primary" href="<c:url value='/hr/employees'/>">Quay lại danh sách nhân viên</a>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>
</body>
</html>

