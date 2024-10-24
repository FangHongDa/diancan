<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link href="${pageContext.request.contextPath}/back/assets/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/ace.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/Widget/zTree/css/zTreeStyle/zTreeStyle.css"
          type="text/css">
    <link href="${pageContext.request.contextPath}/back/Widget/icheck/icheck.css" rel="stylesheet" type="text/css"/>
    <!--[if IE 7]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/font-awesome-ie7.min.css"/>
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/ace-ie.min.css"/>
    <![endif]-->
    <link href="${pageContext.request.contextPath}/static/pro/style/style.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/back/js/jquery-1.9.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/js/typeahead-bs2.min.js"></script>
    <!-- page specific plugin scripts -->
    <script src="${pageContext.request.contextPath}/back/assets/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/H-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/H-ui.admin.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/back/assets/laydate/laydate.js" type="text/javascript"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/back/Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/js/lrtk.js" type="text/javascript"></script>
    <title>热门产品列表</title>
</head>
<body>
<form method="post" name="icform">
    <div class=" page-content clearfix">
        <div id="products_style">
            <div class="border clearfix">
       <span class="l_f">
           <%--onclick="formSubmit('/admin/toAddProductBanner','_self');this.blur();"--%>
            <a id="toAddProductBanner" title="添加关联热门" class="btn btn-warning Order_form"><i class="icon-plus"></i>添加关联热门</a>
       </span>
            <a style="color: #8a3104;font-size: large">请注意：热门商品在前端随机选择展示</a>
            </div>

            <div class="table_menu_list" id="testIframe">
                <table class="table table-striped table-bordered table-hover" id="sample-table">
                    <thead>
                    <tr>
                        <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label>
                        </th>
                        <th width="100px">序号</th>
                        <th width="100px">热门商品id</th>
                        <th width="100px">热门商品名称</th>
                        <th width="100px">热门商品图片</th>
                        <th width="100px">状态</th>
                        <th width="150px">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${productBannerList}" var="productBanner">
                        <tr>
                            <td width="25px"><label><input type="checkbox" class="ace" name="id"
                                                           value="${productBanner.id}"><span class="lbl"></span></label>
                            </td>
                            <td width="100px">${productBanner.id}</td>
                            <td width="100px">${productBanner.productId}</td>
                            <td width="100px">${productBanner.product.productName}</td>
                            <td width="100px">
                                <img width="70" height="50" src="${productBanner.product.imageUrl}">
                            </td>
                            <c:if test="${productBanner.status==1}">
                                <td class="td-status"><span class="label label-success radius">显示中</span></td>
                            </c:if>

                            <c:if test="${productBanner.status==0}">
                                <td class="td-status"><span class="label label-success radius">不显示</span></td>
                            </c:if>
                            <td class="td-manage">
                                <a title="下架" href="/admin/updateProductBannerStatus?id=${productBanner.id}" class="btn btn-xs btn-info" >修改状态</a><i class="fa fa-times"></i>&nbsp;
                                <a title="删除" href="/admin/deleteProductBanner?id=${productBanner.id}"
                                   class="btn btn-xs btn-warning"><i class="icon-trash  bigger-120"></i></a>
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
        <a href="admin/toProductClassifyList?page=${page.navigateFirstPage}">
            <span class="Prev"><i></i>首页</span>
        </a>
        <a class="PNumber">第${page.pageNum}页</a>
        <c:if test="${page.pageNum > 1}"><a href="admin/toProductClassifyList?page=${page.prePage}"><span class="PNumber">上一页</span></a></c:if>
        <c:if test="${page.pageNum != page.navigateLastPage}"><a href="admin/toProductClassifyList?page=${page.nextPage}"><span class="PNumber">下一页</span></a></c:if>
        <a href="admin/toProductClassifyList?page=${page.navigateLastPage}">
            <span class="Next">最后一页<i></i></span>
        </a>
        <span class="PNumber"><i></i>共${page.pages}页</span>
    </div>

    <!--添加类别-->
    <div class="sort_style_add margin" id="classify_add" style="display:none">
        <div class="">
            <ul>
                <li><label class="label_name">商品名</label>
                    <div class="col-sm-9"><input name="kindName" type="text" placeholder="" class="col-xs-10 col-sm-5">
                    </div>
                </li>
            </ul>
        </div>
    </div>
</form>
</body>
</html>
<script>
    /* form处理*/
    function formSubmit(url, sTarget) {
        document.forms[0].target = sTarget;
        document.forms[0].action = url;
        document.forms[0].submit();
        return true;
    }

    $("#toAddProductBanner").click(function (event) {
        var url = "/admin/toAddProductBanner";
        layer.open({
            type: 2,
            shadeClose: true,
            title: "添加热门商品",
            area: ['60%', '75%'], //水平 垂直
            content: url,
            end: function () {
                DATA_LIST.actionSearch();
            }
        });
    });
</script>
