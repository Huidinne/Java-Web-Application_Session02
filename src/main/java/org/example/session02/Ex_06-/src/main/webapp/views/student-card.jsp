<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="vi">
<head>
    <title>Thẻ sinh viên điện tử</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body class="bg-light">
<div class="container py-4">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-sm mb-3">
                <div class="card-body">
                    <h1 class="h4 mb-3">Tra cứu thẻ sinh viên điện tử</h1>
                    <form class="form-inline" method="get" action="${pageContext.request.contextPath}/student-card">
                        <label class="mr-2" for="msv">Mã sinh viên</label>
                        <input id="msv" name="msv" type="text" class="form-control mr-2" value="${requestScope.msv}" placeholder="VD: SV001">
                        <button class="btn btn-primary" type="submit">Tra cứu</button>
                    </form>
                </div>
            </div>

            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger" role="alert">
                    ${errorMessage}
                </div>
            </c:if>

            <c:if test="${not empty studentName}">
                <div class="card shadow-sm">
                    <div class="card-header bg-primary text-white">
                        Thẻ sinh viên
                    </div>
                    <div class="card-body">
                        <p class="mb-2"><strong>Mã sinh viên:</strong> ${requestScope.msv}</p>
                        <p class="mb-2"><strong>Họ và tên:</strong> ${studentName}</p>
                        <p class="mb-2"><strong>Khoa:</strong> ${faculty}</p>
                        <p class="mb-2"><strong>Năm học:</strong> ${year}</p>
                        <p class="mb-2"><strong>Điểm trung bình (GPA):</strong> ${gpa}</p>
                        <p class="mb-0"><strong>Xếp loại học lực:</strong>
                            <c:choose>
                                <c:when test="${gpa >= 8.0}">
                                    <span class="text-success">Giỏi</span>
                                </c:when>
                                <c:when test="${gpa >= 6.5}">
                                    <span class="text-primary">Khá</span>
                                </c:when>
                                <c:when test="${gpa >= 5.0}">
                                    <span class="text-warning">Trung bình</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="text-danger font-weight-bold">Cảnh báo học vụ</span>
                                </c:otherwise>
                            </c:choose>
                        </p>
                    </div>
                </div>
            </c:if>

            <p class="mt-3 mb-0">
                <a href="${pageContext.request.contextPath}/student-card">Tra cứu sinh viên khác</a>
            </p>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>


