<!-- /WEB-INF/views/registrations/form.jsp -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="container mt-4">
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
    <form:form modelAttribute="registration" method="post" cssClass="needs-validation">
        <form:hidden path="maDangKy" />
        <div class="mb-3">
            <form:label path="nguoiDung" cssClass="form-label">User</form:label>
            <form:select path="nguoiDung.maNguoiDung" cssClass="form-select" required="true">
                <c:forEach items="${users}" var="user">
                    <form:option value="${user.maNguoiDung}">${user.tenNguoiDung} (${user.email})</form:option>
                </c:forEach>
            </form:select>
        </div>
        <div class="mb-3">
            <form:label path="hoatDong" cssClass="form-label">Activity</form:label>
            <form:select path="hoatDong.maHoatDong" cssClass="form-select" required="true">
                <c:forEach items="${activities}" var="activity">
                    <form:option value="${activity.maHoatDong}">${activity.tieuDe}</form:option>
                </c:forEach>
            </form:select>
        </div>
        <div class="mb-3">
            <form:label path="ngayDangKy" cssClass="form-label">Registration Date</form:label>
            <form:input path="ngayDangKy" cssClass="form-control" type="datetime-local"/>
        </div>
        <div class="mb-3">
            <form:label path="trangThaiCheckIn" cssClass="form-label">Check-In Status</form:label>
            <form:checkbox path="trangThaiCheckIn" cssClass="form-check-input"/>
        </div>
        <button type="submit" class="btn btn-primary">
            <c:choose>
                <c:when test="${registration.maDangKy != null}">
                    Update
                </c:when>
                <c:otherwise>
                    Save
                </c:otherwise>
            </c:choose>
        </button>
        <a href="<c:url value='/registrations' />" class="btn btn-secondary">Cancel</a>
    </form:form>
</div>