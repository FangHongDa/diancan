<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<meta charset="utf-8" />
<title>用户中心--地址修改和新增</title>
<link href="${ctx}/static/pro/style/style.css" rel="stylesheet" type="text/css" />
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
   <span class="MDtitle Font14 FontW Block Lineheight35">更换手机号</span>
   <form action="saveTelephone" method="post">
   <table>
    <tr><input type="hidden" name="userId"  value="${userInfos.userId}"/></tr>
    <tr><td colspan="2" align="center"><span style="color: red">${msg}</span></td></tr>
    <tr>
     <td width="30%" class="Font14 FontW Lineheight35" align="right">新号码：：</td>
     <td><input type="text" name="newTel"  ></td>
    </tr>
    <tr>
     <td align="right"  width="30%" class="Font14 FontW Lineheight35"></td>
     <td class="Lineheight35"><input name="" type="submit" value="确认修改" class="Submit">
      <input name=""  type="button" value="返回" class="Submit" onclick="window.history.go(-1);this.blur();"></td>
    </tr>
   </table>
   </form>
  <%-- <!--add new address-->
   <form action="#">
    <table style="margin-top:10px;">
    <tr>
     <td width="30%" class="Font14 FontW Lineheight35" align="right">收货地址：</td>
   &lt;%&ndash;  <td>
     <select name="" class="select_ssq">
      <option>陕西省</option>
     </select>
     <select name="" class="select_ssq">
     <option>西安市</option>
     </select>
     <select name="" class="select_ssq">
     <option>莲湖区</option>
     </select>&ndash;%&gt;
     </td>
    </tr>
    <tr>
     <td width="30%" class="Font14 FontW Lineheight35" align="right">收件人姓名：</td>
     <td><input type="text" name="" required  class="input_name"></td>
    </tr>
    <tr>
     <td width="30%" class="Font14 FontW Lineheight35" align="right">街道地址：</td>
     <td><input type="text" required  class="input_addr"></td>
    </tr>
    <tr>
     <td width="30%" class="Font14 FontW Lineheight35" align="right">邮政编码：</td>
     <td><input type="text" required pattern="[0-9]{6}"  class="input_zipcode"></td>
    </tr>
    <tr>
     <td width="30%" class="Font14 FontW Lineheight35" align="right">手机号码：</td>
     <td><input type="text" name="" required pattern="[0-9]{11}" class="input_tel"></td>
    </tr>
    <tr>
     <td width="30%" class="Font14 FontW Lineheight35" align="right"></td>
     <td class="Font14 Font Lineheight35"><input name="" type="submit" value="新增收货地址"  class="Submit"></td>
    </tr>
   </table>
   </form>--%>
  </section>
 </article>
</section>
<!--End content-->
<jsp:include page="../base/foot.jsp"></jsp:include>
</body>
</html>
