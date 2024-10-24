<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/back/Widget/Validform/5.3.2/Validform.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/js/typeahead-bs2.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/js/jquery.dataTables.bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/layer/layer.js" type="text/javascript" ></script>
    <script src="${pageContext.request.contextPath}/back/js/lrtk.js" type="text/javascript" ></script>
    <script src="${pageContext.request.contextPath}/back/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/back/assets/laydate/laydate.js" type="text/javascript"></script>
    <title>管理员</title>
</head>
<body>
<div class="page-content clearfix">
    <div class="administrator">
        <div class="d_Confirm_Order_style">
            <div class="search_style">
                <form action="<%=request.getContextPath()%>/admin/selectUser" name="selectForm">
                    <div class="title_names">搜索查询</div>
                    <ul class="search_content clearfix">
                        <li><label class="l_f">用户名称</label><input name="userName" type="text"  class="text_add" placeholder=""  style=" width:400px"/></li>
                        <li style="width:90px;"><button type="button" class="btn_search" onclick="select_form()"><i class="fa fa-search"></i>查询</button></li>
                    </ul>
                </form>
            </div>
    <%--        <!--操作-->
            <div class="border clearfix">
       <span class="l_f">
           		<shiro:hasPermission name="超级管理员">
                    <a href="javascript:void(0)" onclick="add_Admin()" id="administrator_add" class="btn btn-warning"> <i class="fa fa-plus"></i> 添加用户</a>
                    <a href="javascript:void(0)"  onclick="deleteAdminForm()" class="btn btn-danger"><i class="fa fa-trash"></i> 批量删除</a>
                </shiro:hasPermission>

       </span>--%>

            </div>

            <div class="table_menu_list"  id="testIframe">
                <form action ="<%=request.getContextPath()%>/deleteAdmins" name='myForm'>
                    <table class="table table-striped table-bordered table-hover" id="sample_table">
                        <thead>
                        <th width="25px"><input type="checkbox" class="allC"/></th>
                        <th width="50px">序号</th>
                        <th width="70px">登录名</th>
                        <th width="70px">真实姓名</th>
                        <th width="80px">手机</th>
                        <th width="80px">邮箱</th>
                        <th width="60px">角色</th>
                        <th width="60px">状态</th>
                        <th width="200px">操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${userList}" var="user">
                        <tr>
                            <td><input type="checkbox" class="adC" value="${user.id}" class="${user.id}" name="id"/></td>
                            <td><input type="text" name="id" value="${user.id}" disabled="disabled"></td>
                            <td><input type="text" name="username" value="${user.userName}" class="${user.id}" disabled="disabled" ></td>
                            <td><input type="text" name="userInfo.realName" value="${user.userInfo.realName}" clss="${user.id}" disabled="disabled" ></td>
                            <td><input type="text" name="userInfo.telephone" value="${user.userInfo.telephone}" class="${user.id}" disabled="disabled" /></td>
                            <td><input type="text" name="userInfo.email" value="${user.userInfo.email}" class="${user.id}" disabled="disabled" /></td>
                            <td>
                                <select name="role.roleId" style="width:145px" disabled="disabled" class="${user.id}">
                                    <c:forEach items="${roleList}" var="role">
                                        <option value="${role.id}"<c:if test="${role.id==user.roleId}">selected="selected"</c:if>>${role.name}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td class="td-status" >
                                <span class="label label-success radius" name="${user.id}">
                                    <c:if test="${user.status == 1}">已启用</c:if>
                                    <c:if test="${user.status == 0}">停用</c:if>
                                </span>
                            </td>
                            <td class="td-manage">
                                <a href="javascript:void(0)" title="停用/启用"  onclick="changeState('${user.id}')" class="btn btn-xs btn-success" name="${user.id}"><i class="fa fa-check  bigger-120"></i></a>
                                <a title="编辑" onclick="modify('${user.id}')" href="javascript:void(0);"  class="btn btn-xs btn-info" name="${user.id}"><i class="fa fa-edit bigger-120"></i></a>
                                <a title="修改" onclick="update_Admin('${user.id}')"class="btn btn-xs btn-info"   name="${user.id}"><i class="fa fa-edit bigger-120"></i></a>
                                <a title="删除" href="javascript:void(0)" onclick="member_del(this,'${user.id}')" class="btn btn-xs btn-warning" ><i class="fa fa-trash  bigger-120"></i></a>
                            </td>
                            </c:forEach>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
<!--添加管理员-->
<div id="add_administrator_style" class="add_menber" style="display:none">
    <form action="<%=request.getContextPath()%>/addAdmin" id="form-admin-add">
        <div class="form-group">
            <label class="form-label"><span class="c-red">*</span>管理员：</label>
            <div class="formControls">
                <input type="text" class="input-text" placeholder="" id="user-name" name="username" datatype="*2-16" nullmsg="用户名不能为空">
            </div>
            <div class="col-4"> <span class="Validform_checktip"></span></div>
        </div>
        <div class="form-group">
            <label class="form-label"><span class="c-red">*</span>真实姓名：</label>
            <div class="formControls">
                <input type="text" class="input-text" placeholder="" id="user-realname" name="userInfo.realName" datatype="*2-16" nullmsg="用户名不能为空">
            </div>
            <div class="col-4"> <span class="Validform_checktip"></span></div>
        </div>
        <div class="form-group">
            <label class="form-label"><span class="c-red">*</span>初始密码：</label>
            <div class="formControls">
                <input type="password" placeholder="密码" name="password" autocomplete="off" value="" class="input-text" datatype="*6-20" nullmsg="密码不能为空">
            </div>
            <div class="col-4"> <span class="Validform_checktip"></span></div>
        </div>
        <div class="form-group">
            <label class="form-label "><span class="c-red">*</span>确认密码：</label>
            <div class="formControls ">
                <input type="password" placeholder="确认新密码" autocomplete="off" class="input-text Validform_error" errormsg="您两次输入的新密码不一致！" datatype="*" nullmsg="请再输入一次新密码！" recheck="password" id="password1" name="password1">
            </div>
            <div class="col-4"> <span class="Validform_checktip"></span></div>
        </div>
        <div class="form-group">
            <label class="form-label "><span class="c-red">*</span>手机：</label>
            <div class="formControls ">
                <input type="text" class="input-text" value="" placeholder="" id="user-tel" name="userInfo.telephone" datatype="m" nullmsg="手机不能为空">
            </div>
            <div class="col-4"> <span class="Validform_checktip"></span></div>
        </div>
        <div class="form-group">
            <label class="form-label"><span class="c-red">*</span>邮箱：</label>
            <div class="formControls ">
                <input type="text" class="input-text" placeholder="@" name="userInfo.email" id="email" datatype="e" nullmsg="请输入邮箱！">
            </div>
            <div class="col-4"> <span class="Validform_checktip"></span></div>
        </div>
        <div class="form-group">
            <label class="form-label">角色：</label>
            <div class="formControls "> <span class="select-box" style="width:150px;">
				<select class="select" name="role.roleId" size="1">
                    <option value="1" selected="selected">用户</option>
                </select>
				</span> </div>
        </div>
        <div class="form-group">
            <label class="form-label">状态：</label>
            <div class="formControls "> <span class="select-box" style="width:150px;">
				    <input name="userInfo.state" type="radio" value="0" />停用
                    <input name="userInfo.state" type="radio" value="1" />启用
				</span> </div>
        </div>
        <div>
            <input class="btn btn-primary radius" type="submit" id="Add_Administrator" value="&nbsp;&nbsp;提交&nbsp;&nbsp;">
        </div>
    </form>
</div>
</div>
</body>
</html>
<script type="text/javascript">
    jQuery(function($) {
        var oTable1 = $('#sample_table').dataTable( {
            "aaSorting": [[ 1, "desc" ]],//默认第几个排序
            "bStateSave": true,//状态保存
            "aoColumnDefs": [
                //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
                {"orderable":false,"aTargets":[0,2,3,4,5,7,8,]}// 制定列不参与排序
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

            if( parseInt(off2.left) &lt; parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
            return 'left';
        }
    });

</script>
<script type="text/javascript">
    $(function() {
        $("#administrator").fix({
            float : 'left',
            //minStatue : true,
            skin : 'green',
            durationTime :false,
            spacingw:50,//设置隐藏时的距离
            spacingh:270,//设置显示时间距
        });
    });


    $(function() {
        $(".allC").click(function(){
            $(".adC").prop("checked", $(this).prop("checked"));
        });
    })

    //初始化宽度、高度
    $(".widget-box").height($(window).height()-215);
    $(".table_menu_list").width($(window).width()-260);
    $(".table_menu_list").height($(window).height()-215);
    //当文档窗口发生改变时 触发
    $(window).resize(function(){
        $(".widget-box").height($(window).height()-215);
        $(".table_menu_list").width($(window).width()-260);
        $(".table_menu_list").height($(window).height()-215);
    })
    laydate({
        elem: '#start',
        event: 'focus'
    });

    function changeState(result) {
        var StateName = $("span[name="+result+"]").text();
        if(StateName == "已启用"){
            $.post("/admin/stopStatus", {"userId" : result},"");
            $("span[name="+result+"]").text("停用");
        }else{
            $.post("/admin/startStatus", {"userId" : result},"");
            $("span[name="+result+"]").text("已启用");
        }
    }

    /*产品-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
            $.post("/admin/deleteUserById",{"userId" : id},"");
        });


    }

    function modify(id){
        $("input[type='text'][class="+id+"]").prop("disabled", false);
        $("select[class="+id+"]").prop("disabled", false);
        $("a[title='编辑'][name="+id+"]").removeAttr('href');
        $("a[title='修改'][name="+id+"]").prop('href','javascript:void(0);');
    }

    function update_Admin(id) {
        $("a[title='修改'][name="+id+"]").removeAttr('href');
        $("a[title='编辑'][name="+id+"]").prop('href','javascript:void(0);');
        $("input[type='text'][class="+id+"]").prop("disabled", true);
        $("select[class="+id+"]").prop("disabled", true);
        $.post("/admin/updateAdmin",{
            "userId" :  $("input[type='text'][class="+id+"][name='userId']").val(),
            "username" :  $("input[type='text'][class="+id+"][name='username']").val(),
            "userInfo.telephone" :  $("input[type='text'][class="+id+"][name='userInfo.telephone']").val(),
            "userInfo.email" :  $("input[type='text'][class="+id+"][name='userInfo.email']").val(),
            "role.roleId" :  $("select[class="+id+"]").val()
        },"");
    }

    function deleteAdminForm(){
        document.myForm.submit();
    }

    function select_form(){
        document.selectForm.submit();
    }

    /*产品-编辑*/
    function member_edit(title,url,id,w,h){
        layer_show(title,url,w,h);
    }
    /*添加管理员*/
    function add_Admin(){
        layer.open({
            type: 1,
            title:'添加用户',
            area: ['700px','600px'],
            shadeClose: true,
            content: $('#add_administrator_style')

        });
    }

</script>


