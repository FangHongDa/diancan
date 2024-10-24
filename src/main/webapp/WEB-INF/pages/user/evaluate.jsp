<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户评价</title>
</head>
<body>
<jsp:include page="../base/head.jsp"></jsp:include>
<form action="/saveEva" method="post">
    <input type="hidden" name="orderId" value="${orderId}"/>
    <input type="hidden" name="status" value="${status}">
    <table border="1" width="60%" align="center">
        <tr>
            <th>订单编号</th>
            <th>${orderId}</th>
        </tr>
 <%--       <tr>
            <th>商品名称</th>
            <th>
                <td align="center" style="HEIGHT: 22px">
                    <table width="100%">
                        <c:forEach items="${productNameList}" var="productName">
                            <tr>
                                <td>${productName}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </td>
            </th>
            &lt;%&ndash;<th>${p}</th>&ndash;%&gt;
        </tr>--%>
        <tr>
            <td colspan="2" align="center">评价内容</td>
        </tr>
        <tr>
            <td colspan="2" align="center" height="30">
                <textarea id="evaContent" cols="80" rows="10" name="content">
                </textarea>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center"><input type="submit" value="提交评论"></td>
        </tr>
    </table>
</form>
</body>
</html>
