<%-- 
    Document   : header
    Created on : Jun 11, 2025, 2:25:46 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" rel="stylesheet">
    <style>
        body {
            min-height: 100vh;
            background: #f8f9fa;
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
        }

        .sidebar .nav-link:hover {
            background: #34495e;
        }

        /* Main Content */
        .main-content {
            margin-left: 250px;
            padding: 20px;
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

            .main-content {
                margin-left: 0;
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <h2>Admin Panel</h2>
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link" href="#dashboard"><i class="fas fa-tachometer-alt me-2"></i> Dashboard</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#users"><i class="fas fa-users me-2"></i> Users</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#templates"><i class="fas fa-file-alt me-2"></i> Templates</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#analytics"><i class="fas fa-chart-bar me-2"></i> Analytics</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#settings"><i class="fas fa-cog me-2"></i> Settings</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#logout"><i class="fas fa-sign-out-alt me-2"></i> Logout</a>
            </li>
        </ul>
    </div>

    <!-- Top Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm" style="margin-left: 250px; width: calc(100% - 250px);">
        <div class="container-fluid">
            <button class="navbar-toggler toggle-btn" type="button">
                <span class="navbar-toggler-icon"></span>
            </button>
            <form class="d-flex ms-auto">
                <input class="form-control me-2" type="search" placeholder="Search..." aria-label="Search">
                <button class="btn btn-outline-primary" type="submit"><i class="fas fa-search"></i></button>
            </form>
            <ul class="navbar-nav ms-3">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-bs-toggle="dropdown">
                        <img src="https://via.placeholder.com/40" alt="User Avatar" class="rounded-circle me-2" style="width: 40px; height: 40px;">
                        Admin User
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="userDropdown">
                        <li><a class="dropdown-item" href="#profile">Profile</a></li>
                        <li><a class="dropdown-item" href="#logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Main Content -->
    
