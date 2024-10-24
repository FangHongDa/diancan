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
    <div class="sort_style_add margin" id="updateNotice" style="display:none">
        <div class="">
            <ul>
                <li><label class="label_name">公告标题</label><div class="col-sm-9"><input name="utitle" type="text" id="form-field-22" placeholder="" class="col-xs-10 col-sm-5"></div></li>
                <li><label class="label_name">公告说明</label><div class="col-sm-9"><textarea name="ucontent" class="form-control" id="form-field-2" placeholder="" onkeyup="checkLength(this);"></textarea><span class="wordage">剩余字数：<span id="sy3" style="color:Red;">200</span>字</span></div></li>
                <li><label class="label_name">公告状态</label>
                    <span class="add_content"> &nbsp;&nbsp;<label><input name="ustate" type="radio" checked="checked" class="ace" value="1"><span class="lbl">显示</span></label>&nbsp;&nbsp;&nbsp;
     <label><input name="ustate" type="radio" class="ace" value="0"><span class="lbl" >隐藏</span></label></span>
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
                formSubmit('updateNotice', '_self');
                layer.alert('修改成功！', {
                    title: '提示框',
                    icon: 1,
                });
                layer.close(index);
            }
        });
    }


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