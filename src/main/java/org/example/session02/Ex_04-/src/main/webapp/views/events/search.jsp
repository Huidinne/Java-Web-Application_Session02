<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!doctype html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Kết quả tìm kiếm</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
          crossorigin="anonymous">
</head>
<body class="bg-light">
<div class="container py-4">
    <h2 class="h4 mb-3">Kết quả tìm kiếm cho: <strong><c:out value="${keyword}" /></strong></h2>

    <p class="text-muted">Tìm thấy <strong>${fn:length(events)}</strong> sự kiện</p>

    <c:if test="${empty events}">
        <div class="alert alert-warning" role="alert">
            Không tìm thấy sự kiện nào phù hợp.
        </div>
    </c:if>

    <c:if test="${not empty events}">
        <div class="card shadow-sm mb-3">
            <div class="table-responsive">
                <table class="table table-striped table-hover mb-0">
                    <thead class="thead-light">
                        <tr>
                            <th>STT</th>
                            <th>Tên</th>
                            <th>Ngày</th>
                            <th>Giá</th>
                            <th>Vé còn</th>
                            <th>Hành động</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="event" items="${events}" varStatus="st">
                            <tr>
                                <td>${st.count}</td>
                                <td>
                                    <c:out value="${event.name}" />
                                </td>
                                <td>${event.eventDate}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${event.price == 0}">
                                            <span class="badge badge-success">MIỄN PHÍ</span>
                                        </c:when>
                                        <c:otherwise>
                                            <fmt:formatNumber value="${event.price}" type="number"/>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${event.remainingTickets == 0}">
                                            <span class="badge badge-danger">HẾT VÉ</span>
                                        </c:when>
                                        <c:when test="${event.remainingTickets < 10}">
                                            <span class="badge badge-warning text-dark">
                                                Sắp hết (${event.remainingTickets} vé)
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="badge badge-info">${event.remainingTickets}</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${event.remainingTickets == 0}">
                                            <button class="btn btn-sm btn-secondary" disabled>Đặt vé</button>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="<c:url value='/events/${event.id}/book'/>" class="btn btn-sm btn-primary">
                                                Đặt vé
                                            </a>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </c:if>

    <c:if test="${not empty events}">
        <div class="card bg-light mb-3">
            <div class="card-body">
                <p class="mb-0">
                    <strong>Sự kiện đầu tiên:</strong>
                    ${fn:toUpperCase(events[0].name)}
                </p>
            </div>
        </div>
    </c:if>

    <p class="text-muted small">Độ dài từ khóa: <strong>${fn:length(keyword)}</strong> ký tự</p>
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
