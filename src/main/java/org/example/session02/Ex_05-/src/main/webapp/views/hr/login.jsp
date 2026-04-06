<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Đăng nhập Nhân sự</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body>
<%@ include file="includes/header.jsp" %>

<div class="row justify-content-center">
    <div class="col-md-6 col-lg-5">
        <div class="card shadow-sm">
            <div class="card-body">
                <h2 class="h4 mb-4">Đăng nhập hệ thống nhân sự</h2>

                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger" role="alert">
                        <c:out value="${errorMessage}" />
                    </div>
                </c:if>

                <form method="post" action="<c:url value='/hr/login'/>">
                    <div class="form-group">
                        <label for="username">Tên đăng nhập</label>
                        <input id="username" type="text" name="username" class="form-control" required />
                    </div>
                    <div class="form-group">
                        <label for="password">Mật khẩu</label>
                        <input id="password" type="password" name="password" class="form-control" required />
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Đăng nhập</button>
                </form>

                <p class="text-muted small mt-3 mb-0">Tài khoản demo: hr_manager/hr123 và hr_staff/staff456</p>
            </div>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>
</body>
</html>

