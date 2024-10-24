<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link href="/back/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="/back/css/style.css"/>
    <link href="/back/assets/css/codemirror.css" rel="stylesheet">
    <link rel="stylesheet" href="/back/assets/css/ace.min.css" />
    <link rel="stylesheet" href="/back/font/css/font-awesome.min.css" />
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="/back/assets/css/ace-ie.min.css" />
    <![endif]-->
    <script src="/back/js/jquery-1.9.1.min.js"></script>
    <script src="/back/assets/js/bootstrap.min.js"></script>
    <script src="/back/assets/js/typeahead-bs2.min.js"></script>
    <script src="/back/assets/js/jquery.dataTables.min.js"></script>
    <script src="/back/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script src="/back/assets/layer/layer.js" type="text/javascript" ></script>
    <script src="/back/assets/laydate/laydate.js" type="text/javascript"></script>
    <title>留言</title>
</head>

<body>
<form method="post" name="icform">
    <div class="margin clearfix">
        <div class="Guestbook_style">
            <div class="search_style">
                <div class="title_names">搜索查询</div>
                <ul class="search_content clearfix">
                    <li><label class="l_f">用户名</label><input name="userName" type="text" class="inline laydate-icon" id="start" style=" margin-left:10px;"></li>
                    <li style="width:90px;"><button type="button" onclick="formSubmit('/admin/findConditionLeaveList','_self');this.blur();" class="btn_search" ><i class="icon-search"></i>查询</button></li>
                </ul>
            </div>
            <div class="border clearfix">
       <span class="l_f">
        <a href="javascript:ovid()" onclick="formSubmit('/admin/deleteAll','_self');this.blur();" class="btn btn-danger"><i class="fa fa-trash"></i>&nbsp;批量删除</a>
        <a href="javascript:ovid()" onclick="formSubmit('/admin/openAll','_self');this.blur();" class="btn btn-sm btn-primary"><i class="fa fa-check"></i>&nbsp;已浏览</a>
        <a href="javascript:ovid()"onclick="formSubmit('/admin/closeAll','_self');this.blur();" class="btn btn-yellow"><i class="fa fa-times"></i>&nbsp;未浏览</a>
       </span>
            </div>
            <!--留言列表-->
            <div class="Guestbook_list">

                <table class="table table-striped table-bordered table-hover" id="sample-table">
                    <thead>
                    <tr>
                        <th width="25"><label><input type="checkbox" class="ace"><span class="lbl"></span></label></th>
                        <th width="80">ID</th>
                        <th width="150px">用户名</th>
                        <th width="">留言内容</th>
                        <th width="200px">时间</th>
                        <th width="70">状态</th>
                        <th width="250">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="leave">
                        <tr>

                            <td><label><input type="checkbox" class="ace" name="id" value="${leave.id}"><span class="lbl"></span></label></td>
                            <td>${leave.id}</td>
                            <td><a style="cursor:pointer"  class="text-primary" href="/admin/memberShow?id=${leave.user.id}">${leave.user.userName}</a></td>
                            <td class="text-l">
                                ${leave.content}
                            <td>${leave.leaveDate}</td>
                            <c:if test="${leave.status==1}">
                                <td class="td-status" ><span class="label label-success radius">已览浏</span></td>
                            </c:if>

                            <c:if test="${leave.status==0}">
                                <td class="td-status"><span class="label label-success radius"><a href="/updateStateOnlyOne?leaveId=${leave.id}">未浏览</a></span></td>
                            </c:if>

                            <td class="td-manage">
                                <a  href="/admin/delete?leaveId=${leave.id}"  onclick="member_del(this,'1')" title="删除" class="btn btn-xs btn-warning" ><i class="fa fa-trash  bigger-120"></i></a>
                            </td>
                        </tr>

                    </c:forEach>

                    </tbody>
                </table>

            </div>
        </div>
    </div>

</form>
</body>
</html>
<script type="text/javascript">

/*    /!*留言-删除*!/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $(obj).parents("tr").remove();

            layer.msg('已删除!',{icon:1,time:1000});
        });
    }*/



    /*checkbox激发事件*/
    $('#checkbox').on('click',function(){
        if($('input[name="checkbox"]').prop("checked")){
            $('.Reply_style').css('display','block');
        }
        else{

            $('.Reply_style').css('display','none');
        }
    })
    /* form处理*/
    /* ----------------------------------------------------------------------汇通处理方式--------------------------------------------打开一个新页面：调用时不加第二个参数 add by tony */
    function formSubmit (url,sTarget){
        document.forms[0].target = sTarget;
        document.forms[0].action = url;
        document.forms[0].submit();
        return true;
    }
</script>
<script type="text/javascript">
    jQuery(function($) {
        var oTable1 = $('#sample-table').dataTable( {
            "aaSorting": [[ 1, "desc" ]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable":false,"aTargets":[0,2,3,5,6]}// 制定列不参与排序
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
