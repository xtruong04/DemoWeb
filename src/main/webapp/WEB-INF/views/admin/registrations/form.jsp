<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Form</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <nav class="col-md-2 d-none d-md-block bg-dark sidebar">
                    <div class="sidebar-sticky">
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link active text-white" href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white" href="${pageContext.request.contextPath}/admin/registrations">Registrations</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white" href="${pageContext.request.contextPath}/admin/users">Users</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-white" href="${pageContext.request.contextPath}/logout">Logout</a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
                    <div class="main-content">
                        <h3 class="mb-4">
                            <c:choose>
                                <c:when test="${registration.maDangKy != null}">
                                    Edit Registration
                                </c:when>
                                <c:otherwise>
                                    Add New Registration
                                </c:otherwise>
                            </c:choose>
                        </h3>
                        <form:form modelAttribute="registration" method="post" class="needs-validation">
                            <form:hidden path="maDangKy" />
                            <div class="mb-3">
                                <form:label path="nguoiDung.maNguoiDung" cssClass="form-label">Người dùng</form:label>
                                <form:select path="nguoiDung.maNguoiDung" cssClass="form-select" required="true">
                                    <c:forEach items="${users}" var="user">
                                        <form:option value="${user.maNguoiDung}">${user.tenNguoiDung}</form:option>
                                    </c:forEach>
                                </form:select>
                            </div>
                            <div class="mb-3">
                                <form:label path="hoatDong.maHoatDong" cssClass="form-label">Hoạt động</form:label>
                                <form:select path