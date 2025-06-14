<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="main-content">
    <h3 class="mb-4">
        <c:choose>
            <c:when test="${user.maNguoiDung != null}">
                Edit User
            </c:when>
            <c:otherwise>
                Add New User
            </c:otherwise>
        </c:choose>
    </h3>
    <form:form modelAttribute="user" method="post" cssClass="needs-validation">
        <form:hidden path="maNguoiDung" />
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
            <form:label path="vaiTro" cssClass="form-label">Role</form:label>
            <form:select path="vaiTro" cssClass="form-select">
                <form:option value="volunteer">Volunteer</form:option>
                <form:option value="coordinator">Coordinator</form:option>
            </form:select>
        </div>
        <div class="mb-3">
            <form:label path="tenNguoiDung" cssClass="form-label">Name</form:label>
            <form:input path="tenNguoiDung" cssClass="form-control" required="true"/>
            <div class="invalid-feedback">Please enter a name.</div>
        </div>
        <div class="mb-3">
            <form:label path="soDienThoai" cssClass="form-label">Phone</form:label>
            <form:input path="soDienThoai" cssClass="form-control" type="tel"/>
        </div>
        <div class="mb-3">
            <form:label path="diaChi" cssClass="form-label">Address</form:label>
            <form:input path="diaChi" cssClass="form-control"/>
        </div>
        <div class="mb-3">
            <form:label path="ngonNguUuTien" cssClass="form-label">Language Preference</form:label>
            <form:input path="ngonNguUuTien" cssClass="form-control"/>
        </div>
        <button type="submit" class="btn btn-primary">
            <c:choose>
                <c:when test="${user.maNguoiDung != null}">
                    Update
                </c:when>
                <c:otherwise>
                    Save
                </c:otherwise>
            </c:choose>
        </button>
        <a href="<c:url value='/admin/users' />" class="btn btn-secondary">Cancel</a>
    </form:form>
</div>