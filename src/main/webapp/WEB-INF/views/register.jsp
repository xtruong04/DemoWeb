<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Đăng ký - VolunteerSync</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            .register-container {
                max-width: 500px;
                margin: 50px auto;
                padding: 20px;
                border: 1px solid #dee2e6;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>
    <body>
        <div class="register-container">
            <h2 class="text-center mb-4">Đăng ký</h2>
            <form action="${pageContext.request.contextPath}/register" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" name="email" value="${param.email}" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Mật khẩu</label>
                    <input type="password" class="form-control" id="password" name="matKhau" required>
                </div>
                <div class="mb-3">
                    <label for="name" class="form-label">Tên người dùng</label>
                    <input type="text" class="form-control" id="name" name="tenNguoiDung" value="${param.tenNguoiDung}" required>
                </div>
                <div class="mb-3">
                    <label for="phone" class="form-label">Số điện thoại</label>
                    <input type="tel" class="form-control" id="phone" name="soDienThoai" value="${param.soDienThoai}" required>
                </div>
                <div class="mb-3">
                    <label for="address" class="form-label">Địa chỉ</label>
                    <input type="text" class="form-control" id="address" name="diaChi" value="${param.diaChi}">
                </div>
                <div class="mb-3">
                    <label for="language" class="form-label">Ngôn ngữ ưu tiên</label>
                    <input type="text" class="form-control" id="language" name="ngonNguUuTien" value="${param.ngonNguUuTien}">
                </div>
                <button type="submit" class="btn btn-primary w-100 mb-3">Đăng ký</button>
                <p class="text-center mt-3">Đã có tài khoản? <a href="${pageContext.request.contextPath}/login" class="text-decoration-none">Đăng nhập ngay</a></p>
            </form>
        </div>
    </body>
</html>
