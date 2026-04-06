<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-4">
    <a class="navbar-brand" href="<c:url value='/hr/employees'/>">Mini Portal Nhân sự</a>
    <div class="ml-auto d-flex align-items-center text-white">
        <c:if test="${sessionScope.role == 'hr_manager'}">
            <span class="badge badge-light text-primary mr-2">Chế độ: Quản lý nhân sự</span>
        </c:if>
        <c:if test="${sessionScope.role == 'hr_staff'}">
            <span class="badge badge-light text-primary mr-2">Chế độ: Nhân viên nhân sự</span>
        </c:if>
        <c:if test="${not empty sessionScope.loggedUser}">
            <span class="mr-2">Xin chào, <strong><c:out value="${sessionScope.loggedUser}" /></strong></span>
            <form method="post" action="<c:url value='/hr/logout'/>" class="mb-0">
                <button type="submit" class="btn btn-sm btn-outline-light">Đăng xuất</button>
            </form>
        </c:if>
    </div>
</nav>

<div class="container">

