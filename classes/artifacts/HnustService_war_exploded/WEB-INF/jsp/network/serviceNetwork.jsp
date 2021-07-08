<%--
  Created by IntelliJ IDEA.
  User: Mia
  Date: 2021/5/10
  Time: 21:02
  To change this template use File | Settings | File Templates.
--%>
<%--
  Created by IntelliJ IDEA.
  User: Mia
  Date: 2021/3/23
  Time: 21:17
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
                    <h2>Service Nerwork</h2>
                </div>
            </div>
            <!-- end main title -->
            <iframe src="https://valarmorgs.cn/service_network/search/heterogeneous_network.jsp" style="margin-top: 100px;width: 100%; height: 1000px; transform: scale(1.2);"></iframe>

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
