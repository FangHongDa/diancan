<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>关于我们</title>
    <link rel="stylesheet" href="${ctx}/css/aboutus/bootstrap.css" type="text/css">
    <link rel="stylesheet" href="${ctx}/css/aboutus/animate.css" type="text/css">
    <link rel="stylesheet" href="${ctx}/css/aboutus/main.css"type="text/css">
    <div class="footer"></div>
    <script src="${ctx}/js/aboutus/jquery-3.2.0.min.js" type="text/javascript"></script>
    <script src="${ctx}/js/aboutus/bootstrap.min.js" type="text/javascript"></script>
    <script src="${ctx}/js/aboutus/main.js" type="text/javascript"></script>
</head>
<style type="text/css">
    body{
        padding-top: 50px;
        width:100%;
        background: url("static/pro/images/aboutus/bg.jpg");
        background-size: cover;
        background-attachment: fixed;
    }
</style>
<body>
<div class="nav navbar-default navbar-fixed-top navbar-inverse" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a href="#" class="navbar-brand">关于我们</a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li class="active" id="aboutUs"><a href="#">About Us</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-6 col-md-offset-3 col-xs-12 main-container text-center">
            <div class="intr-logo">
                <img src="${ctx}/static/pro/images/aboutus/logo.jpg" alt="introduction-logo" class="animated bounce">
            </div>
            <div class="intr-word">
                <p class="animated swing">
                    联系我们<br>
                    在使用本系统过程中遇到任何问题都可以联系我们<br>
                    电子邮箱:864765462@qq.com<br>
                    联系电话:Tel: 184-xxxx-xxxx
                </p>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-md-offset-3 text-center main-skills">
            <h2>餐饮点餐系统</h2>
            <p> 随着信息时代到来，信息化是餐厅和酒店发展的</p>
            <p> 必然改革之一。越来越多的餐厅和酒店开始关注</p>
            <p> 餐饮点餐系统，</p>
            <p> 餐厅和酒店开始使用餐饮点菜软件代替手工管理。</p>
            <p> 而在移动互联网时代的推动下，</p>
            <p> 点菜系统电子化将成为餐厅和酒店在移动</p>
            <p> 互联网时代制胜的砝码之一。</p>
        </div>
    </div>
</div></body>
</html>