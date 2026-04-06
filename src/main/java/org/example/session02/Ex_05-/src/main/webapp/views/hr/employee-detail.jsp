<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Chi tiết nhân viên</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>
<%@ include file="includes/header.jsp" %>
<fmt:setLocale value="vi_VN" />

<h2 class="h4 mb-3">Chi tiết nhân viên</h2>

<div class="card shadow-sm">
    <div class="table-responsive">
        <table class="table table-bordered mb-0">
            <tr><th class="w-25">Mã NV</th><td><c:out value="${employee.code}" /></td></tr>
            <tr><th>Họ tên</th><td><c:out value="${employee.fullName}" /></td></tr>
            <tr><th>Phòng ban</th><td><c:out value="${employee.department}" /></td></tr>
            <tr>
                <th>Lương</th>
                <td>
                    <c:choose>
                        <c:when test="${sessionScope.role == 'hr_manager'}">
                            <fmt:formatNumber value="${employee.salary}" type="number" groupingUsed="true" /> VND
                        </c:when>
                        <c:otherwise>
                            ***
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
            <tr><th>Ngày vào làm</th><td><fmt:formatDate value="${employee.joinDate}" pattern="dd/MM/yyyy" /></td></tr>
            <tr><th>Trạng thái</th><td><c:out value="${employee.status}" /></td></tr>
        </table>
    </div>
</div>

<p class="mt-3 mb-0"><a class="btn btn-outline-secondary" href="<c:url value='/hr/employees'/>">Quay lại</a></p>

<%@ include file="includes/footer.jsp" %>
</body>
</html>

