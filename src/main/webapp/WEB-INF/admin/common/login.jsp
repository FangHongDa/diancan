
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${pageContext.request.contextPath}/back/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/font-awesome.min.css" />
    <!--[if IE 7]>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/font-awesome-ie7.min.css" />
    <![endif]-->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/ace.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/back/assets/css/ace-rtl.min.css" />
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
    <script src="${pageContext.request.contextPath}/back/js/jquery-1.9.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/back/assets/layer/layer.js" type="text/javascript"></script>
    <title>登陆</title>
</head>

<body class="login-layout">
<div class="logintop">
    <span>欢迎后台管理界面平台</span>
    <ul>
        <li><a href="/index">返回首页</a></li>
        <li><a href="">帮助</a></li>
        <li><a href="">关于</a></li>
    </ul>
</div>
<div class="loginbody">
    <div class="login-container">
        <div class="center">
            <h1>
                <i class="icon-leaf green"></i>
                <span class="white">订餐系统后台管理</span>
            </h1>
            <h4 class="white">Background Management System</h4>
        </div>

        <div class="space-6"></div>

        <div class="position-relative">
            <div id="login-box" class="login-box widget-box no-border visible">
                <div class="widget-body">
                    <div class="widget-main">
                        <h4 class="header blue lighter bigger">
                            <i class="icon-coffee green"></i>
                            管理员登陆
                        </h4>

                        <div class="login_icon"><img src="${pageContext.request.contextPath}/back/images/login.png" /></div>

                        <form class="_form" action="/admin/backLogin" method="post">
                            <fieldset>
                                <label class="block clearfix">
                                                        <a style="color: #761c19">${errorInfo}</a>
														<span class="block input-icon input-icon-right">
															<input type="text" class="form-control" placeholder="登录名"  name="userName">
															<i class="icon-user"></i>
														</span>
                                </label>

                                <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" class="form-control" placeholder="密码" name="password">
															<i class="icon-lock"></i>
														</span>
                                </label>

                                <div class="space"></div>

                                <div class="clearfix">
                                 <%--   <label class="inline">
                                        <input type="checkbox" class="ace">
                                        <span class="lbl">保存密码</span>
                                    </label>
--%>
                                    <button type="submit" class="width-35 pull-right btn btn-sm btn-primary" id="login_btn">
                                        <i class="icon-key"></i>
                                        登陆
                                    </button>
                                </div>

                                <div class="space-4"></div>
                            </fieldset>
                        </form>

                        <div class="social-or-login center">
                            <span class="bigger-110">通知</span>
                        </div>

                        <div class="social-login center">
                            本网站系统不再对IE8以下浏览器支持，请见谅。
                        </div>
                    </div><!-- /widget-main -->

                    <div class="toolbar clearfix">



                    </div>
                </div><!-- /widget-body -->
            </div><!-- /login-box -->
        </div><!-- /position-relative -->
    </div>
</div>

</body>
</html>
<script>

</script>
