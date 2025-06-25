<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<div class="main-content container mt-4">
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

    <form:form modelAttribute="activity" method="post" cssClass="needs-validation" novalidate="true">
        <form:hidden path="maHoatDong" />

        <!-- Error messages -->
        <c:if test="${not empty errors}">
            <div class="alert alert-danger">
                <ul>
                    <c:forEach items="${errors}" var="error">
                        <li><spring:message message="${error}" /></li>
                        </c:forEach>
                </ul>
            </div>
        </c:if>

        <!-- Tiêu ?? -->
        <div class="mb-3">
            <form:label path="tieuDe" cssClass="form-label fw-bold">Title</form:label>
            <form:input path="tieuDe" cssClass="form-control" required="true" placeholder="Enter activity title" />
            <form:errors path="tieuDe" cssClass="invalid-feedback d-block" />
            <div class="invalid-feedback">
                Please enter the activity title.
            </div>
        </div>

        <!-- Mô t? -->
        <div class="mb-3">
            <form:label path="moTa" cssClass="form-label fw-bold">Description</form:label>
            <form:textarea path="moTa" cssClass="form-control" rows="5" placeholder="Enter activity description" />
            <form:errors path="moTa" cssClass="invalid-feedback d-block" />
        </div>

        <!-- Ngày gi? -->
        <div class="mb-3">
            <form:label path="ngayGio" cssClass="form-label fw-bold">Date and Time</form:label>
            <form:input path="ngayGio" type="datetime-local" cssClass="form-control" required="true" />
            <form:errors path="ngayGio" cssClass="invalid-feedback d-block" />
            <div class="invalid-feedback">
                Please select the date and time of the activity.
            </div>
        </div>

        <!-- ??a ?i?m -->
        <div class="mb-3">
            <form:label path="diaDiem" cssClass="form-label fw-bold">Location</form:label>
            <form:input path="diaDiem" cssClass="form-control" placeholder="Enter activity location" />
            <form:errors path="diaDiem" cssClass="invalid-feedback d-block" />
        </div>

        <!-- S? l??ng t?i ?a -->
        <div class="mb-3">
            <form:label path="soLuongToiDa" cssClass="form-label fw-bold">Max Participants</form:label>
            <form:input path="soLuongToiDa" type="number" min="1" cssClass="form-control" required="true" placeholder="Enter maximum number of participants" />
            <form:errors path="soLuongToiDa" cssClass="invalid-feedback d-block" />
            <div class="invalid-feedback">
                Please enter a valid number of maximum participants.
            </div>
        </div>

        <!-- ?i?u ph?i viên -->
        <div class="mb-3">
            <form:label path="dieuPhoiVien.maNguoiDung" cssClass="form-label fw-bold">Coordinator</form:label>
            <form:select path="dieuPhoiVien.maNguoiDung" cssClass="form-select" required="true">
                <form:option value="" label="-- Select Coordinator --" />
                <form:options items="${users}" itemValue="maNguoiDung" itemLabel="tenNguoiDung" />
            </form:select>
            <form:errors path="dieuPhoiVien.maNguoiDung" cssClass="invalid-feedback d-block" />
            <div class="invalid-feedback">
                Please select a coordinator.
            </div>
        </div>

        <!-- Hình ?nh -->
        <div class="mb-3">
            <form:label path="hinhAnh" cssClass="form-label fw-bold">Image URL (optional)</form:label>
            <form:input path="hinhAnh" cssClass="form-control" placeholder="Enter AWS S3 image URL" />
            <form:errors path="hinhAnh" cssClass="invalid-feedback d-block" />
        </div>

        <!-- Buttons -->
        <div class="mb-3">
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
            <a href="<c:url value='/admin/activities' />" class="btn btn-secondary ms-2">Cancel</a>
        </div>
    </form:form>
</div>
