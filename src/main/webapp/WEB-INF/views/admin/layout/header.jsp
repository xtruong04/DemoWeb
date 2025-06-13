<%-- 
    Document   : header
    Created on : Jun 11, 2025, 2:25:46 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
    <!-- Bootstrap 5 JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"></script>
    <style>
        body {
            min-height: 100vh;
            background: #f8f9fa;
            margin: 0;
            padding: 0;
        }

        /* Sidebar */
        .sidebar {
            width: 250px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            background: #2c3e50;
            color: #fff;
            padding: 20px;
            transition: transform 0.3s ease;
            z-index: 1000;
        }

        .sidebar h2 {
            font-size: 24px;
            margin-bottom: 20px;
            text-align: center;
        }

        .sidebar .nav-link {
            color: #fff;
            border-radius: 5px;
            margin-bottom: 10px;
            padding: 10px 15px;
        }

        .sidebar .nav-link:hover {
            background: #34495e;
        }

        .sidebar .nav-link.active {
            background: #34495e;
            font-weight: bold;
        }

        /* Main Content */
        .main-content {
            margin-left: 250px;
            padding: 20px;
            width: calc(100% - 250px);
            min-height: calc(100vh - 56px); /* Điều chỉnh để khớp với navbar */
        }

        /* Top Navigation */
        .navbar {
            margin-left: 250px;
            width: calc(100% - 250px);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-250px);
            }

            .sidebar.active {
                transform: translateX(0);
            }

            .navbar {
                margin-left: 0;
                width: 100%;
            }

            .main-content {
                margin-left: 0;
                width: 100%;
            }
        }

        /* Toggle Button */
        .toggle-btn {
            border: none;
            background: transparent;
        }

        .toggle-btn:focus {
            outline: none;
            box-shadow: none;
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <h2>Admin Panel</h2>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link ${param.active == 'dashboard' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/dashboard">
                    <i class="fas fa-tachometer-alt me-2"></i> Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${param.active == 'activities' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/activities">
                    <i class="fas fa-file-alt me-2"></i> Activities
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${param.active == 'users' ? 'active' : ''}" href="${pageContext.request.contextPath}/admin/users">
                    <i class="fas fa-users me-2"></i> Users
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/logout">
                    <i class="fas fa-sign-out-alt me-2"></i> Logout
                </a>
            </li>
        </ul>
    </div>

    <!-- Top Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
        <div class="container-fluid">
            <button class="navbar-toggler toggle-btn" type="button" onclick="toggleSidebar()">
                <span class="navbar-toggler-icon"></span>
            </button>
            <form class="d-flex ms-auto">
                <input class="form-control me-2" type="search" placeholder="Search..." aria-label="Search">
                <button class="btn btn-outline-primary" type="submit"><i class="fas fa-search"></i></button>
            </form>
            <ul class="navbar-nav ms-3">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="https://via.placeholder.com/40" alt="User Avatar" class="rounded-circle me-2" style="width: 40px; height: 40px;">
                        <span><c:out value="${sessionScope.currentUser.email}" /></span>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/admin/profile">Profile</a></li>
                        <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="main-content">
        <jsp:include page="${body}" />
    </div>

    <script>
        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            sidebar.classList.toggle('active');
        }
    </script>
</body>
</html>
