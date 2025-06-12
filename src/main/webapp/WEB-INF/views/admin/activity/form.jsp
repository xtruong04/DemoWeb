<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="main-content">
    <h3 class="mb-4">
        <c:choose>
            <c:when test="${activity.maHoatDong != null}">
                Edit Activity
            </c:when>
            <c:otherwise>
                Add New Activity
            </c:otherwise>
        </c:choose>
    </h3>
    <form:form modelAttribute="activity" method="post" cssClass="needs-validation">
        <form:hidden path="maHoatDong" />
        <div class="mb-3">
            <form:label path="tieuDe" cssClass="form-label">Title</form:label>
            <form:input path="tieuDe" cssClass="form-control" required="true"/>
        </div>
        <div class="mb-3">
            <form:label path="moTa" cssClass="form-label">Description</form:label>
            <form:textarea path="moTa" cssClass="form-control"/>
        </div>
        <div class="mb-3">
            <form:label path="ngayGio" cssClass="form-label">Date and Time</form:label>
            <form:input path="ngayGio" cssClass="form-control" type="datetime-local" required="true"/>
        </div>
        <div class="mb-3">
            <form:label path="diaDiem" cssClass="form-label">Location</form:label>
            <form:input path="diaDiem" cssClass="form-control"/>
        </div>
        <div class="mb-3">
            <form:label path="soLuongToiDa" cssClass="form-label">Max Participants</form:label>
            <form:input path="soLuongToiDa" cssClass="form-control" type="number" required="true"/>
        </div>
        <div class="mb-3">
            <form:label path="dieuPhoiVien" cssClass="form-label">Coordinator</form:label>
            <form:select path="dieuPhoiVien.maNguoiDung" cssClass="form-select">
                <c:forEach items="${users}" var="user">
                    <form:option value="${user.maNguoiDung}">${user.tenNguoiDung} (${user.email})</form:option>
                </c:forEach>
            </form:select>
        </div>
        <div class="mb-3">
            <form:label path="hinhAnh" cssClass="form-label">Image URL</form:label>
            <form:input path="hinhAnh" cssClass="form-control"/>
        </div>
        <button type="submit" class="btn btn-primary">
            <c:choose>
                <c:when test="${activity.maHoatDong != null}">
                    Update
                </c:when>
                <c:otherwise>
                    Save
                </c:otherwise>
            </c:choose>
        </button>
        <a href="<c:url value='/activities' />" class="btn btn-secondary">Cancel</a>
    </form:form>
</div>