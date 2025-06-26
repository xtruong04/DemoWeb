<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Không có quyền truy cập</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container mt-5">
            <div class="alert alert-danger text-center">
                <h4>Không có quyền truy cập</h4>
                <p>${errorMsg}</p>
                <a href="${pageContext.request.contextPath}/login" class="btn btn-primary">Quay lại đăng nhập</a>
            </div>
        </div>
    </body>
</html>
