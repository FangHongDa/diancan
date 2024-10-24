<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="base/base.jsp" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>网上订餐系统</title>
    <link href="${ctx}/static/pro/style/style.css" rel="stylesheet" type="text/css"/>
    <link href="${ctx}/static/pro/style/lbt.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${ctx}/static/pro/js/public.js"></script>
    <script type="text/javascript" src="${ctx}/static/pro/js/jquery-1.6.2.js"></script>
    <script type="text/javascript" src="${ctx}/static/pro/js/jquery-1.2.6.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/pro/js/jqpublic.js"></script>
    <link href="${pageContext.request.contextPath}/back/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/style.css"/>
    <link href="${pageContext.request.contextPath}/back/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/font/css/font-awesome.min.css"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/back/js/jquery-1.9.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/js/typeahead-bs2.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/js/lrtk.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/back/assets/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/layer/layer.js" type="text/javascript"></script>
</head>
<body>
<form method="post" name="icform">
    <%--头--%>
    <jsp:include page="base/head.jsp"></jsp:include>

    <!--Start content-->
    <section class="Cfn">
        <aside class="C-left">
            <div class="S-time">服务时间：周一~周六
                <time>06:00</time>
                -
                <time>03:00</time>
            </div>
            <div class="C-time">
                <img src="${ctx}/static/pro/upload/dc.jpg"/>
            </div>
            <a href="/toList?pageNum=1"><img src="${ctx}/static/pro/images/by_button.png"></a>
            <a href="javascript:void(0)" id="sort_add"><img style="width: 298px"
                                                            src="${ctx}/static/pro/images/by_leave.png" alt=""></a>
        </aside>
        <%--轮播图--%>
        <div class="F-middle banner">
            <ul class="rslides img">
                <c:forEach items="${hotProductList}" var="hotProduct" begin="0" end="4" step="1">
                    <li>
                        <a href="/toDetail?id=${hotProduct.id}">
                            <img src="${ctx}${hotProduct.imageUrl}" width="600px" height="400px"/>
                        </a>
                    </li>
                </c:forEach>
            </ul>
            <ul class="num"></ul>
            <div class="btn">
                <span class="prev"><</span>
                <span class="next">></span>
            </div>

        </div>
        <!--公告-->
        <aside class="N-right">
            <div class="N-title">公告栏 <i>Notice</i></div>

            <ul class="Orderlist" id="UpRoll">
                <c:forEach items="${noticeList}" var="notice">
                <li>
                    <p>标题：${notice.title}</p>
                    <p>内容：${notice.content}</p>
                    <p>时间：<i class="State01">${notice.noticeDate}</i></p>
                </li>
                </c:forEach>

                <!--留言表script-->
                <script>
                    var UpRoll = document.getElementById('UpRoll');
                    var lis = UpRoll.getElementsByTagName('li');
                    var ml = 0;
                    var timer1 = setInterval(function () {
                        var liHeight = lis[0].offsetHeight;
                        var timer2 = setInterval(function () {
                            UpRoll.scrollTop = (++ml);
                            if (ml == 1) {
                                clearInterval(timer2);
                                UpRoll.scrollTop = 0;
                                ml = 0;
                                lis[0].parentNode.appendChild(lis[0]);
                            }
                        }, 10);
                    }, 5000);
                </script>
        </aside>
    </section>


    <section class="Sfainfor">
        <article class="Sflist">
            <div id="Indexouter">
                <ul id="Indextab">
                    <li class="current">点菜</li>

                    <%--分类展示品列表--%>
                    <p class="class_B">
                        <c:forEach items="${productKindList}" var="productKind">
                            <a href="/findProductByCategory?kindId=${productKind.id}">${productKind.kindName}</a>
                        </c:forEach>
                        <%--展示全部的菜品列表--%>
                        <span><a href="/toList?pageNum=1">更多</a></span>
                    </p>
                </ul>
                <div id="Indexcontent">
                    <ul style="display:block;">
                        <li>
                            <div class="SCcontent">
                                <c:set var="num" value="0"></c:set>

                                <c:forEach items="${productList}" var="product">
                                    <input type="hidden" value="${num=num+1}">
                                    <c:if test="${num<=9}">
                                        <a href="/toDetail?id=${product.id}"
                                           title="菜品名称"><%--target="_blank"--%>
                                            <figure>
                                                <img src="${ctx}${product.imageUrl}">
                                                <figcaption>
                                                    <span class="title">${product.productName}</span>
                                                    <span class="price"><i>￥</i>${product.price}eqweqweqwe</span>
                                                    <input type="hidden" id="${product.id}"/>
                                                </figcaption>
                                            </figure>
                                        </a>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </li>
                    </ul>
                    <ul>

                    </ul>
                </div>
            </div>
        </article>
        <aside class="A-infor">
            <img src="${ctx}/static/pro/upload/02.gif">
            <div class="usercomment">
                <span>用户菜品点评&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;<a href="/toEvaList">查看更多评论</a></span>
                <ul>
                    <c:forEach items="${evaluateList}" var="el">
                        <li>
                            <img src="${ctx}/static/pro/upload/01.jpg">
                            某用户评论：${el.evaluateContent}
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </aside>
        <div class="sort_style_add margin" id="sort_style_add" style="display:none">
            <div class="">
                <ul>
                    <li><label class="label_name">留言标题</label>
                        <div class="col-sm-9">
                            <input name="title" type="text" id="form-field-1" placeholder="" class="col-xs-10 col-sm-5">
                        </div>
                    </li>
                    <li><label class="label_name">留言内容</label>
                        <div class="col-sm-9">
                            <textarea name="content" class="form-control" id="form-field-8" placeholder=""
                                      onkeyup="checkLength(this);">
                            </textarea>
                            <span class="wordage">剩余字数：<span id="sy" style="color:Red;">200</span>字</span>

                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </section>
    <!--End content-->
    <%--foot--%>
    <jsp:include page="base/foot.jsp"></jsp:include>
</form>
</body>
</html>
<script type="text/javascript" src="${ctx}/static/pro/js/lbt.js"></script>
<script type="text/javascript">
    $('#sort_add').on('click', function () {
        layer.open({
            type: 1,
            title: '添加留言',
            maxmin: true,
            shadeClose: false, //点击遮罩关闭层
            scrollbar: false,
            area: ['750px', ''],
            content: $('#sort_style_add'),
            btn: ['提交', '取消'],
            offset: '30px',
            yes: function (index, layero) {
                var num = 0;
                var str = "";
                $(".sort_style_add input[type$='text']").each(function (n) {
                    if ($(this).val() == true) {
                        layer.alert(str += "" + $(this).attr("name") + "不能为空！\r\n", {
                            title: '提示框',
                            icon: 0,
                        });
                        num++;
                        return false;
                    }
                });
                if (num < 0) {
                    return false;
                } else {
                    var content = document.getElementsByName("content")[0].value;
                    window.location.href = "/createLeave?content=" + content;
                    layer.alert('添加成功！', {
                        title: '提示框',
                        icon: 1,
                    });
                    layer.close(index);
                }
            }
        });
    })


    function checkLength(which) {
        var maxChars = 200; //
        if (which.value.length > maxChars) {
            layer.open({
                icon: 2,
                title: '提示框',
                content: '您出入的字数超多限制!',
            });
            // 超过限制的字数了就将 文本框中的内容按规定的字数 截取
            which.value = which.value.substring(0, maxChars);
            return false;
        } else {
            var curr = maxChars - which.value.length; //250 减去 当前输入的
            document.getElementById("sy").innerHTML = curr.toString();
            return true;
        }
    };
</script>