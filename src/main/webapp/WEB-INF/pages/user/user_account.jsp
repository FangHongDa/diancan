<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="utf-8" />
<title>用户中心--账户管理</title>
<link href="${ctx}/static/pro/style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/static/pro/js/public.js"></script>
<script type="text/javascript" src="${ctx}/static/pro/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/static/pro/js/jqpublic.js"></script>

</head>
<body>
<jsp:include page="../base/head.jsp"></jsp:include>
<!--Start content-->
<section class="Psection MT20">
<nav class="U-nav Font14 FontW">
  <ul>
   <li><i></i><a href="userCenter" target="_self">用户中心首页</a></li>
   <li><i></i><a href="toUserOrder" target="_self">我的订单</a></li>
   <li><i></i><a href="userAddress" target="_self">收货地址</a></li>
   <li><i></i><a href="userAccount" target="_self">账户管理</a></li>
   <li><i></i><a href="userLogout" target="_self">安全退出</a></li>
  </ul>
 </nav>
 <article class="U-article Overflow">
  <!--user Account-->
  <section class="AccManage Overflow">
   <span class="AMTitle Block Font14 FontW Lineheight35">账户管理</span>

   <p>登陆邮箱：${userInfos.userInfo.email} ( <a href="updateEmail" target="_self">更换邮箱</a> )</p>
   <br/>
   <br/>
   <p>手机号码：${userInfos.userInfo.telephone} ( <a href="updateTel" target="_self">更换手机号码</a> ) ( <a href="deleteTel" target="_self">解绑手机</a> )
   <span><h3 style="color:red">${msg}</h3></span>
   </p>
   <br/>
   <br/>
  </section>
 </article>
</section>
<!--End content-->
<jsp:include page="../base/foot.jsp"></jsp:include>
</body>
</html>
