<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link href="${pageContext.request.contextPath}/back/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/style.css"/>
    <link href="${pageContext.request.contextPath}/back/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/ace.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/font/css/font-awesome.min.css" />
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/ace-ie.min.css" />
    <![endif]-->
    <script src="${pageContext.request.contextPath}/back/js/jquery-1.9.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/js/typeahead-bs2.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/H-ui.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/layer/layer.js" type="text/javascript" ></script>
    <script src="${pageContext.request.contextPath}/back/assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/back/assets/js/jquery.easy-pie-chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/js/lrtk.js" type="text/javascript" ></script>
    <title>订单详细</title>
</head>

<body>
<div class="margin clearfix">
    <div class="Order_Details_style">
        <div class="Numbering">订单编号:<b>${order.orderId}</b></div></div>
    <div class="detailed_style">
        <!--收件人信息-->
        <div class="Receiver_style">
            <div class="title_name">收件人信息</div>
            <div class="Info_style clearfix">
                <div class="col-xs-4">
                    <label class="label_name" for="form-field-2"> 收件人姓名： </label>
                    <div class="o_content">${order.user.username}</div>
                </div>
                <div class="col-xs-4">
                    <label class="label_name" for="form-field-2"> 收件人电话： </label>
                    <div class="o_content">${order.user.userInfo.telephone}</div>
                </div>
               <div class="col-xs-4">
                    <label class="label_name" for="form-field-2"> 收件地邮编： </label>
                    <div class="o_content">${order.user.userInfo.zip}</div>
                </div>
                <div class="col-xs-4">
                    <label class="label_name" for="form-field-2"> 收件地址： </label>
                    <div class="o_content">${order.addResInfo}</div>
                </div>
            </div>
        </div>
        <!--订单信息-->
        <div class="product_style">
            <div class="title_name">产品信息</div>
            <div class="Info_style clearfix">
                <div class="product_info clearfix">
                    <a href="#" class="img_link"><img src="${pageContext.request.contextPath}${order.product.pic}"  width="200" height="200"/></a>
                    <span>
                      <a href="#" class="name_link">商品名称：${order.product.productName}</a><br/>
                      <b>商品分类：${order.product.productKind.name}</b>
                      <p>数量：${order.productOrder.buyNum}</p>
                      <p>价格：<b class="price"><i>￥</i>${order.product.price}</b></p>
                      <%--<c:if test="${order.orderStatus == 1}"><p>状态：<i class="label label-success radius">已受理</i></p></c:if>
                      <c:if test="${order.orderStatus == 0}"><p>状态：<i class="label label-success radius">未受理</i></p></c:if>
                      <c:if test="${order.orderStatus == 4}"><p>状态：<i class="label label-success radius">已完成</i></p></c:if>
                      <c:if test="${order.orderStatus == 2}"><p>状态：<i class="label label-success radius">待回复</i></p></c:if>
                      <c:if test="${order.orderStatus == 3}"><p>状态：<i class="label label-success radius">已回复</i></p></c:if>
                   --%></span>
                </div>
            </div>
        </div>
        <!--总价-->
        <div class="Total_style">
            <div class="Info_style clearfix">
                <div class="col-xs-4">
                    <%--@declare id="form-field-2"--%><label class="label_name" for="form-field-2"> 支付方式： </label>
                    <div class="o_content">在线支付</div>
                </div>
                <div class="col-xs-4">
                </div>
                <div class="col-xs-4">
                    <label class="label_name" for="form-field-2"> 订单生成日期： </label>
                    <div class="o_content">${order.orderDate}</div>
                </div>
            </div>
            <div class="Total_m_style"><span class="Total">总数：<b>${order.productOrder.buyNum}</b></span><span class="Total_price">总价：<b>${order.money}</b>元</span></div>
        </div>
        <div class="Button_operation">
            <button  onclick="window.history.go(-1);this.blur();" class="btn btn-primary radius" type="submit"><i class="icon-save "></i>返回上一步</button>
        </div>
    </div>
</div>
</body>
</html>
