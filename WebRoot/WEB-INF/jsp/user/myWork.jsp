<%--
  Created by IntelliJ IDEA.
  User: Mia
  Date: 2021/3/9
  Time: 15:37
  To change this template use File | Settings | File Templates.
--%>
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
    <link rel="stylesheet" href="${ctx}/resource/css/pintuer.css">
    <link rel="stylesheet" href="${ctx}/resource/css/admin.css">
    <script src="${ctx}/resource/js/jquery.js"></script>
    <script src="${ctx}/resource/js/pintuer.js"></script>
    <script type="text/javascript" src="${ctx}/resource/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${ctx}/resource/ueditor/ueditor.all.min.js"></script>
</head>
<body>
<%@include file="/common/utop.jsp"%>
<!--导航条-->


<div class="width1200 center_yh hidden_yh font14" style="height: 40px;line-height: 40px;">
    <span>当前位置：</span><a href="${ctx}/login/uIndex" class="c_66">首页</a>
    ><a href="#" class="c_66">个人中心</a>
    ><a href="#" class="c_66">个人信息</a>
</div>
<div class="width100 hidden_yh" style="background: #f0f0f0;padding-top: 34px;padding-bottom: 34px;">
    <div class="width1200 hidden_yh center_yh">
        <div id="vipNav">
            <a href="${ctx}/user/view">个人信息</a>
            <a href="${ctx}/user/myWork" class="on">我的作品</a>
            <a href="${ctx}/user/myUpload">上传作品</a>
            <a href="${ctx}/sc/findBySql">作品收藏</a>
            <a href="${ctx}/login/pass">修改密码</a>
        </div>
        <div id="vipRight">
            <form action="${ctx}/user/exUpdate" method="post" id="myf">
                <div class="hidden_yh bj_fff" style="width: 938px;border: 1px solid #ddd;">
                    <div class="width100 font24" style="height: 60px;line-height: 60px;text-indent: 50px; background: #f5f8fa;border-bottom: 1px solid #ddd;">新增作品</div>

                </div>
            </form>

            <div class="panel admin-panel">
                <div class="body-content">
                    <form action="${ctx}/item/exAdd" method="post" class="form-x" enctype="multipart/form-data">
                        <div class="form-group">
                            <div class="label"><label>作品名称：</label></div>
                            <div class="field">
                                <input type="text" class="input w50" name="name" data-validate="required:请输入作品名称" />
                                <div class="tips"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="label"><label>作品类别：</label></div>
                            <div class="field">
                                <select name="categoryIdTwo" class="input w50">
                                    <c:forEach items="${types}" var="data" varStatus="l">
                                        <option value="${data.id}">${data.name}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="label"><label>作品：</label></div>
                            <div class="field">
                                <input type="file" class="input w50" name="file" />
                                <div class="tips"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="label"><label>描述：</label></div>
                            <div class="field">
                                <script type="text/plain" id="remark_txt_1" name="ms" style="width: 100%;height: 300px;"></script>
                                <script type="text/javascript">
                                    var editor = UE.getEditor('remark_txt_1');
                                    UE.Editor.prototype._bkGetActionUrl = UE.Editor.prototype.getActionUrl;
                                    UE.Editor.prototype.getActionUrl = function (action) {
                                        if(action == 'uploadimage' || action == 'uploadscrawl' || action == 'uploadvideo'){
                                            return '${ctx}/ueditor/saveFile';
                                        }else{
                                            return this._bkGetActionUrl.call(this,action);
                                        }
                                    }
                                </script>
                                <div class="tips"></div>
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="label"></div>
                            <div class="field">
                                <button class="button bg-main icon-check-square-o" type="submit">提交</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $(".sub").click(function () {
            alert("修改成功");
            $("#myf").submit();
        });
    });
</script>



<%@include file="/common/ufooter.jsp"%>
</body>
</html>
