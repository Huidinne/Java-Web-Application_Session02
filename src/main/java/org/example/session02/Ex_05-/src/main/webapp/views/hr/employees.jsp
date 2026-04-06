<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Danh sách nhân viên</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>
<%@ include file="includes/header.jsp" %>
<fmt:setLocale value="vi_VN" />

<div class="d-flex justify-content-between align-items-center mb-3">
    <h2 class="h4 mb-0">Danh sách nhân viên</h2>
</div>

<div class="card shadow-sm">
    <div class="table-responsive">
        <table class="table table-striped table-hover mb-0">
            <thead class="thead-light">
            <tr>
                <th>STT</th>
                <th>Mã NV</th>
                <th>Họ tên</th>
                <th>Phòng ban</th>
                <th>Lương (VND)</th>
                <th>Ngày vào làm</th>
                <th>Trạng thái</th>
                <th>Chi tiết</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="emp" items="${employees}" varStatus="st">
                <tr>
                    <td>${st.count}</td>
                    <td><c:out value="${emp.code}" /></td>
                    <td><c:out value="${emp.fullName}" /></td>
                    <td><c:out value="${emp.department}" /></td>
                    <td><fmt:formatNumber value="${emp.salary}" type="number" groupingUsed="true" /> VND</td>
                    <td><fmt:formatDate value="${emp.joinDate}" pattern="dd/MM/yyyy" /></td>
                    <td>
                        <c:choose>
                            <c:when test="${emp.status == 'Đang làm'}">
                                <span class="badge badge-success">Đang làm</span>
                            </c:when>
                            <c:when test="${emp.status == 'Nghỉ phép'}">
                                <span class="badge badge-warning text-white">Nghỉ phép</span>
                            </c:when>
                            <c:otherwise>
                                <span class="badge badge-primary">Thử việc</span>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a class="btn btn-sm btn-outline-primary" href="<c:url value='/hr/employees/${emp.code}'/>">Xem chi tiết</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<div class="alert alert-info mt-3 mb-0" role="alert">
    Tổng lương phòng Kỹ thuật:
    <strong><fmt:formatNumber value="${technicalTotalSalary}" type="number" groupingUsed="true" /> VND</strong>
</div>

<%@ include file="includes/footer.jsp" %>
</body>
</html>

