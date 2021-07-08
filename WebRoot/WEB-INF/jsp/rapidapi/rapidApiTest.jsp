<%--
  Created by IntelliJ IDEA.
  User: Mia
  Date: 2021/6/16
  Time: 16:03
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
    <script src="${ctx}/resource/js/jquery-3.5.1.min.js"></script>
    <script src="${ctx}/resource/js/bootstrap.bundle.min.js"></script>
    <script src="${ctx}/resource/js/jquery.magnific-popup.min.js"></script>
    <script src="${ctx}/resource/js/smooth-scrollbar.js"></script>
    <script src="${ctx}/resource/js/select2.min.js"></script>
    <script src="${ctx}/resource/js/admin.js"></script>

    <title>Web Service</title>

</head>
<body>
<!-- header -->
<%@include file="/common/utop.jsp"%>

<!-- main content -->
<main class="main">
    <div class="container-fluid">
            <!-- main title -->
            <div class="col-12">
                <div class="main__title">
                    <h2>YouTube Test</h2>
                </div>
            </div>
            <!-- end main title -->

    </div>

    <!-- YouTube Search Results -->
    <h2 style="color: #ffffff">YouTube Search Results</h2>
    <p style="color: #ffffff">价格： FREEMIUM</p>
    <p style="color: #ffffff">描述： Fetch the YouTube Search Results and the information for each item for a specific search term, without any limits!</p>
    <p style="color: #ffffff">请求方法： GET</p>
    <p style="color: #ffffff">参数名称：q  [STRING]</p>
    <p style="color: #ffffff">样例： justin+bieber</p>
    <p style="color: #ffffff">说明：【REQUIRED】The URL Encoded search Query </p>
    <p style="color: #ffffff">==================================================</p>

    <h2 style="color: #ffffff">YouTube Video Info</h2>
    <p style="color: #ffffff">价格： FREEMIUM</p>
    <p style="color: #ffffff">描述： Get YouTube Video Information including the Audio and Video Streams!</p>
    <p style="color: #ffffff">请求方法： GET</p>
    <p style="color: #ffffff">参数名称：url  [STRING]</p>
    <p style="color: #ffffff">样例：https://www.youtube.com/watch?v=tQ0yjYUFKAE </p>
    <p style="color: #ffffff">说明：【REQUIRED】</p>
    <p style="color: #ffffff">==================================================</p>


    <h2 style="color: #ffffff">Youtube To Mp3</h2>
    <p style="color: #ffffff">价格： FREEMIUM</p>
    <p style="color: #ffffff">描述： Get Direct Mp3 Download Link.</p>
    <p style="color: #ffffff">请求方法： GET</p>
    <p style="color: #ffffff">参数名称：video_id  [STRING]</p>
    <p style="color: #ffffff">样例：tQ0yjYUFKAE </p>
    <p style="color: #ffffff">说明：【REQUIRED】 </p>
    <p style="color: #ffffff">==================================================</p>


    <h2 style="color: #ffffff">Youtube Videos</h2>
    <p style="color: #ffffff">价格： FREEMIUM</p>
    <p style="color: #ffffff">描述： An easy-to-use API to fetch videos from Youtube in MP4 format.</p>
    <p style="color: #ffffff">请求方法： GET</p>
    <p style="color: #ffffff">参数名称：videoId  [STRING]</p>
    <p style="color: #ffffff">样例：M0VWroX0gZA </p>
    <p style="color: #ffffff">说明：【REQUIRED】 </p>
    <p style="color: #ffffff">==================================================</p>

    <h2 style="color: #ffffff">youtube-screenshot</h2>
    <p style="color: #ffffff">价格： FREEMIUM</p>
    <p style="color: #ffffff">描述： Capture images from youtube videos</p>
    <p style="color: #ffffff">请求方法： GET</p>
    <p style="color: #ffffff">参数名称：youtube_id  [STRING]     样例：UxxajLWwzqY </p>
    <p style="color: #ffffff">说明：【REQUIRED】 11 character video id of the youtube video.</p>
    <p style="color: #ffffff">参数名称：seconds  [NUMBER]     样例：3 </p>
    <p style="color: #ffffff">说明：【REQUIRED】 Frame position in seconds</p>

    <form action="${ctx}/rapidapi/rapidApiTest" method="post" style="width: 40%;margin-left: 50px">
        <input type="text" class="sign__input"  name="query" placeholder="for example: justin+bieber" required>
        <div class="width100" style="height: 20px;line-height: 32px;margin-top: 30px;margin-bottom: 50px">
            <button class="sign__btn" type="submit">Test</button>
        </div>
    </form>
    <!-- YouTube Search Results -->
    <div class="col-12">
        <div class="main__table-wrap">
            <c:forEach items="${obj}" var="data" varStatus="l">
                <p style="color: #ffffff">===========================================================</p>
                <h3 style="color: #ffffff">YouTube Search Results</h3>
                <p style="color: #ffffff">title: ${data.youtube_title}</p>
                <p style="color: #ffffff">type:  ${data.youtube_type}</p>
                <p style="color: #ffffff">id:    ${data.youtube_id}</p>
                <p style="color: #ffffff">url:   ${data.youtube_url}</p>
                <p style="color: #ffffff">views: ${data.youtube_views}</p>

                <h3 style="color: #ffffff">YouTube Video Info</h3>
                <p style="color: #ffffff">description:  ${data.youtube_description}</p>
                <p style="color: #ffffff">uploader:    ${data.youtube_uploader}</p>
                <p style="color: #ffffff">channel_id:   ${data.youtube_channel_id}</p>
                <p style="color: #ffffff">average_rating: ${data.youtube_average_rating}</p>
                <p style="color: #ffffff">age_limit: ${data.youtube_age_limit}</p>

                <h3 style="color: #ffffff">Youtube To Mp3</h3>
                <p style="color: #ffffff">status:  ${data.youtube_status}</p>
                <p style="color: #ffffff">status_code:    ${data.youtube_status_code}</p>
                <p style="color: #ffffff">download_size:   ${data.youtube_download_size}</p>
                <p style="color: #ffffff">download_url: ${data.youtube_download_url}</p>
                <p style="color: #ffffff">video_thumbnail:</p>
                <img src=${data.youtube_video_thumbnail}>

                <h3 style="color: #ffffff">Youtube Videos</h3>
                <p style="color: #ffffff">quality:  ${data.youtube_quality}</p>
                <p style="color: #ffffff">width:    ${data.youtube_width}</p>
                <p style="color: #ffffff">height:   ${data.youtube_height}</p>
                <p style="color: #ffffff">size: ${data.youtube_size}</p>
                <p style="color: #ffffff">Mp4: </p>
                <video  width="800"  src=${data.youtube_mp4Url} controls></video>

                <h3 style="color: #ffffff">youtube-screenshot</h3>
                <p style="color: #ffffff">Screenshot of the third second:</p>
                <img src=${data.youtube_screenShot}>
            </c:forEach>
        </div>
    </div>
    <!-- End of YouTube Search Results -->


<%--    <iframe src="https://rapidapi.com/iframe-apps/api-playground/latest/Playground.html?brand=default&locale=en-US&mode=light&apiId=api_9c3c8e83-2803-40d7-80ff-ef1b1c6b63ea&date=1623834901068" style="width: 100%; height: 800px"></iframe>--%>
</main>

</body>
</html>
