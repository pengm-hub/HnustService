<%--
  Created by IntelliJ IDEA.
  User: Mia
  Date: 2021/3/23
  Time: 21:28
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
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

    <title>Web Service</title>

</head>
<body>
<!-- header -->
<%@include file="/common/utop.jsp"%>

<!-- main content -->
<main class="main">
    <div class="container-fluid">
        <div class="row">
            <!-- main title -->
            <div class="col-12">
                <div class="main__title">
                    <h2>${webapi.api_name}</h2>
                </div>
            </div>
            <!-- end main title -->

            <!-- users -->
            <div class="col-12">
                <div class="main__title">
                    <span class="main__title-stat">类别： ${webapi.api_category}</span>
                    <span class="main__title-stat">标签： ${webapi.api_tags}</span>
                    <span class="main__title-stat">Url： ${webapi.api_url}</span>
                    <span class="main__title-stat">描述： ${webapi.api_describe}</span>
                    <span class="main__title-stat">Protocol： ${webapi.api_protocol}</span>
                    <span class="main__title-stat">Followers： ${webapi.api_followers}</span>
                </div>
            </div>

        </div>
    </div>
</main>
<script src="${ctx}/resource/js/jquery-3.5.1.min.js"></script>
<script src="${ctx}/resource/js/bootstrap.bundle.min.js"></script>
<script src="${ctx}/resource/js/jquery.magnific-popup.min.js"></script>
<script src="${ctx}/resource/js/smooth-scrollbar.js"></script>
<script src="${ctx}/resource/js/select2.min.js"></script>
<script src="${ctx}/resource/js/admin.js"></script>
</body>
</html>
