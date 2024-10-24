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
    <link href="${pageContext.request.contextPath}/back/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/ace.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/font/css/font-awesome.min.css" />
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/ace-ie.min.css" />
    <![endif]-->
    <link href="${pageContext.request.contextPath}/static/pro/style/style.css" rel="stylesheet" type="text/css"/>
    <script src="${pageContext.request.contextPath}/back/js/jquery-1.9.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/js/typeahead-bs2.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/js/lrtk.js" type="text/javascript" ></script>
    <script src="${pageContext.request.contextPath}/back/assets/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/layer/layer.js" type="text/javascript" ></script>
    <title>公告管理</title>
</head>

<body>
<form name="icform" method="post">
    <div class="page-content clearfix">
        <div class="sort_style">
            <div class="border clearfix">
       <span class="l_f">
        <a id="sort_add" class="btn btn-warning"><i class="fa fa-plus"></i> 添加公告</a>
        <a href="#" class="btn btn-danger" onclick="formSubmit('/admin/deleteBatchNotice','_self');this.blur(); "><i class="fa fa-trash"></i> 批量删除</a>
        <a href="#" class="btn btn-xs btn-success" onclick="formSubmit('/admin/showBatchNotice','_self');this.blur(); "><i class="fa fa-trash"></i> 批量显示</a>
        <a href="#" class="btn btn-xs" onclick="formSubmit('/admin/closeBatchNotice','_self');this.blur(); "><i class="fa fa-trash"></i> 批量关闭</a>
       </span>
                <span class="r_f">共：<b>4</b>类</span>
            </div>
            <div class="sort_list">
                <table class="table table-striped table-bordered table-hover" id="sample-table">
                    <thead>
                    <tr>
                        <th width="25px"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                        <th width="50px">ID</th>
                        <th width="100px">公告标题</th>
                        <!--<th width="50px">数量</th>-->
                        <th width="350px">描述</th>
                        <th width="180px">加入时间</th>
                        <th width="70px">状态</th>
                        <th width="250px">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!--<tr>
                        <td><label><input type="checkbox" class="ace"><span class="lbl"></span></label></td>
                        <td>1</td>
                        <td>幻灯片</td>
                        <!--<td>5</td>
                        <td>首页顶部广告轮播图，大图区别于其他图片</td>
                        <td>2016-6-29 12:34</td>
                        <td class="td-status"><span class="label label-success radius">显示</span></td>
                        <td class="td-manage">
                            <a onClick="member_stop(this,'10001')"  href="javascript:;" title="停用"  class="btn btn-xs btn-success"><i class="fa fa-check  bigger-120"></i></a>
                            <a title="编辑" onclick="member_edit('编辑','member-add.jsp','4','','510')" href="javascript:;"  class="btn btn-xs btn-info" ><i class="fa fa-edit bigger-120"></i></a>
                            <a title="删除" href="javascript:;"  onclick="member_del(this,'1')" class="btn btn-xs btn-warning" ><i class="fa fa-trash  bigger-120"></i></a>
                            <a href="javascript:ovid()" name="Ads_list.jsp" class="btn btn-xs btn-pink ads_link" onclick="AdlistOrders('561');" title="幻灯片广告列表"><i class="fa  fa-bars  bigger-120"></i></a>
                        </td>

                    </tr>-->
                    <c:forEach items="${noticeList}" var="notice">
                        <tr>
                            <td><label><input type="checkbox" class="ace" name="id" value="${notice.id}"><span class="lbl"></span></label></td>
                            <td class="ace1">${notice.id}</td>
                            <td class="ace2">${notice.title}</td>
                            <td class="ace3">${notice.content}</td>
                            <td class="ace4">${notice.noticeDate}</td>
                            <c:if test="${notice.status==1}"><td class="td-status"><span class="label label-success radius">显示</span></td></c:if>
                            <c:if test="${notice.status==0}"><td class="td-status"><span class="label label-defaunt radius">已关闭</span></td></c:if>
                            <td class="td-manage">

                                <c:if test="${notice.status==1}"><a onClick="member_stop(this,'10001')"  href="javascript:;" title="停用"  class="btn btn-xs"><i class="fa fa-close bigger-120"></i></a></c:if>
                                <c:if test="${notice.status==0}"><a onClick="member_start(this,'10001')"  href="javascript:;" title="启用"  class="btn btn-xs btn-success "><i class="fa fa-check  bigger-120"></i></a></c:if>
                                <a title="编辑" id="toupdateNotices" onClick="member_update(this,'10001')" href="javascript:;"  class="btn btn-xs btn-info" ><i class="fa fa-edit bigger-120"></i></a>
                                <a title="删除" href="javascript:;"  onclick="member_del(this,'1')" class="btn btn-xs btn-warning" ><i class="fa fa-trash  bigger-120"></i></a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="TurnPage" align="center">
        <a href="/admin/toNoticeList?page=${page.navigateFirstPage}">
            <span class="Prev"><i></i>首页</span>
        </a>
        <a class="PNumber">第${page.pageNum}页</a>
        <c:if test="${page.pageNum > 1}"><a href="/admin/toNoticeList?page=${page.prePage}"><span class="PNumber">上一页</span></a></c:if>
    <c:if test="${page.pageNum != page.navigateLastPage}"> <a href="/admin/toNoticeList?page=${page.nextPage}"><span class="PNumber">下一页</span></a></c:if>
        <a href="/admin/toNoticeList?page=${page.navigateLastPage}">
            <span class="Next">最后一页<i></i></span>
        </a>
        <span class="PNumber"><i></i>共${page.pages}页</span>
    </div>
    <!--添加公告-->

    <div class="sort_style_add margin" id="sort_style_add" style="display:none">
        <div class="">
            <ul>
                <li><label class="label_name">公告标题</label><div class="col-sm-9"><input name="title" type="text" id="form-field-1" placeholder="" class="col-xs-10 col-sm-5"></div></li>
                <li><label class="label_name">公告说明</label><div class="col-sm-9"><textarea name="content" class="form-control" id="form-field-8" placeholder="" onkeyup="checkLength(this);"></textarea><span class="wordage">剩余字数：<span id="sy" style="color:Red;">200</span>字</span></div></li>
                <li><label class="label_name">公告状态</label>
                    <span class="add_content"> &nbsp;&nbsp;<label>
                        <input name="status" type="radio" checked="checked" class="ace" value="1"><span class="lbl">显示</span></label>&nbsp;&nbsp;&nbsp;
                         <label>
                             <input name="status" type="radio" class="ace" value="0"><span class="lbl" >隐藏</span>
                         </label>
                    </span>
                </li>
            </ul>
        </div>
    </div>

    <!-- 修改公告-->
    <div class="sort_style_add margin" id="updateNotice" style="display:none">
        <div class="">
            <ul>
                <li><label class="label_name">公告标题</label><div class="col-sm-9"><input name="utitle" type="text" id="form-field-22" placeholder="" class="col-xs-10 col-sm-5"></div></li>
                <li><label class="label_name">公告说明</label><div class="col-sm-9"><textarea name="ucontent" class="form-control" id="form-field-2" placeholder="" onkeyup="checkLength(this);"></textarea><span class="wordage">剩余字数：<span id="sy3" style="color:Red;">200</span>字</span></div></li>
                <li><label class="label_name">公告状态</label>
                    <span class="add_content"> &nbsp;&nbsp;
                        <label>
                            <input name="ustatus" type="radio" checked="checked" class="ace" value="1"><span class="lbl">显示</span>
                        </label>&nbsp;&nbsp;&nbsp;
                        <label>
                            <input name="ustatus" type="radio" class="ace" value="0"><span class="lbl" >隐藏</span>
                        </label>
                    </span>
                </li>
            </ul>
        </div>
    </div>
</form>
</body>
</html>
<script type="text/javascript">
    function formSubmit (url,sTarget){
        document.forms[0].target = sTarget
        document.forms[0].action = url;
        document.forms[0].submit();
        return true;
    }

    function member_update(obj,id){
        $("#form-field-22").val($(obj).parents("tr").find(".ace2").html());
        $("#form-field-2").val($(obj).parents("tr").find(".ace3").html());
        $(obj).parents("tr").find(".ace").attr('checked','checked');
        updateList();
        $(obj).parents("tr").find(".ace").attr('checked','');
        $(obj).remove();
    }

    function updateList(){
        layer.open({
            type: 1,
            title: '修改公告',
            maxmin: true,
            shadeClose: false, //点击遮罩关闭层
            area : ['750px' , ''],
            content:$('#updateNotice'),
            btn:['修改','取消'],
            yes:function(index,layero){
                var num=0;
                var str="";
                formSubmit('/admin/updateNotice', '_self');
                layer.alert('修改成功！', {
                    title: '提示框',
                    icon: 1,
                });
                layer.close(index);
            }
        });
    }

    $('#sort_add').on('click', function(){
        layer.open({
            type: 1,
            title: '添加公告',
            maxmin: true,
            shadeClose: false, //点击遮罩关闭层
            area : ['750px' , ''],
            content:$('#sort_style_add'),
            btn:['提交','取消'],
            yes:function(index,layero){
                var num=0;
                var str="";
                $(".sort_style_add input[type$='text']").each(function(n){
                    if($(this).val()==true)
                    {

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
                    formSubmit('/admin/createNotice','_self')
                    layer.alert('添加成功！',{
                        title: '提示框',
                        icon:1,
                    });
                    layer.close(index);
                }
            }
        });
    })


    function checkLength(which) {
        var maxChars = 200; //
        if(which.value.length > maxChars){
            layer.open({
                icon:2,
                title:'提示框',
                content:'您出入的字数超多限制!',
            });
            // 超过限制的字数了就将 文本框中的内容按规定的字数 截取
            which.value = which.value.substring(0,maxChars);
            return false;
        }else{
            var curr = maxChars - which.value.length; //250 减去 当前输入的
            document.getElementById("sy").innerHTML = curr.toString();
            return true;
        }
    };
    /*广告图片-停用*/
    function member_stop(obj,id){
        layer.confirm('确认要关闭吗？',{icon:0,},function(index){
            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs " onClick="member_start(this,id)" href="javascript:;" title="显示"><i class="fa fa-close bigger-120"></i></a>');

            $(obj).parents("tr").find(".td-status").html('<span class="label label-defaunt radius">已关闭</span>');
            $(obj).parents("tr").find(".ace").attr('checked','checked');
            formSubmit('closeBatchNotice','_self');
            $(obj).parents("tr").find(".ace").attr('checked','');
            $(obj).remove();
            layer.msg('关闭!',{icon: 5,time:1000});
        });
    }
    /*广告图片-启用*/
    function member_start(obj,id){
        layer.confirm('确认要显示吗？',{icon:0,},function(index){

            $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn btn-xs btn-success" onClick="member_stop(this,id)" href="javascript:;" title="关闭"><i class="fa fa-check  bigger-120"></i></a>');
            $(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">显示</span>');
            $(obj).parents("tr").find(".ace").attr('checked','checked');
            formSubmit('showBatchNotice','_self');
            $(obj).parents("tr").find(".ace").attr('checked','');
            $(obj).remove();
            layer.msg('显示!',{icon: 6,time:1000});
        });
    }
    /*广告图片-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',{icon:0,},function(index){
            $(obj).parents("tr").find(".ace").attr('checked','checked');
            formSubmit('/admin/deleteNotice','_self');
            $(obj).parents("tr").find(".ace").attr('checked','');
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }
    //面包屑返回值
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.iframeAuto(index);
    $('.Order_form ,.ads_link').on('click', function(){
        var cname = $(this).attr("title");
        var cnames = parent.$('.Current_page').html();
        var herf = parent.$("#iframe").attr("src");
        parent.$('#parentIframe span').html(cname);
        parent.$('#parentIframe').css("display","inline-block");
        parent.$('.Current_page').attr("name",herf).css({"color":"#4c8fbd","cursor":"pointer"});

        parent.layer.close(index);

    });
    function AdlistOrders(id){
        window.location.href = "Ads_list.jsp?="+id;
    };
</script>
<script type="text/javascript">
    jQuery(function($) {
        var oTable1 = $('#sample-table').dataTable( {
            "aaSorting": [[ 1, "desc" ]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable":false,"aTargets":[0,2,4,6,7,]}// 制定列不参与排序
            ] } );
        $('table th input:checkbox').on('click' , function(){
            var that = this;
            $(this).closest('table').find('tr > td:first-child input:checkbox')
                .each(function(){
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

            if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
            return 'left';
        }
    })
</script>