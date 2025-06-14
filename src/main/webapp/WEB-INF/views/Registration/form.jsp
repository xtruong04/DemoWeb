<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-body">
                        <h3 class="card-title text-center mb-4">Register</h3>
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger">${error}</div>
                        </c:if>
                        <c:if test="${not empty message}">
                            <div class="alert alert-success">${message}</div>
                        </c:if>
                        <form:form modelAttribute="user" method="post" action="${pageContext.request.contextPath}/register" cssClass="needs-validation" novalidate="true">
                            <div class="mb-3">
                                <form:label path="email" cssClass="form-label">Email</form:label>
                                <form:input path="email" cssClass="form-control" type="email" required="true"/>
                                <div class="invalid-feedback">Please enter a valid email.</div>
                            </div>
                            <div class="mb-3">
                                <form:label path="matKhau" cssClass="form-label">Password</form:label>
                                <form:input path="matKhau" cssClass="form-control" type="password" required="true"/>
                                <div class="invalid-feedback">Please enter a password.</div>
                            </div>
                            <div class="mb-3">
                                <form:label path="tenNguoiDung" cssClass="form-label">Full Name</form:label>
                                <form:input path="tenNguoiDung" cssClass="form-control" required="true"/>
                                <div class="invalid-feedback">Please enter your full name.</div>
                            </div>
                            <div class="mb-3">
                                <form:label path="soDienThoai" cssClass="form-label">Phone Number</form:label>
                                <form:input path="soDienThoai" cssClass="form-control" type="tel"/>
                            </div>
                            <div class="mb-3">
                                <form:label path="diaChi" cssClass="form-label">Address</form:label>
                                <form:input path="diaChi" cssClass="form-control"/>
                            </div>
                            <div class="mb-3">
                                <form:label path="ngonNguUuTien" cssClass="form-label">Preferred Language</form:label>
                                <form:input path="ngonNguUuTien" cssClass="form-control"/>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Register</button>
                            <div class="text-center mt-3">
                                <a href="${pageContext.request.contextPath}/login" class="btn btn-secondary">Back to Login</a>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- JavaScript for Bootstrap validation -->
    <script>
        (function () {
            'use strict';
            var forms = document.querySelectorAll('.needs-validation');
            Array.prototype.slice.call(forms).forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        })();
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>