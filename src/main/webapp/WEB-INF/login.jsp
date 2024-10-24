<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>用户登录</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="${ctx}/css/login/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/css/login/public.css">
    <script  src="${ctx}/js/common/jquery/jquery1.8.3.min.js"></script>
    <script  src="${ctx}/js/common/layer/layer.js"></script>
    <script src="${ctx}/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<div id="bg"></div>
<div class="show">
    <div class="login-panel">
        <h4 class="form-title">欢迎登录选购</h4>
        <hr class="top-line">
        <form action="loginLogin" method="post" onsubmit="return toVaildLogin()">
            <label>
                <c:if test="${!empty errorInfo}">
                    <span type="text" id="errorInfo">${errorInfo}</span>
                </c:if>
            </label>
            <div class="form-group">
                <label for="username">用户名</label>
                <input type="text" name="username" class="form-control"  placeholder="Account" id="username">
            </div>
            <div class="form-group">
                <label for="password">密码</label>
                <input type="password" name="password" class="form-control" placeholder="Password" id="password">
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-info" id="submit">登录</button>
            </div>
        </form>
    </div>

    <div class="switch row">
        <button class="switch-action" id="register">&lt;&nbsp;还没有账号？<span>立即注册</span></button>
    </div>

    <div class="bottom-info">
        Powered By：<a href="/index">点餐系统</a>&nbsp;•&nbsp;<a href="/aboutUs">关于我们</a>
    </div>
</div>
</body>

<script type="text/javascript">

    //点击用户名或者密码的时候 错误提示消失
    $("#username").click(function(){
        $("#errorInfo").hide();
    });
    $("#password").click(function(){
        $("#errorInfo").hide();
    });

    //登录验证操作
    function toVaildLogin(){
        var username = $("#username").val();
        var password = $("#password").val();
        if (username == '') {
            layer.alert("用户名不能为空");
            return false;
        }
        if (password == '') {
            layer.alert("密码不能为空");
            return false;
        }
        return true;
    }
    //跳转到用户注册
    $(document).ready(function () {
        $("#register").click(function () {
            window.location.href = "loginToRegister";
        });
    });
    
</script>
</html>
