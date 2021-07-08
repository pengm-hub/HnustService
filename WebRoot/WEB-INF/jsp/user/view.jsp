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
                    <h2>User Info</h2>
                </div>
                <form action="${ctx}/user/exUpdate" method="post" id="myf" style="width: 40%;margin-left: 50px">
<%--                        <div class="hidden_yh bj_fff" style="width: 1200px;border: 1px solid #ddd;">--%>
<%--                            <div class="width100 font24" style="height: 60px;line-height: 60px;text-indent: 50px; background: #f5f8fa;border-bottom: 1px solid #ddd;">User Info</div>--%>

                        <div class="stats">
                            <label for="validationCustomUsername"><span>Username</span></label>
                            <input type="text" class="sign__input"  name="realName" value="${obj.realName}" required>
                        </div>

                        <div class="stats">
                            <label for="validationCustomUsername"><span>Gender</span></label>
                            <select class="sign__input" name="sex">
                                <option value="男" ${obj.sex=='男'?'selected="selected"':''}>Male</option>
                                <option value="女" ${obj.sex=='女'?'selected="selected"':''}>Female</option>
                            </select>
                        </div>

                        <div class="stats">
                            <label for="validationCustomUsername"><span>Email</span></label>
                            <input type="text" class="sign__input"   name="email" value="${obj.email}" required>
                        </div>

                        <div class="stats">
                            <label for="validationCustomUsername"><span>Telephone</span></label>
                            <input type="text" class="sign__input"   name="phone" value="${obj.phone}" required>
                        </div>

                        <div class="stats">
                            <label for="validationCustomUsername"><span>Address</span></label>
                            <input type="text" class="sign__input"   name="address" value="${obj.address}" required>
                        </div>

                        <div class="stats">
                            <label for="validationCustomPassword"><span>Password</span></label>
                            <input type="text" class="sign__input"   name="passWord" value="${obj.passWord}" required>
                        </div>

                        <div class="width100" style="height: 32px;line-height: 32px;margin-top: 30px;margin-bottom: 50px">
                            <a href="javascript:void(0)" class="sign__btn sub">Save</a>
                        </div>
<%--                        </div>--%>
                </form>
            </div>
        </div>
    </div>
</main>


<script type="text/javascript">
    $(function () {
       $(".sub").click(function () {
           $("#myf").submit();
           alert("修改成功");
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

















