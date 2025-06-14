<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<div class="main-content">
    <h3 class="mb-4">Admin Dashboard</h3>

    <!-- Th?ng kê t?ng quan -->
    <div class="row mb-4">
        <div class="col-md-3">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Activities</h5>
                    <p class="card-text">${totalActivities}</p>
                    <a href="<c:url value='/admin/activities' />" class="btn btn-primary btn-sm">View All</a>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Users</h5>
                    <p class="card-text">${totalUsers}</p>
                    <a href="<c:url value='/admin/users' />" class="btn btn-primary btn-sm">View All</a>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Registrations</h5>
                    <p class="card-text">${totalRegistrations}</p>
                    <a href="<c:url value='/admin/registrations' />" class="btn btn-primary btn-sm">View All</a>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Notifications</h5>
                    <p class="card-text">${totalNotifications}</p>
                    <a href="<c:url value='/admin/notifications' />" class="btn btn-primary btn-sm">View All</a>
                </div>
            </div>
        </div>
        <div class="col-md-3 mt-3">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Ratings</h5>
                    <p class="card-text">${totalRatings}</p>
                    <a href="<c:url value='/admin/ratings' />" class="btn btn-primary btn-sm">View All</a>
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