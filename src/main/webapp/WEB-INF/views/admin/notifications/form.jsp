<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<div class="main-content">
    <h3 class="mb-4">
        <c:choose>
            <c:when test="${notification.maThongBao != null}">
                Edit Notification
            </c:when>
            <c:otherwise>
                Add New Notification
            </c:otherwise>
        </c:choose>
    </h3>

    <form:form modelAttribute="notification" method="post" cssClass="needs-validation">
        <form:hidden path="maThongBao" />

        <!-- Ng??i dùng -->
        <div class="mb-3">
            <form:label path="nguoiDung.maNguoiDung" cssClass="form-label">User</form:label>
            <form:select path="nguoiDung.maNguoiDung" cssClass="form-select" required="true">
                <c:forEach items="${users}" var="u">
                    <form:option value="${u.maNguoiDung}">${u.tenNguoiDung}</form:option>
                </c:forEach>
            </form:select>
        </div>

        <!-- Ho?t ??ng (có th? null) -->
        <div class="mb-3">
            <form:label path="hoatDong.maHoatDong" cssClass="form-label">Activity (optional)</form:label>
            <form:select path="hoatDong.maHoatDong" cssClass="form-select">
                <form:option value="">-- None --</form:option>
                <c:forEach items="${activities}" var="a">
                    <form:option value="${a.maHoatDong}">${a.tieuDe}</form:option>
                </c:forEach>
            </form:select>
        </div>

        <!-- N?i dung -->
        <div class="mb-3">
            <form:label path="noiDung" cssClass="form-label">Message</form:label>
            <form:textarea path="noiDung" cssClass="form-control" required="true" />
        </div>

        <!-- Ngày g?i -->
        <div class="mb-3">
            <form:label path="ngayGui" cssClass="form-label">Sent At</form:label>
            <form:input path="ngayGui" type="datetime-local" cssClass="form-control" />
        </div>

        <button type="submit" class="btn btn-primary">
            <c:choose>
                <c:when test="${notification.maThongBao != null}">
                    Update
                </c:when>
                <c:otherwise>
                    Save
                </c:otherwise>
            </c:choose>
        </button>
        <a href="<c:url value='/admin/notifications' />" class="btn btn-secondary">Cancel</a>
    </form:form>
</div>