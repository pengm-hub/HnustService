<%--
  Created by IntelliJ IDEA.
  User: Mia
  Date: 2021/3/23
  Time: 21:17
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta character="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- CSS -->
    <link rel="stylesheet" href="${ctx}/resource/css/bootstrap-reboot.min.css">
    <link rel="stylesheet" href="${ctx}/resource/css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="${ctx}/resource/css/magnific-popup.css">
    <link rel="stylesheet" href="${ctx}/resource/css/select2.min.css">
    <link rel="stylesheet" href="${ctx}/resource/css/admin.css">
    <!-- Favicons -->
    <link rel="icon" type="image/png" href="${ctx}/resource/icon/favicon-32x32.png" sizes="32x32">
    <link rel="apple-touch-icon" href="${ctx}/resource/icon/favicon-32x32.png">
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="author" content="Dmitry Volkov">
    <title>Web Service</title>
</head>

<body>

<!-- sidebar -->
<div class="sidebar">
    <!-- sidebar logo -->
    <a href="${ctx}/login/uIndex" class="sidebar__logo">
<%--        <img src="${ctx}/resource/img/logo.svg" alt="">--%>
        <h1>Web Service</h1>
    </a>
    <!-- end sidebar logo -->

    <!-- sidebar user -->
    <div class="sidebar__user">
        <div class="sidebar__user-img">
            <img src="${ctx}/resource/img/user.svg" alt="">
        </div>

        <div class="sidebar__user-title">
                <c:if test="${userId!=null}">
                    <span>Hello</span>
                    <a class="nav-link" href="${ctx}/user/view"><p>${username}</p></a>
                </c:if>
                <c:if test="${userId==null}">
                    <li class="nav-item">
                        <a class="nav-link" href="${ctx}/login/uLogin">Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${ctx}/login/res">Register</a>
                    </li>
                </c:if>
        </div>

        <c:if test="${userId!=null}">
            <button class="sidebar__user-btn" type="button">
                <a href="${ctx}/login/uTui"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M4,12a1,1,0,0,0,1,1h7.59l-2.3,2.29a1,1,0,0,0,0,1.42,1,1,0,0,0,1.42,0l4-4a1,1,0,0,0,.21-.33,1,1,0,0,0,0-.76,1,1,0,0,0-.21-.33l-4-4a1,1,0,1,0-1.42,1.42L12.59,11H5A1,1,0,0,0,4,12ZM17,2H7A3,3,0,0,0,4,5V8A1,1,0,0,0,6,8V5A1,1,0,0,1,7,4H17a1,1,0,0,1,1,1V19a1,1,0,0,1-1,1H7a1,1,0,0,1-1-1V16a1,1,0,0,0-2,0v3a3,3,0,0,0,3,3H17a3,3,0,0,0,3-3V5A3,3,0,0,0,17,2Z"/></svg></a>
            </button>
        </c:if>
    </div>
    <!-- end sidebar user -->

    <ul class="sidebar__nav">
        <li class="sidebar__nav-item">
            <a href="${ctx}/login/uIndex" class="sidebar__nav-link"><span>Dashboard</span></a>
        </li>
        <li class="sidebar__nav-item">
            <a href="${ctx}/webapi/webApiList" class="sidebar__nav-link"><span>Web APIs</span></a>
        </li>
        <li class="sidebar__nav-item">
            <a href="${ctx}/mashup/mashupList" class="sidebar__nav-link"><span>Mashups</span></a>
        </li>
        <li class="sidebar__nav-item">
            <a href="${ctx}/network/serviceNetwork" class="sidebar__nav-link"><span>Networks</span></a>
        </li>
        <li class="sidebar__nav-item">
            <a href="${ctx}/cluster/ApiClusterByLDA" class="sidebar__nav-link"><span>Clusters</span></a>
        </li>
        <li class="sidebar__nav-item">
            <a href="${ctx}/rapidapi/rapidMashup" class="sidebar__nav-link"><span>Rapid Mashup</span></a>
        </li>
        <li class="sidebar__nav-item">
            <a href="${ctx}/login/uIndex" class="sidebar__nav-link"><span>About</span></a>
        </li>
        <li class="sidebar__nav-item">
            <a href="${ctx}/user/view" class="sidebar__nav-link"><span>Setting</span></a>
        </li>
    </ul>
    <div style="margin-top: 90px;">
        <div>
            <div style="margin-top: 6px;">© Copyright pengm12138@gmail.com 2021-2022</div>
            <div style="margin-top: 6px;">京公网安备 xxxxxxxxxx号 </div>
        </div>
    </div>
</div>
<!-- end sidebar -->

<!-- JS -->
<script type="text/javascript">
    $(function () {
        $(".sidebar__nav-link").click(function () {
            $(this).removeClass("sidebar__nav-link");
            $(this).addClass("sidebar__nav-link sidebar__nav-link--active");
            $(this).siblings().removeClass("sidebar__nav-link sidebar__nav-link--active");
            $(this).siblings().addClass("sidebar__nav-link");
        });
    });
</script>
<script src="${ctx}/resource/js/jquery-3.5.1.min.js"></script>
<script src="${ctx}/resource/js/bootstrap.bundle.min.js"></script>
<script src="${ctx}/resource/js/jquery.magnific-popup.min.js"></script>
<script src="${ctx}/resource/js/smooth-scrollbar.js"></script>
<script src="${ctx}/resource/js/select2.min.js"></script>
<script src="${ctx}/resource/js/admin.js"></script>
</body>
</html>
