<%@page language="java" contentType="text/html; character=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/common/taglibs.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>首页</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/resource/user/css/style.css">
    <script src="${ctx}/resource/user/js/jquery-1.8.3.min.js"></script>
    <script src="${ctx}/resource/user/js/jquery.luara.0.0.1.min.js"></script>
</head>
<body>
    <%@include file="/common/utop.jsp"%>
<!--导航条-->
<div class="width100" style="height: 45px;background: #dd4545;margin-top: 40px;position: relative;z-index: 100;">
    <!--中间的部分-->
    <div class="width1200 center_yh relative_yh" style="height: 45px;">
        <!--普通导航-->
        <div class="left_yh font16" id="pageNav">
            <a href="${ctx}/login/uIndex">首页</a>
            <a href="${ctx}/news/list">公告</a>
            <a href="${ctx}/message/add">留言</a>
        </div>
    </div>
</div>
<div class="width100 hidden_yh" style="background: #f0f0f0;padding-top:34px;padding-bottom: 34px;">
    <div class="width1200 hidden_yh center_yh">
        <div id="vipRight" style="width: 1200px">
            <div class="hidden_yh bj_fff" style="width: 1198px;border: 1px solid #ddd;">
                <div class="width100 font24" style="height: 50px;line-height: 50px;width: 200px;text-align: center;">${obj.name}</div>
                <div class="hidden_yh" style="padding:20px;width: 1100px;margin: 0 auto">
                    <div class="width100 hidden_yh" style="border-bottom: 1px dashed #ddd;padding-top: 10px;padding-bottom: 10px;">
                        <div class="left_yh" style="width:100%;color: black">
                            ${obj.content}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

    <div class="width1200 center_yh hidden_yh font14" style="height: 40px;line-height: 40px;">
    </div>
    <div class="width100 hidden_yh" style="background: #f0f0f0;padding-top:34px;padding-bottom: 34px;">
        <div class="width1200 hidden_yh center_yh">
            <div id="vipRight" style="height: 60px;line-height: 60px;text-indent: 50px; background: #f5f8fa;width: 1200px;border:1px solid #ddd;">
                提交留言
            </div>
            <div class="bj_fff hidden_yh" style="width: 1200px;border: 1px solid #ddd; margin-top: 30px;padding: 50px;">
                <div class="width100" style="height: 32px;line-height: 32px;">
                    <div class="left_yh fon16 tright" style="width:120px;"><font class="red">*</font>姓名： </div>
                    <input type="text" id="name" style="width: 243px;border: 1px solid #ddd; outline: none;height: 30px;text-indent: 10px;">
                </div>
                <div class="width100" style="height: 32px;line-height: 32px;margin-top: 25px;">
                    <div class="left_yh fon16 tright" style="width:120px;"><font class="red">*</font>手机号： </div>
                    <input type="text" id="phone" style="width: 243px;border: 1px solid #ddd; outline: none;height: 30px;text-indent: 10px;">
                </div>
                <div class="width100" style="height: 100px;line-height: 100px;margin-top: 25px;">
                    <div class="left_yh fon16 tright" style="width:120px;"><font class="red">*</font>内容： </div>
                    <textarea rows="10" cols="60" id="content" style="width: 300px;border: 1px solid #ddd;outline: none;height: 100px;text-indent: 10px;"></textarea>
                </div>
                <div class="width100" style="height: 32px;line-height: 32px;margin-top: 25px;">
                    <a href="javascript:void(0)" class="left_yh block_yh font16 tcenter ff5802 con" style="width: 244px;height: 33px;line-height: 33px;margin-left:120px;">
                        提交
                    </a>
                </div>
            </div>
        </div>
    </div>


    <%@include file="/common/ufooter.jsp"%>
</body>
</html>



















