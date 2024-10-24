<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="base.jsp" %>
<meta charset="utf-8"/>
<title>网上订餐系统${ctx}</title>
<link href="${ctx}/static/pro/style/style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="${ctx}/static/pro/js/public.js"></script>
<script type="text/javascript" src="${ctx}/static/pro/js/jquery-1.6.2.js"></script>
<script type="text/javascript" src="${ctx}/static/pro/js/jqpublic.js"></script>
<script type="text/javascript" src="${ctx}/static/pro/js/search.js"></script>
<script>

</script>
<form method="post" name="icform">
    <header>
        <section class="Topmenubg">
            <div class="Topnav">
                <div class="LeftNav">
                    <c:if test="${!empty user}">
                        欢迎您${user.userName}，请尽情选购 |
                        <a href="loginOut">退出</a>
                    </c:if>
                    <c:if test="${empty user}">
                        <a href="toRegister">注册</a>|
                        <a href="toLogin">登录</a>
                    </c:if>
                </div>
                <div class="RightNav">
                    <a href="toUserCenter">用户中心</a>
                    <a href="toUserOrder" title="我的订单">我的订单</a>
                    <a href="toMyCart">购物车</a>
                    <a href="/admin/index">后台管理系统</a>
                </div>
            </div>
        </section>
        <div class="Logo_search">
            <div class="Logo">

                <img src="${ctx}/static/pro/images/logo.jpg" title="47.100.15.40:8080">
                <!--<i></i>-->
            </div>
            <div class="Search">
                <div class="Search_nav" id="selectsearch">

                    <a href="javascript:;" class="choose">食物名</a>
                </div>
                <div class="Search_area">
                    <input type="search" id="keyword" placeholder="请输入您所需查找的食物名称..." class="searchbox"/>
                    <input type="button" class="searchbutton" onclick="search()" value="搜 索"/>
                </div>
            </div>
        </div>
        <nav class="menu_bg">
            <ul class="menu">
                <li><a href="index">首 页</a></li>
                <li><a href="/toList?pageNum=1">订 餐</a></li>
                <li><a href="/toEvaList">用户评价</a></li>
                <li><a href="/aboutUs">关于我们</a></li>
            </ul>
        </nav>
    </header>
</form>
<script>
    function search() {
        var keyword = document.getElementById("keyword").value;
        window.self.location = "/searchByConditition?keyword=" + keyword;
    }
</script>