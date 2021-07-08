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
    <meta charset="utf-8">
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
<%@include file="/common/utop.jsp"%>--%><!-- header -->

<!-- main content -->
<main class="main">
    <div class="container-fluid">
        <div class="row">
            <!-- main title -->
            <div class="col-12">
                <div class="main__title">
                    <h2>Dashboard</h2>
                </div>
            </div>
            <!-- end main title -->

            <!-- stats -->
            <div class="col-12 col-sm-6 col-xl-3">
                <div class="stats">
                    <span>Web APIs</span>
                    <p>20106</p>
                </div>
            </div>
            <!-- end stats -->

            <!-- stats -->
            <div class="col-12 col-sm-6 col-xl-3">
                <div class="stats">
                    <span>Mashups</span>
                    <p>6970</p>
                </div>
            </div>
            <!-- end stats -->

            <!-- stats -->
            <div class="col-12 col-sm-6 col-xl-3">
                <div class="stats">
                    <span>Tags</span>
                    <p>573</p>
                </div>
            </div>
            <!-- end stats -->

            <!-- stats -->
            <div class="col-12 col-sm-6 col-xl-3">
                <div class="stats">
                    <span>Others</span>
                    <p>0</p>
                </div>
            </div>
            <!-- end stats -->

            <!-- dashbox -->
            <div class="col-12 col-xl-6">
                <div class="dashbox">
                    <div class="dashbox__title">
                        <h3><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12,6a1,1,0,0,0-1,1V17a1,1,0,0,0,2,0V7A1,1,0,0,0,12,6ZM7,12a1,1,0,0,0-1,1v4a1,1,0,0,0,2,0V13A1,1,0,0,0,7,12Zm10-2a1,1,0,0,0-1,1v6a1,1,0,0,0,2,0V11A1,1,0,0,0,17,10Zm2-8H5A3,3,0,0,0,2,5V19a3,3,0,0,0,3,3H19a3,3,0,0,0,3-3V5A3,3,0,0,0,19,2Zm1,17a1,1,0,0,1-1,1H5a1,1,0,0,1-1-1V5A1,1,0,0,1,5,4H19a1,1,0,0,1,1,1Z"/></svg> Top APIs</h3>

                        <div class="dashbox__wrap">
                            <a class="dashbox__more" href="${ctx}/webapi/webApiList">View All</a>
                        </div>
                    </div>

                    <div class="dashbox__table-wrap dashbox__table-wrap--1">
                        <table class="main__table main__table--dash">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>API Name</th>
                                <th>CATEGORY</th>
                                <th>Tags</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><div class="main__table-text">321</div></td>
                                <td><div class="main__table-text"><a href="#">I Dream in Another Language</a></div></td>
                                <td><div class="main__table-text">Movie</div></td>
                                <td><div class="main__table-text main__table-text--rate">9.2</div></td>
                            </tr>
                            <tr>
                                <td><div class="main__table-text">321</div></td>
                                <td><div class="main__table-text"><a href="#">I Dream in Another Language</a></div></td>
                                <td><div class="main__table-text">Movie</div></td>
                                <td><div class="main__table-text main__table-text--rate">9.2</div></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- end dashbox -->

            <!-- dashbox -->
            <div class="col-12 col-xl-6">
                <div class="dashbox">
                    <div class="dashbox__title">
                        <h3><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M10,13H3a1,1,0,0,0-1,1v7a1,1,0,0,0,1,1h7a1,1,0,0,0,1-1V14A1,1,0,0,0,10,13ZM9,20H4V15H9ZM21,2H14a1,1,0,0,0-1,1v7a1,1,0,0,0,1,1h7a1,1,0,0,0,1-1V3A1,1,0,0,0,21,2ZM20,9H15V4h5Zm1,4H14a1,1,0,0,0-1,1v7a1,1,0,0,0,1,1h7a1,1,0,0,0,1-1V14A1,1,0,0,0,21,13Zm-1,7H15V15h5ZM10,2H3A1,1,0,0,0,2,3v7a1,1,0,0,0,1,1h7a1,1,0,0,0,1-1V3A1,1,0,0,0,10,2ZM9,9H4V4H9Z"/></svg> Top Mashups</h3>

                        <div class="dashbox__wrap">
                            <a class="dashbox__more" href="${ctx}/mashup/mashupList">View All</a>
                        </div>
                    </div>

                    <div class="dashbox__table-wrap dashbox__table-wrap--1">
                        <table class="main__table main__table--dash">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Mashup Name</th>
                                <th>CATEGORY</th>
                                <th>Tags</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><div class="main__table-text">321</div></td>
                                <td><div class="main__table-text"><a href="#">I Dream in Another Language</a></div></td>
                                <td><div class="main__table-text">Movie</div></td>
                                <td><div class="main__table-text main__table-text--rate">9.2</div></td>
                            </tr>
                            <tr>
                                <td><div class="main__table-text">321</div></td>
                                <td><div class="main__table-text"><a href="#">I Dream in Another Language</a></div></td>
                                <td><div class="main__table-text">Movie</div></td>
                                <td><div class="main__table-text main__table-text--rate">9.2</div></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- end dashbox -->
            <iframe src="https://valarmorgs.cn/service_network/search/statistics.jsp" style="margin-top: 200px;width: 100%; height: 600px; transform: scale(1.5);"></iframe>

        </div>
    </div>

<script src="${ctx}/resource/js/jquery-3.5.1.min.js"></script>
<script src="${ctx}/resource/js/bootstrap.bundle.min.js"></script>
<script src="${ctx}/resource/js/jquery.magnific-popup.min.js"></script>
<script src="${ctx}/resource/js/smooth-scrollbar.js"></script>
<script src="${ctx}/resource/js/select2.min.js"></script>
<script src="${ctx}/resource/js/admin.js"></script>
</body>
</html>
