<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Đăng nhập - VolunteerSync</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .login-container {
                max-width: 400px;
                margin: 50px auto;
                padding: 20px;
                border: 1px solid #dee2e6;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>
    <body>
        <div class="login-container">
            <h2 class="text-center mb-4">Đăng nhập</h2>
            <form action="${pageContext.request.contextPath}/login" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="${param.email}" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Mật khẩu</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <button type="submit" class="btn btn-primary w-100 mb-3">Đăng nhập</button>
                <a href="${pageContext.request.contextPath}/forgot-password" class="text-decoration-none">Quên mật khẩu?</a>
            </form>
            <p class="text-center mt-3">Chưa có tài khoản? <a href="${pageContext.request.contextPath}/register" class="text-decoration-none">Đăng ký ngay</a></p>
        </div>
    </body>
</html>
