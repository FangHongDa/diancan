<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <title>用户评价信息</title>
    <link rel="stylesheet" type="text/css" href="${ctx}/css/evaluate/evaluate.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/css/evaluate/bootstrap.min.css">
</head>
<body>
<jsp:include page="../base/head.jsp"></jsp:include><!--引入head.jsp模块--->
<div>
    <div class="row">
        <%--<h4 style="font-weight: bold;" align="center">用户评价信息 </h4>--%>
        <div class="box">
            <table id="table" class="table table-responsive table-hover">
                <thead>
                <tr>
                    <th>订单编号</th>
                    <th>评价内容</th>
                    <th>评价时间</th>
                    <th>回复内容</th>
                    <th>回复时间</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${evaList}" var="el">
                    <tr>
                        <td>${el.orderId}</td>
                        <td>${el.evaluateContent}</td>
                        <td>${el.evaluateDate}</td>
                        <td>${el.answerContent}</td>
                        <td>${el.answerDate}</td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="TurnPage">
    <a href="toEvaList?page=${page.navigateFirstPage}">
        <span class="Prev"><i></i>首页</span>
    </a>
    <a class="PNumber">第${page.pageNum}页</a>
    <c:if test="${page.pageNum > 1}"> <a href="toEvaList?page=${page.prePage}"><span class="PNumber">上一页</span></a></c:if>
    <c:if test="${page.pageNum != page.navigateLastPage}"><a href="toEvaList?page=${page.nextPage}"><span class="PNumber">下一页</span></a></c:if>
    <a href="toEvaList?page=${page.navigateLastPage}">
        <span class="Next">最后一页<i></i></span>
    </a>
    <span class="PNumber"><i></i>共${page.pages}页</span>
</div>
</body>
</html>