<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title>好吃么后台管理系统  </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="${pageContext.request.contextPath}/back/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="
    ${pageContext.request.contextPath}/back/assets/css/font-awesome.min.css" />
    <!--[if IE 7]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/font-awesome-ie7.min.css" />

    <![endif]-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/ace.min.css" />
    <link rel="stylesheet" href=" ${pageContext.request.contextPath}/back/assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/ace-skins.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/css/style.css"/>
    <!--[if lte IE 8]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/ace-ie.min.css" />
    <![endif]-->
    <script src="${pageContext.request.contextPath}/back/assets/js/ace-extra.min.js"></script>
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/back/assets/js/html5shiv.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/js/respond.min.js"></script>
    <![endif]-->
    <!--[if !IE]> -->
    <script src="${pageContext.request.contextPath}/back/js/jquery-1.9.1.min.js"></script>
    <!-- <![endif]-->
    <!--[if IE]>
    <script type="text/javascript">window.jQuery || document.write("<script src='${pageContext.request.contextPath}/back/assets/js/jquery-1.10.2.min.js'>"+"<"+"script>");</script>
    <![endif]-->
    <script type="text/javascript">
        if("ontouchend" in document) document.write("<script src='${pageContext.request.contextPath}/back/assets/js/jquery.mobile.custom.min.js'>"+"<"+"script>");
    </script>
    <script src="${pageContext.request.contextPath}/back/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/js/typeahead-bs2.min.js"></script>
    <!--[if lte IE 8]>
    <script src="${pageContext.request.contextPath}/back/assets/js/excanvas.min.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/back/assets/js/ace-elements.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/js/ace.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/layer/layer.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/back/assets/laydate/laydate.js" type="text/javascript"></script>


    <script type="text/javascript">
        $(function(){
            var cid = $('#nav_list> li>.submenu');
            cid.each(function(i){
                $(this).attr('id',"Sort_link_"+i);

            })
        })
        jQuery(document).ready(function(){
            $.each($(".submenu"),function(){
                var $aobjs=$(this).children("li");
                var rowCount=$aobjs.size();
                var divHeigth=$(this).height();
                $aobjs.height(divHeigth/rowCount);
            });
            //初始化宽度、高度
            $("#main-container").height($(window).height()-76);
            $("#iframe").height($(window).height()-140);

            $(".sidebar").height($(window).height()-99);
            var thisHeight = $("#nav_list").height($(window).outerHeight()-173);
            $(".submenu").height();
            $("#nav_list").children(".submenu").css("height",thisHeight);

            //当文档窗口发生改变时 触发
            $(window).resize(function(){
                $("#main-container").height($(window).height()-76);
                $("#iframe").height($(window).height()-140);
                $(".sidebar").height($(window).height()-99);

                var thisHeight = $("#nav_list").height($(window).outerHeight()-173);
                $(".submenu").height();
                $("#nav_list").children(".submenu").css("height",thisHeight);
            });


            $(".iframeurl").click(function(){
                var cid = $(this).attr("name");
                var cname = $(this).attr("title");
                $("#iframe").attr("src",cid).ready();
                $("#Bcrumbs").attr("href",cid).ready();
                $(".Current_page a").attr('href',cid).ready();
                $(".Current_page").attr('name',cid);
                $(".Current_page").html(cname).css({"color":"#333333","cursor":"default"}).ready();
                $("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display","none").ready();
                $("#parentIfour").html(''). css("display","none").ready();
            });


        });


        /*********************点击事件*********************/
        $( document).ready(function(){
            $('#nav_list').find('li.home').click(function(){
                $('#nav_list').find('li.home').removeClass('active');
                $(this).addClass('active');
            });


//时间设置
            function currentTime(){
                var d=new Date(),str='';
                str+=d.getFullYear()+'年';
                str+=d.getMonth() + 1+'月';
                str+=d.getDate()+'日';
                str+=d.getHours()+'时';
                str+=d.getMinutes()+'分';
                str+= d.getSeconds()+'秒';
                return str;
            }
            setInterval(function(){$('#time').html(currentTime)},1000);
//修改密码
            $('.change_Password').on('click', function(){
                layer.open({
                    type: 1,
                    title:'修改密码',
                    area: ['300px','300px'],
                    shadeClose: true,
                    content: $('#change_Pass'),
                    btn:['确认修改'],
                    yes:function(index, layero){
                        if ($("#password").val()==""){
                            layer.alert('原密码不能为空!',{
                                title: '提示框',
                                icon:0,

                            });
                            return false;
                        }
                        if ($("#Nes_pas").val()==""){
                            layer.alert('新密码不能为空!',{
                                title: '提示框',
                                icon:0,

                            });
                            return false;
                        }

                        if ($("#c_mew_pas").val()==""){
                            layer.alert('确认新密码不能为空!',{
                                title: '提示框',
                                icon:0,

                            });
                            return false;
                        }
                        if(!$("#c_mew_pas").val || $("#c_mew_pas").val() != $("#Nes_pas").val() )
                        {
                            layer.alert('密码不一致!',{
                                title: '提示框',
                                icon:0,

                            });
                            return false;
                        }
                        else{
                            layer.alert('修改成功！',{
                                title: '提示框',
                                icon:1,
                            });
                            layer.close(index);
                        }
                    }
                });
            });
            $('#Exit_system').on('click', function(){
                layer.confirm('是否确定退出系统？', {
                        btn: ['是','否'] ,//按钮
                        icon:2,
                    },
                    function(){
                        location.href="/admin/index";

                    });
            });

            $('#LeaveList').on('click', function(){
                layer.confirm('是否前往查看留言？', {
                        btn: ['是','否'] ,//按钮
                        icon:1,
                    },
                    function(){
                        location.href="/admin/toLeaveList";

                    });
            });
        })
    </script>
</head>
<body>
<div class="navbar navbar-default" id="navbar">
    <script type="text/javascript">
        try{ace.settings.check('navbar' , 'fixed')}catch(e){}
    </script>
    <div class="navbar-container" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand">
               <h1>网上订餐系统后台管理</h1>
            </a><!-- /.brand -->
        </div><!-- /.navbar-header -->
        <div class="navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <li class="grey">
                    <a data-toggle="dropdown" class="dropdown-toggle">
                        <i id="LeaveList" class="icon-envelope icon-animated-vertical"></i>
                        <span class="badge badge-success">${messageNum}</span>
                    </a>
                </li>
                <li class="light-blue">
                    <a data-toggle="dropdown" href="" class="dropdown-toggle">
                        <span class="time"><em id="time"></em></span><span class="user-info"><small>欢迎光临,</small>${sessionScope.user.userName}	</span>
                        <i id="Exit_system" class="icon-caret-down"></i>
                    </a>
                </li>

            </ul>
        </div>
    </div>
</div>
<div class="main-container" id="main-container">
    <script type="text/javascript">
        try{ace.settings.check('main-container' , 'fixed')}catch(e){}
    </script>
    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>
        <div class="sidebar" id="sidebar">
            <script type="text/javascript">
                try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
            </script>
            <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                    后台管理系统
                </div>
                <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                    <span class="btn btn-success"></span>
                    <span class="btn btn-info"></span>
                    <span class="btn btn-warning"></span>
                    <span class="btn btn-danger"></span>
                </div>
            </div><!-- #sidebar-shortcuts -->
            <ul class="nav nav-list" id="nav_list">
                <li class="home"><a href="javascript:void(0)" name="/admin/home" class="iframeurl" title=""><i class="icon-dashboard"></i><span class="menu-text"> 系统首页 </span></a></li>
                <li><a href="#" class="dropdown-toggle"><i class="icon-desktop"></i><span class="menu-text"> 产品管理 </span><b class="arrow icon-angle-down"></b></a>
                    <ul class="submenu">
                        <li class="home"><a  href="javascript:void(0)" name="/admin/toProductList"  title="商品列表" class="iframeurl"><i class="icon-double-angle-right"></i>商品列表</a></li>
                        <li class="home"><a href="javascript:void(0)" name="/admin/toProductClassifyList" title="分类管理"  class="iframeurl"><i class="icon-double-angle-right"></i>分类管理</a></li>

                    </ul>
                </li>
               <li>
                    <a href="#" class="dropdown-toggle"><i class="icon-eye-open"></i><span class="menu-text"> 热门管理 </span><b class="arrow icon-angle-down"></b></a>
                    <ul class="submenu">
                        <li class="home"><a href="javascript:void(0)" name="/admin/toProductBanner" title="热门管理"  class="iframeurl"><i class="icon-double-angle-right"></i>热门管理</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="dropdown-toggle"><i class="icon-list"></i><span class="menu-text"> 交易管理 </span><b class="arrow icon-angle-down"></b></a>
                    <ul class="submenu">
                        <li class="home"><a href="javascript:void(0)" name="/admin/toOrderList" title="订单管理"  class="iframeurl"><i class="icon-double-angle-right"></i>订单管理</a></li>
                        <li class="home"><a href="javascript:void(0)" name="/admin/transaction" title="交易统计"  class="iframeurl"><i class="icon-double-angle-right"></i>交易统计</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="dropdown-toggle"><i class="icon-picture "></i><span class="menu-text"> 公告管理 </span><b class="arrow icon-angle-down"></b></a>
                    <ul class="submenu">
                        <li class="home"><a href="javascript:void(0)" name="/admin/toNoticeList" title="公告管理"  class="iframeurl"><i class="icon-double-angle-right"></i>公告管理</a></li>
                    </ul>
                </li>
<%--                <li>
                    <a href="#" class="dropdown-toggle"><i class="icon-user"></i><span class="menu-text"> 会员管理 </span><b class="arrow icon-angle-down"></b></a>
                    <ul class="submenu">
                        <li class="home"><a href="javascript:void(0)" name="userList" title="会员列表"  class="iframeurl"><i class="icon-double-angle-right"></i>会员列表</a></li>
                        <li class="home"><a href="javascript:void(0)" name="memberGrading" title="等级管理"  class="iframeurl"><i class="icon-double-angle-right"></i>等级管理</a></li>
                        <li class="home"><a href="javascript:void(0)" name="integration" title="会员记录管理"  class="iframeurl"><i class="icon-double-angle-right"></i>会员记录管理</a></li>

                    </ul>
                </li>--%>
                <li><a href="#" class="dropdown-toggle"><i class="icon-edit"></i><span class="menu-text"> 留言管理 </span><b class="arrow icon-angle-down"></b></a>
                    <ul class="submenu">
                        <li class="home"><a href="javascript:void(0)" name="/admin/toLeaveList" title="留言列表" class="iframeurl"><i class="icon-double-angle-right"></i>留言列表</a></li>
                    </ul>
                </li>
                <li><a href="#" class="dropdown-toggle"><i class="icon-group"></i><span class="menu-text"> 用户管理 </span><b class="arrow icon-angle-down"></b></a>
                    <ul class="submenu">
                        <%--<li class="home"><a href="javascript:void(0)" name="adminCompetence" title="权限管理"  class="iframeurl"><i class="icon-double-angle-right"></i>权限管理</a></li>--%>
                        <li class="home"><a href="javascript:void(0)" name="/admin/toMemberList" title="用户列表" class="iframeurl"><i class="icon-double-angle-right"></i>用户列表</a></li>
                            <li class="home"><a href="javascript:void(0)" name="/admin/personalInfo" title="个人信息" class="iframeurl"><i class="icon-double-angle-right"></i>个人信息</a></li>
                    </ul>
                </li>
            </ul>
            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
            </div>
            <script type="text/javascript">
                try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
            </script>
        </div>
        <div class="main-content">
            <script type="text/javascript">
                try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
            </script>
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb">
                    <li>
                        <i class="icon-home home-icon"></i>
                        <a href="backIndex">首页</a>
                    </li>
                    <li class="active"><span class="Current_page iframeurl"></span></li>
                    <li class="active" id="parentIframe"><span class="parentIframe iframeurl"></span></li>
                    <li class="active" id="parentIfour"><span class="parentIfour iframeurl"></span></li>
                </ul>
            </div>

            <iframe id="iframe" style="border:0; width:100%; background-color:#FFF;"name="iframe" frameborder="0" src="home">  </iframe>

            <!-- /.page-content -->
        </div><!-- /.main-content -->

        <div class="ace-settings-container" id="ace-settings-container">
        </div><!-- /#ace-settings-container -->
    </div><!-- /.main-container-inner -->

</div>


</body>
</html>


