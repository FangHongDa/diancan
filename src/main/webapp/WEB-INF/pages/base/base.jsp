<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!--获取虚拟路径  -->
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<c:out value="${ctx}"/>
<%--<c:set var="test" value="${20*100}"/>
<c:out value="${test}"/>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

path:<%=path%><br>
basePath:<%=basePath%><br>--%>
