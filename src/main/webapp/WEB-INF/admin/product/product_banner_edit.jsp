<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <!--[if lt IE 9]>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/html5.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/respond.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/js/PIE_IE678.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/back/js/jquery-1.9.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/js/myjs/select-list-ajax.js"></script>
    <link href="${pageContext.request.contextPath}/back/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/style.css"/>
    <link href="${pageContext.request.contextPath}/back/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/ace.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/font-awesome.min.css" />
    <!--[if IE 7]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <link href="${pageContext.request.contextPath}/back/Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/back/Widget/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />

    <title>添加热门商品</title>
</head>
<body>
<div class="clearfix" id="add_picture">
    <div class="page_right_style">
        <div class="widget-header header-color-green2">
            <h4 class="lighter smaller">添加热门商品</h4>
        </div>
        <form action=""  enctype="multipart/form-data" method="post" class="form form-horizontal" id="form-article-add">

            <div class=" clearfix cl">
                <div class="Add_p_s">
                    <label class="form-label col-2">商品名称：</label>
                    <select name="productId" id="productId">
                    </select>
                </div>
                <div class="Add_p_s">
                    <label class="form-label col-2">状态：</label>
                    <div class="formControls col-2">
                        <select name="status">
                            <option value=1>显示</option>
                            <option value=0>不显示</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="clearfix cl" >
                <div class="Button_operation">
                    <button <c:if test="${flag == 'update'}">style="display:none"</c:if>
                            onclick="formSubmit('/admin/addNewProductBanner','_self');this.blur();" class="btn btn-primary radius" type="submit"><i class="icon-save ">确认添加</i>
                    </button>
                </div>
            </div>
        </form>
    </div>
</div>
</div>

<script type="text/javascript">
    $(function () {
        SELECT_LIST.getValidProductList("productId", "${product.productId}","请选择商品");
    });

    function formSubmit (url,sTarget){
        document.forms[0].target = sTarget;
        document.forms[0].action = url;
        document.forms[0].submit();
        return true;
    }
</script>

</body>
</html>