<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>用户中心--地址修改和新增</title>
    <link href="${ctx}/static/pro/style/style.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${ctx}/static/pro/js/public.js"></script>
    <script type="text/javascript" src="${ctx}/static/pro/js/jquery.js"></script>
    <script type="text/javascript" src="${ctx}/static/pro/js/jqpublic.js"></script>
    <script>
    </script>
</head>
<body>
<jsp:include page="../base/head.jsp"></jsp:include>
<!--Start content-->
<section class="Psection MT20">
    <article class="U-article Overflow">
        <!--user Address-->
        <section class="Myaddress Overflow">
            <span class="MDtitle Font14 FontW Block Lineheight35">更换邮箱</span>
            <form action="saveEmail" method="post">
                <table>
                    <tr><input type="hidden" name="userId" value="${userInfos.userId}"/></tr>
                    <tr>
                        <td colspan="2" align="center"><span style="color: red">${msg}</span></td>
                    </tr>
                    <tr>
                        <td width="30%" class="Font14 FontW Lineheight35" align="right">新邮箱：</td>
                        <td><input type="text" name="newEmail"></td>
                    </tr>
                    <tr>
                        <td align="right" width="30%" class="Font14 FontW Lineheight35"></td>
                        <td class="Lineheight35"><input name="" type="submit" value="确认修改" class="Submit">
                            <input name="" type="button" value="返回" class="Submit"
                                   onclick="window.history.go(-1);this.blur();"></td>
                    </tr>
                </table>
            </form>
        </section>
    </article>
</section>
<!--End content-->
<jsp:include page="../base/foot.jsp"></jsp:include>
</body>
</html>
