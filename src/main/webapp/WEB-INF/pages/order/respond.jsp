<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../base/base.jsp" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>订单成功页面</title>
    <link href="${ctx}/static/pro/style/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${ctx}/static/pro/js/public.js"></script>
    <script type="text/javascript" src="${ctx}/static/pro/js/jquery.js"></script>
    <script type="text/javascript" src="${ctx}/static/pro/js/jqpublic.js"></script>
    <script type="text/javascript" src="${ctx}/static/pro/js/cart.js"></script>
    <script type="text/javascript" src="${ctx}/static/pro/jquery/jquery-1.4.2.js"></script>
    <script>

    </script>

</head>
<body>
<%--头--%>
<jsp:include page="../base/head.jsp"></jsp:include>
<h1></h1>
<h1 style="text-align:center;color: red;">订单已成功提交，我们将尽快为您送达！</h1>
<h1 style="text-align:center;color: red;"><a href="index">返回主页面</a></h1>
<%--头--%>
<jsp:include page="../base/foot.jsp"></jsp:include>
</body>
</html>
