<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Online Volunteer Coor</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
              rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary mb-3">
            <div class="container-fluid">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/">Volunterr Activity</a>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item"><a class="nav-link"
                                                href="${pageContext.request.contextPath}/activities">Hoạt động</a></li>
                        <li class="nav-item"><a class="nav-link"
                                                href="${pageContext.request.contextPath}/users">Người dùng</a></li>
                        <li class="nav-item"><a class="nav-link"
                                                href="${pageContext.request.contextPath}/registrations">Đăng ký</a></li>
                        <li class="nav-item"><a class="nav-link"
                                                href="${pageContext.request.contextPath}/ratings">Đánh giá</a></li>
                        <li class="nav-item"><a class="nav-link"
                                                href="${pageContext.request.contextPath}/notifications">Thông báo</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <!-- Nội dung chính sẽ được thêm vào đây -->
        </div>
    </body>
</html>