<%-- 
    Document   : list
    Created on : Jun 13, 2025, 11:06 PM
    Author     : ADMIN
--%>
<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="main-content">
    <h1 class="mb-4">Rating</h1>
    <div class="card">
        <div class="card-body">
            <h3 class="card-title">Rating List</h3>
            <div class="d-flex justify-content-between align-items-center mb-3">
                <div></div>
            </div>
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Mã Đánh giá</th>
                        <th>Người dùng</th>
                        <th>Hoạt động</th>
                        <th>Điểm số</th>
                        <th>Bình luận</th>
                        <th>Hành động</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="r" items="${ratings}">
                        <tr>
                            <td>${r.maDanhGia}</td>
                            <td>${r.nguoiDung.tenNguoiDung}</td>
                            <td>${r.hoatDong.tieuDe}</td>
                            <td>${r.diemDanhGia}</td>
                            <td>${r.binhLuan}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin/ratings/edit/${r.maDanhGia}" class="btn btn-sm btn-primary">Sửa</a>
                                <a href="${pageContext.request.contextPath}/admin/ratings/delete/${r.maDanhGia}" class="btn btn-sm btn-danger" onclick="return confirm('Bạn chắc chắn muốn xóa?')">Xóa</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>