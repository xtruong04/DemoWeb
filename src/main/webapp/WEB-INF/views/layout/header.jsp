<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Charifit - Volunteer</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/img/favicon.png">
        <!-- CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/themify-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/gijgo.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/slicknav.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
        <style>
            html {
                scroll-behavior: smooth;
            }
        </style>
    </head>
    <body>

        <!-- Header -->
        <header>
            <div class="header-area">
                <div class="header-top_area">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-6 col-md-12 col-lg-8">
                                <div class="short_contact_list">
                                    <ul>
                                        <li><a href="#"><i class="fa fa-phone"></i> +84 9821710860</a></li>
                                        <li><a href="#"><i class="fa fa-envelope"></i> volunteercoor@gmail.com</a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-xl-6 col-md-6 col-lg-4">
                                <div class="social_media_links d-none d-lg-block">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-pinterest-p"></i></a>
                                    <a href="#"><i class="fa fa-linkedin"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="sticky-header" class="main-header-area">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col-xl-3 col-lg-3">
                                <div class="logo">
                                    <a href="${pageContext.request.contextPath}/">
                                        <img src="${pageContext.request.contextPath}/resources/img/logo.png" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col-xl-9 col-lg-9">
                                <div class="main-menu">
                                    <nav>
                                        <ul id="navigation">
                                            <li><a href="${pageContext.request.contextPath}/">Home</a></li>
                                            <li><a href="#about">About</a></li>
                                            <li><a href="#news">News</a></li>
                                            <li><a href="#causes">Causes</a></li>
                                            <li><a href="#volunteers">Volunteers</a></li>
                                        </ul>
                                    </nav>
                                    <div class="Appointment">
                                        <div class="book_btn d-none d-lg-block">
                                            <a data-scroll-nav='1' href="${pageContext.request.contextPath}/data?section=donation">Make a Donate</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
