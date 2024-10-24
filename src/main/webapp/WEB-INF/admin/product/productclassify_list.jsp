<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link href="${pageContext.request.contextPath}/back/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/style.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/ace.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/font-awesome.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/Widget/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link href="${pageContext.request.contextPath}/back/Widget/icheck/icheck.css" rel="stylesheet" type="text/css" />
    <!--[if IE 7]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/ace-ie.min.css" />
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
    <script src="${pageContext.request.contextPath}/back/assets/layer/layer.js" type="text/javascript" ></script>
    <script src="${pageContext.request.contextPath}/back/assets/laydate/laydate.js" type="text/javascript"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/Widget/zTree/js/jquery.ztree.all-3.5.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/js/lrtk.js" type="text/javascript" ></script>
    <title>产品列表</title>
</head>
<body>
<form method="post" name="icform">
    <div class=" page-content clearfix">
        <div id="products_style">
            <div class="border clearfix">
       <span class="l_f">
        <a id="toAddClassify"  title="添加类别" class="btn btn-warning Order_form" ><i class="icon-plus"></i>添加类别</a>
        <a onclick="formSubmit('/admin/batchtDeleteProduct','_self');this.blur();" class="btn btn-danger"><i class="icon-trash"></i>批量删除</a>
       </span>

            </div>

            <div class="table_menu_list" id="testIframe">
                <table class="table table-striped table-bordered table-hover" id="sample-table">
                    <thead>
                    <tr>
                        <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                        <th width="100px">种类序号</th>
                        <th width="100px">种类名称</th>
                        <th width="150px">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${productKindList}" var="productKind">
                        <tr>
                            <td width="25px"><label><input type="checkbox" class="ace" name="id" value="${productKind.id}" ><span class="lbl"></span></label></td>
                            <td width="100px">${productKind.id}</td>
                            <td width="100px" class="formKindName">${productKind.kindName}</td>
                            <td class="td-manage">
                                <a title="编辑"  onclick="classifyUpdate(this,'10001')"  href="javascript:;"  class="btn btn-xs btn-info" ><i class="icon-edit bigger-120"></i></a>
                                <a title="删除" href="/admin/deleteKindById?kindId=${productKind.id}"  class="btn btn-xs btn-warning" ><i class="icon-trash  bigger-120"></i></a>
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
                <li><label class="label_name">商品种类名</label><div class="col-sm-9"><input name="kindName" type="text" placeholder="" class="col-xs-10 col-sm-5"></div></li>
            </ul>
        </div>
    </div>

    <!--修改类别-->
    <div class="sort_style_add margin" id="classify_update" style="display:none">
        <div class="">
            <ul>
                <li><label class="label_name">商品种类名</label><div class="col-sm-9"><input name="updateKindName" id="form_kind_name" type="text" placeholder="" class="col-xs-10 col-sm-5"></div></li>
            </ul>
        </div>
    </div>
</form>
</body>
</html>
<script>
    /* form处理*/
    /* ----------------------------------------------------------------------汇通处理方式--------------------------------------------打开一个新页面：调用时不加第二个参数 add by tony */
    function formSubmit (url,sTarget){
        document.forms[0].target = sTarget;
        document.forms[0].action = url;
        document.forms[0].submit();
        return true;
    }

        //添加类别
        $("#toAddClassify").click(function(event) {
            layer.open({
                type: 1,
                title: '添加类别',
                maxmin: true,
                shadeClose: false,
                area: ['750px', ''],
                content: $('#classify_add'),
                btn: ['提交', '取消'],
                yes:function(index,layero){
                    var num=0;
                    var str="";
                    $(".classify_add input[type$='text']").each(function(n){
                        if($(this).val()==true){
                            layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
                                title: '提示框',
                                icon:0,
                            });
                            num++;
                            return false;
                        }
                    });
                    if(num>0){  return false;}
                    else{
                        formSubmit('/admin/addClassify','_self')
                        layer.alert('添加成功！',{
                            title: '提示框',
                            icon:1,
                        });
                        layer.close(index);
                    }
                }
            });
        });


    function classifyUpdate(obj,id){
        $("#form_kind_name").val($(obj).parents("tr").find(".formKindName").html());
        $(obj).parents("tr").find(".ace").attr('checked','checked')
        updateClassify();
        $(obj).parents("tr").find(".ace").attr('checked','');
        $(obj).remove();
    }

    function updateClassify(){
        layer.open({
            type: 1,
            title: '修改类别',
            maxmin: true,
            shadeClose: false, //点击遮罩关闭层
            area : ['750px' , ''],
            content:$('#classify_update'),
            btn:['修改','取消'],
            yes:function(index,layero){
                var num=0;
                var str="";
                formSubmit('/admin/updateClassify', '_self');
                layer.alert('修改成功！', {
                    title: '提示框',
                    icon: 1,
                });
                layer.close(index);
            }
        });
    }
</script>
