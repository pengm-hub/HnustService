<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
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
<div class="sign section--bg" data-bg="img/bg.jpg">
    <div class="container">
        <div class="row">
            <div class="col-12">
                <div class="sign__content">
                    <!-- registration form -->
                        <form action="${ctx}/login/toRes" method="post" class="sign__form">
                            <h1 style="color: #fff;margin-bottom: 20px">Register</h1>

                            <div  class="sign__group">
                                <p style="color: #fff">UserName:</p>
                                <input type="text" name="userName" placeholder="Name"  class="sign__input" >
                            </div>
                            <div class="sign__group">
                                <p style="color: #fff">Password:</p>
                                <input type="text" name="passWord" placeholder="Password"  class="sign__input" >
                            </div>
                            <div class="sign__group">
                                <p style="color: #fff">Telephone:</p>
                                <input type="text" name="phone" placeholder="Telephone"  class="sign__input" >
                            </div>
                            <div class="sign__group">
                                <p style="color: #fff">Email:</p>
                                <input type="text" name="email" placeholder="Email" class="sign__input" >
                            </div>
                            <!-- <div class="sign__group sign__group--checkbox">
								<input id="remember" name="remember" type="checkbox" checked="checked">
								<label for="remember">I agree to the <a href="#">Privacy policy</a></label>
							</div> -->
<%--                            <input type="submit" value="提交" class="ipt_tj" style="width: 295px;height: 44px;margin-left: 500px;">--%>
                            <button class="sign__btn" type="submit">Sign up</button>
                            <span class="sign__text">Already have an account? <a href="${ctx}/login/uLogin">Sign in!</a></span>
                        </form>
                    </div>
                </div>
            </div>
    </div>
</div>
<%@include file="/common/ufooter.jsp"%>
</body>
</html>



















