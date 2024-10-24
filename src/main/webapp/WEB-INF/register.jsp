<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册账号</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="${ctx}/css/login/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/css/login/public.css">
    <script  src="${ctx}/js/common/jquery/jquery1.8.3.min.js"></script>
    <script  src="${ctx}/js/common/layer/layer.js"></script>
    <script src="${ctx}/js/jquery-3.3.1.min.js"></script>
</head>
<body>
<div id="bg"></div>
<div class="show">
    <div class="login-panel">
        <h4 class="form-title">注册账号</h4>
        <hr class="top-line">
        <form action="registerUser" method="post" onsubmit="return toVaildRegister()">
            <span type="text" id="errorInfo"></span>
            <div class="form-group">
                <label>账号</label>
                <input type="text" name="userName" class="form-control" id="userName" placeholder="Account"/>
            </div>
            <div class="form-group">
                <label for="realName">真实名称</label>
                <input type="text" name="realName" class="form-control" id="realName" placeholder="RealName"/>
            </div>
            <div class="form-group">
                <label for="email">电子邮箱</label>
                <input type="text" name="email" class="form-control" id="email" placeholder="Email"/>
            </div>
            <div class="form-group">
                <label for="password">密码</label>
                <input type="password" name="password" class="form-control" id="password" placeholder="Password"/>
            </div>
            <div class="form-group">
                <label for="telephone">电话号码</label>
                <input type="text" name="telephone" class="form-control" id="telephone" placeholder="Telephone"/>
            </div>
            <div class="form-group">
                <label for="inputCode">验证码</label>
                <div class="row">
                    <div class="col-md-6 col-sm-6 col-xs-6" id="vcode-panel">
                        <input type="text" name="vcode" id="vcode" class="form-control" id="inputCode"/>
                    </div>
                    <div id="getCode"><img src="${ctx}/getCode"/></div>
                </div>
            </div>
            <div class="form-group">
                <button type="submit" class="btn btn-info" id="submit">注册</button>
            </div>
        </form>
    </div>

    <div class="switch row">
        <button class="switch-action" id="login">已经注册过账号？<span>立即登录</span></button>
    </div>

    <div class="bottom-info">
        Powered By：<a href="/index">点餐系统</a>&nbsp;•&nbsp;<a href="/aboutUs">关于我们</a>
    </div>
</div>
</body>

<script type="text/javascript">
    jQuery(document).ready(function() {
        //点击验证码 生产新验证码
        $("#getCode").on("click",'img',function(){
            var i = new Image();
            i.src = '${ctx}/getCode?'  + Math.random();
            $(i).replaceAll(this);
        });
        //去登录界面
        $("#login").click(function () {
            window.location.href = "toLogin";
        });
    });

    //提交表单之前的全局校验
    function toVaildRegister() {

        //表单是否为空校验
        var userName = $("#userName").val();
        var realName = $("#realName").val();
        var password = $("#password").val();
        var telephone = $("#telephone").val();
        var inputEmail = $("#email").val();
        var inputCode = $("#inputCode").val();
        if(userName == '' || realName == '' || password == '' ||
            telephone == '' || inputEmail =='' || inputCode == ''){
            layer.alert("你注册的信息不完成，请补充填写！");
            return false;
        }

        $.ajax({
            type: "POST",
            url: "registerQuery",
            data: {"userName" : userName},
            dataType:'json',
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            success: function(result) {
                if(result == 400){
                    $("#errorInfo").text("用户已存在~~");
                    layer.msg("用户已存在~~",function(){});
                    return false;
                }
            }
        });

        var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/;
        if(inputEmail !=""){
            if(!reg.test(inputEmail)){
                $("#errorInfo").text("邮箱格式错误~~");
                layer.msg("邮箱格式错误");
                return false;
            }
        }

        var telephone = $("#telephone").val();
        var re = /^1[3456789]\d{9}$/;
        if(telephone != "") {
            if (!re.test(telephone)) {
                $("#errorInfo").text("手机格式有误~~");
                layer.msg("手机格式有误");
                return false;
            }
        }

        $.ajax({
             type: "POST",
             url: "inputCode",
             data: {"inputCode": inputCode},
             dataType: 'json',
             contentType: "application/x-www-form-urlencoded; charset=utf-8",
             success: function (result) {
                 if (result == 400) {
                     $("#errorInfo").text("验证码错误~~");
                     layer.msg("验证码错误");
                     return false;
                  }
              }
           });
    }

</script>
</html>