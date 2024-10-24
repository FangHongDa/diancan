<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../base/base.jsp"%>
<html>
<head>
    <meta charset="utf-8" />
    <title>菜品详情</title>
    <link href="${ctx}/static/pro/style/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${ctx}/static/pro/js/public.js"></script>
    <script type="text/javascript" src="${ctx}/static/pro/js/jquery-1.6.2.js"></script>
    <script type="text/javascript" src="${ctx}/static/pro/js/jqpublic.js"></script>
    <script>
        $(function(){
            $('.title-list li').click(function(){
                var liindex = $('.title-list li').index(this);
                $(this).addClass('on').siblings().removeClass('on');
                $('.menutab-wrap div.menutab').eq(liindex).fadeIn(150).siblings('div.menutab').hide();
                var liWidth = $('.title-list li').width();
                $('.shopcontent .title-list p').stop(false,true).animate({'left' : liindex * liWidth + 'px'},300);
            });

            $('.menutab-wrap .menutab li').hover(function(){
                $(this).css("border-color","#ff6600");
                $(this).find('p > a').css('color','#ff6600');
            },function(){
                $(this).css("border-color","#fafafa");
                $(this).find('p > a').css('color','#666666');
            });
        });
    </script>
</head>
<body>
<form method="post" name="icform">
    <%--头--%>
    <jsp:include page="../base/head.jsp"></jsp:include>

<section class="slp">
    <section class="food-hd">
         <div class="foodpic">
              <img src="${ctx}${product.imageUrl}" id="showimg">
              <ul class="smallpic">
                  <li><img src="${ctx}${product.imageUrl}"></li>
              </ul>
              <span style="color: #daff14;font-size: 15px;">商品介绍:&nbsp;&nbsp;&nbsp;${product.description}</span>
          </div>
        <div class="foodtext">
            <div class="foodname_a">
                <h1>${product.productName}</h1>

            </div>
            <div class="price_a">
                <p class="price01"><a style="font-size: 30px">价格：</a>￥<span>${product.price}</span></p>
                <p class="price01"><a style="font-size: 20px">会员价：</a>￥<span>${product.vprice}</span></p>
                <%--<span class="price02">￥${product.price}</span--%>
            </div>

            <ul class="Tran_infor">
                <li>
                    <p class="Numerical">销量:${product.buyCount}</p>
                </li>
               <%-- <li class="line">
                    <p class="Numerical">${80+product.buyCount}</p>
                    <p>累计评价</p>
                </li>
                <li>
                    <p class="Numerical">8</p>
                    <p>送幸福积分</p>
                </li>--%>
            </ul>
            <form method="post" action="toCart">
                <div class="BuyNo">
                    <input type="hidden" name="id" value="${product.id}"/>
                    <span>我要买：<input type="number" name="buyNum" required autofocus min="1" value="1"/>份</span>
                    <div class="Buybutton">
                        <input type="submit" style="text-align: center; line-height: 45px" class="BuyB" value="加入购物车"/>
                    </div>
                </div>
                </form>
        </div>

        <div class="viewhistory">
            <span class="VHtitle">热门菜</span>
            <c:forEach items="${HotProductList}" var="HotProduct" varStatus="status">
            <ul class="Fsulist">
                <li>
                    <a href="/toDetail?id=${HotProduct.id}"  title="酱爆茄子"><img src="${ctx}${HotProduct.imageUrl}"></a>
                    <p>菜品名字:${HotProduct.productName}</p>
                    <p>菜品价格:${HotProduct.price}</p>
                </li>
            </ul>
            </c:forEach>
        </div>
    </section>
    <!--bottom content-->

</section>
<!--End content-->

        <%--foot--%>
        <jsp:include page="../base/foot.jsp"></jsp:include>
</form>
</body>
</html>
