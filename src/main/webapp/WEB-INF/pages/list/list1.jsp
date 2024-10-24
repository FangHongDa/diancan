<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../base/base.jsp"%>
<html>
<head>
    <meta charset="utf-8" />
    <title>菜品分类页</title>

    <link href="${ctx}/static/pro/style/style.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/static/pro/style/prodList.css" rel="stylesheet" type="text/css">
    <script type="text/javascript" src="${ctx}/static/pro/js/public.js"></script>
    <script type="text/javascript" src="${ctx}/js/jquery-1.6.2.js"></script>
    <script type="text/javascript" src="${ctx}/static/pro/js/jqpublic.js"></script>
</head>
<body>
<form method="post" name="icform">
    <%--头--%>
    <jsp:include page="../base/head.jsp"></jsp:include>
    <!--Start content-->
    <section class="Psection">

        <div id="content">
            <div id="search_div">
                <form method="post" action="findProductByCondition">
                    <span class="input_span">商品名：<input type="text" name="product_name" value=""/></span>
                    <span class="input_span">商品种类：<input type="text" name="name" value=""/></span>
				<span class="input_span">商品价格区间：
					<input type="text" name="minprice" value=""/> -
					<input type="text" name="maxprice" value=""/></span>
                    <input type="submit" value="查 询" >
                    <input type="reset" id="reset" value="重 置">
                </form>
            </div>
        </div>
        <section class="Fsl">
            <ul>
                <c:set var="num" value="0"></c:set>
                <c:forEach items="${productList}" var="product" varStatus="status">
                        <li>
                            <a href="/toDetail?id=${product.id}"  title="菜名"><img src="${ctx}${product.imageUrl}"></a>

                            <p>菜名：${product.productName}</p>
                            <hr>
                            <p>价格:${product.price}</p>
                            <hr>
                            <p>销量:${product.buyCount}</p>
                            <p>
                                <span class="DSBUTTON" style="float: right"><a href="/toDetail?id=${product.id}"  class="Fontfff">商品详情</a></span>
                            </p>
                        </li>
                </c:forEach>
            </ul>
                      <!--将买的最多的菜放到此处，两个既好-->
            <aside>
                <div class="title">热门菜</div>
                <c:forEach items="${hotProductList}" var="hotProduct" varStatus="status">
                    <div class="C-list">
                        <a href="/toDetail?id=${hotProduct.id}" title="菜名"><img src="${ctx}${hotProduct.imageUrl}" width="100%" height="30%"></a>
                        <p><a href="/toDetail?id=${hotProduct.id}" >${hotProduct.productName}</a></p>
                        <p>
                            <span>价格：${hotProduct.price}</span>
                        </p>
                    </div>

                </c:forEach>
            </aside>
        </section>
        <div class="TurnPage">
            <a href="/toList?page=${page.navigateFirstPage}">
                <span class="Prev"><i></i>首页</span>
            </a>
            <a class="PNumber">第${page.pageNum}页</a>
            <c:if test="${page.pageNum > 1}"><a href="/toList?page=${page.prePage}"><span class="PNumber">上一页</span></a></c:if>
            <c:if test="${page.pageNum != page.navigateLastPage}"><a href="/toList?page=${page.nextPage}"><span class="PNumber">下一页</span></a></c:if>
            <a href="/toList?page=${page.navigateLastPage}">
                <span class="Next">最后一页<i></i></span>
            </a>
            <span class="PNumber"><i></i>共${page.navigateLastPage}页</span>
        </div>
    </section>
    <%--头--%>
    <jsp:include page="../base/foot.jsp"></jsp:include>
    <!--End content-->
</form>
</body>

</html>
