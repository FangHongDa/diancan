<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link href="${pageContext.request.contextPath}/back/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/style.css"/>
    <link href="${pageContext.request.contextPath}/back/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/font/css/font-awesome.min.css"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <link href="${pageContext.request.contextPath}/static/pro/style/style.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/back/js/jquery-1.9.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/H-ui.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/js/typeahead-bs2.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/back/assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/back/assets/js/jquery.easy-pie-chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/js/lrtk.js" type="text/javascript"></script>
    <title>订单管理</title>
</head>

<body>
<form method="post">
    <div class="margin clearfix">
        <div class="table_menu_list order_style" id="table_order_list">
            <div class="search_style">
                <div class="title_names">功能选项</div>
                <ul class="search_content clearfix">
                    <form method="post" action="admin/searchOrderList">
                        <li><label class="l_f">订单状态:</label>
                            <select name="status">
                                <option value="">---请选择状态---</option>
                                <option value= "0">未发货</option>
                                <option value= "1">已发货，待收货</option>
                                <option value= "2">已收货，待评论</option>
                                <option value= "3">已评论，待回复</option>
                                <option value= "4">订单完成</option>
                            </select>
                        </li>
                        <li style="width:90px;">
                            <button type="submit" class="btn_search"><i class="fa fa-search"></i>查询</button>
                        </li>
                    </form>
                    <li class="l_f">
                        <a href="/admin/downloadInfoToExcel" class="btn btn-warning Order_form"><i class="icon-plus"></i>导出全部订单</a>
                    </li>
                </ul>
            </div>
            <%--<div class="border clearfix">

            </div>--%>
            <!--订单列表展示-->
            <table class="table table-striped table-bordered table-hover" id="sample-table">
                <thead>
                <tr>
                    <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                    <th width="25px">序号</th>
                    <th width="100px">订单编号</th>
                    <th width="50px">订单金额</th>
                    <th width="50px">收货人</th>
                    <th width="100px">收货地址</th>
                    <th width="50px">下单时间</th>
                    <th width="250px">订单详情</th>
                    <th width="70px">状态</th>
                    <th width="200px">操作</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${order}" var="order">
                    <tr>
                        <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
                        <td>${order.id}</td>
                        <td>${order.orderId}</td>
                        <td>${order.money}</td>
                        <td>${order.userInfo.realName}</td>
                        <td>${order.userInfo.addressInfo}</td>
                        <td>${order.orderDate}</td>
                        <td align="center" style="HEIGHT: 22px">
                                <table width="100%">
                                    <c:forEach items="${order.productOrders}" var="productOrder">
                                        <tr>
                                            <td><img width="20" height="25" src="${productOrder.product.imageUrl}"></td>
                                            <td>商品名称：${productOrder.product.productName}</td>
                                            <td>商品单价：${productOrder.product.price}</td>
                                            <td>购买数量：${productOrder.buyNum}</td>
                                        </tr>
                                    </c:forEach>
                                </table>
                        </td>
                         <td class="td-status">
                            <c:if test="${order.orderStatus == 4}">
                        <span class="label label-success radius">订单完成</span>
                            </c:if>
                            <c:if test="${order.orderStatus == 3}">
                        <span class="label label-success radius"><a
                                href="/admin/toAnsEva?orderId=${order.orderId}">去回复评论</a></span>
                            </c:if>
                            <c:if test="${order.orderStatus == 2}">
                                <span class="label label-success radius">已收货，待评价</span>
                            </c:if>
                            <c:if test="${order.orderStatus == 1}">
                                <span class="label label-success radius">已发货，待收货</span>
                            </c:if>
                            <c:if test="${order.orderStatus == 0}">
                            <span class="label label-success radius"><a
                                    href="/admin/updateAdminOrderStatus?orderId=${order.orderId}&orderStatus=1">未发货</a></span>
                            </c:if>
                        </td>
                        <td>
         <%--                   <a href="javascript:;" title="处理订单" class="btn btn-xs btn-success"><i
                                    class="fa fa-cubes bigger-120"></i></a>--%>
                            <%--<a href="" title="发货" class="btn btn-xs btn-success"><i
                               class="fa fa-cubes bigger-120"></i></a>--%>
                            <a title="订单详细" href="${request.getcontextpath()}/admin/orderDetailed?orderId=${order.orderId}"
                               class="btn btn-xs btn-info order_detailed"><i class="fa fa-list bigger-120"></i></a>
                            <a title="删除" href="${request.getcontextpath()}/admin/deleteOrder?orderId=${order.orderId}"
                               class="btn btn-xs btn-warning"><i class="fa fa-trash  bigger-120"></i></a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    </div>
    </div>
    <div class="TurnPage" align="center">
        <a href="/admin/toOrderList?page=${page.navigateFirstPage}">
            <span class="Prev"><i></i>首页</span>
        </a>
        <a class="PNumber">第${page.pageNum}页</a>
        <c:if test="${page.pageNum > 1}">  <a href="/admin/toOrderList?page=${page.prePage}"><span class="PNumber">上一页</span></a></c:if>
        <c:if test="${page.pageNum != page.navigateLastPage}"> <a href="/admin/toOrderList?page=${page.nextPage}"><span class="PNumber">下一页</span></a></c:if>
        <a href="/admin/toOrderList?page=${page.navigateLastPage}">
            <span class="Next">最后一页<i></i></span>
        </a>
        <span class="PNumber"><i></i>共${page.pages}页</span>
    </div>

</form>
</body>
</html>
<script>
    //时间选择
    laydate({
        elem: '#start',
        event: 'focus'
    });


    //初始化宽度、高度
    $(".hide_style").height($(".hide_style").height());
    var heights = $(".hide_style").outerHeight(true) + 90;
    $(".widget-box").height($(window).height() - heights);
    $(".table_menu_list").width($(window).width() - 250);
    $(".table_menu_list").height($(window).height() - heights);
    /*    //当文档窗口发生改变时 触发
        $(window).resize(function(){
            $(".widget-box").height($(window).height()-heights);
            $(".table_menu_list").width($(window).width()-250);
            $(".table_menu_list").height($(window).height()-heights);
        })*/

    $('[data-rel=tooltip]').tooltip();
    $('[data-rel=popover]').popover({html: true});
</script>
<script>
    //订单列表
    jQuery(function ($) {
        var oTable1 = $('#sample-table').dataTable({
            "aaSorting": [[1, "desc"]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable": false, "aTargets": [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]}// 制定列不参与排序
            ]
        });


        $('table th input:checkbox').on('click', function () {
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function () {
                    this.checked = that.checked;
                    $(this).closest('tr').toggleClass('selected');
                });

        });


        $('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});

        function tooltip_placement(context, source) {
            var $source = $(source);
            var $parent = $source.closest('table')
            var off1 = $parent.offset();
            var w1 = $parent.width();

            var off2 = $source.offset();
            var w2 = $source.width();

            if (parseInt(off2.left) &lt; parseInt(off1.left) + parseInt(w1 / 2)) return 'right';
            return 'left';
        }
    });

</script>
