<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>支付成功页面</title>
</head>
<body>
<jsp:include page="../base/head.jsp"></jsp:include>
    <div>
        <h1 align="center"><a style="color: #00a73e">支付成功，欢迎再次选购!</a></h1><br>
        <h3 align="center"><a href="toUserOrder">查看订单</a></h3>
        <h3 align="center"><a href="index">返回首页</a></h3>
    </div>
<jsp:include page="../base/foot.jsp"></jsp:include>
</body>
</html>