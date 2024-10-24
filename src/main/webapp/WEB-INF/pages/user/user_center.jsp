<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="utf-8" />
<title>用户中心--首页</title>
<link href=${ctx}/static/pro/style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src=${ctx}/static/pro/js/public.js"></script>
<script type="text/javascript" src=${ctx}/static/pro/js/jquery.js"></script>
<script type="text/javascript" src=${ctx}/static/pro/js/jqpublic.js"></script>

</head>
<body>
<jsp:include page="../base/head.jsp"></jsp:include>
<!--Start content-->
<section class="Psection MT20">
<nav class="U-nav Font14 FontW">
  <ul>
   <li><i></i><a href="/userCenter" target="_self">用户中心首页</a></li>
   <li><i></i><a href="/toUserOrder?userId=${sessionScope.user.id}" target="_self">我的订单</a></li>
   <li><i></i><a href="/userAddress?userId=${sessionScope.user.id}" target="_self">收货地址</a></li>
   <li><i></i><a href="/userAccount?userId=${sessionScope.user.id}" target="_self">账户管理</a></li>
   <li><i></i><a href="/userLogout" target="_self">安全退出</a></li>
  </ul>
 </nav>
 <article class="U-article Overflow">
  <!--"引用“user_page/user_index.html”"-->
  <section class="usercenter">
   <span class="Weltitle Block Font16 CorRed FontW Lineheight35">Welcome欢迎光临！</span>
   <div class="U-header MT20 Overflow">
    <p class="Font14 FontW">${sessionScope.user.userName} -------欢迎您来到 用户中心！</p>
    <%--<p class="Font12 CorRed FontW">我的积分( ${userInfos.userInfo.score} )</p>--%>
   </div>
  </section>
 </article>
</section>
<!--End content-->
<jsp:include page="../base/foot.jsp"></jsp:include>
</body>
</html>
