<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../base/base.jsp"%>
<html>
<head>
<meta charset="utf-8" />
<title>提交订单</title>
<link href="${ctx}/static/pro/style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="${ctx}/static/pro/js/public.js"></script>
<script type="text/javascript" src="${ctx}/static/pro/js/jquery.js"></script>
<script type="text/javascript" src="${ctx}/static/pro/js/jqpublic.js"></script>
<script type="text/javascript" src="${ctx}/static/pro/js/cart.js"></script>
 <script type="text/javascript" src="${ctx}/static/pro/jquery/jquery-1.4.2.js"></script>
 <script src="/back/assets/layer/layer.js" type="text/javascript" ></script>
</head>
<body>
<jsp:include page="../base/head.jsp"></jsp:include>
<dl class="Psection MT20">
 <!--收货地址-->
 <div class="confirm_addr_f" style="margin:auto">
  <table cellpadding="0" cellspacing="0" class="gwc_tb2" style="width:100%;height:80px">
   <tr>
    <td><span class="flow_title">收货地址：</span></td>
   </tr>
   <tr>
    <td><textarea id="addressInfo" name="addressInfo">${userInfo.addressInfo}</textarea></td>
   </tr>
  </table>
  <!--支付银行-->
  <dl class="payment_page">
   <dd class="payment_page_name">
    <strong>请选择支付银行 :</strong>
   </dd>
   <dd class="banks">
    <ul>
     <tr>
      <td>
       <input name="pd_FrpId" type="radio" value="">
       <img src="${ctx}/static/pay/01gs.jpg" width="130" height="52">
      </td>
      <td>
       <input name="pd_FrpId" type="radio" value="">
       <img src="${ctx}/static/pay/02zs.jpg" width="130" height="52">
      </td>
      <td>
       <input name="pd_FrpId" type="radio" value="">
       <img src="${ctx}/static/pay/03js.jpg" width="130" height="52">
      </td>
      <td>
       <input name="pd_FrpId" type="radio" value="">
       <img src="${ctx}/static/pay/04ny.jpg" width="130" height="52">
      </td>
      <td>
       <input name="pd_FrpId" type="radio" value="">
       <img src="${ctx}/static/pay/05zg.jpg" width="130" height="52">
      </td>
      <td>
       <input name="pd_FrpId" type="radio" value="">
       <img src="${ctx}/static/pay/06jt.jpg" width="130" height="52">
      </td>
      <td>
       <input name="pd_FrpId" type="radio" value="">
       <img src="${ctx}/static/pay/07hx.jpg" width="130" height="52">
      </td>
      <td>
       <input name="pd_FrpId" type="radio" value="">
       <img src="${ctx}/static/pay/08xy.jpg" width="130" height="52">
      </td>
     </tr>
     <tr>
      <td>
       <input name="pd_FrpId" type="radio" value="">
       <img src="${ctx}/static/pay/09gd.jpg" width="130" height="52">
      </td>
      <td>
       <input name="pd_FrpId" type="radio" value="">
       <img src="${ctx}/static/pay/10sz.jpg" width="130" height="52">
      </td>
      <td>
       <input name="pd_FrpId" type="radio" value="">
       <img src="${ctx}/static/pay/11ms.jpg" width="130" height="52">
      </td>
      <td>
       <input name="pd_FrpId" type="radio" value="">
       <img src="${ctx}/static/pay/12sh.jpg" width="130" height="52">
      </td>
      <td>
       <input name="pd_FrpId" type="radio" value="">
       <img src="${ctx}/static/pay/17zy.jpg" width="130" height="52">
      </td>
      <td>
       <input name="pd_FrpId" type="radio" value="">
       <img src="${ctx}/static/pay/18fs.jpg" width="130" height="52">
      </td>
      <td>
       <input name="pd_FrpId" type="radio" value="">
       <img src="${ctx}/static/pay/19yz.jpg" width="130" height="52">
      </td>
      <td>
       <input name="pd_FrpId" type="radio" value="">
       <img src="${ctx}/static/pay/20wj.jpg" width="130" height="52">
      </td>
     </tr>
    </ul>
   </dd>
  </dl>
 </div>
 <!--订单详情-->
 <div class="Reserve Overflow">
 <form action="order" method="post" onsubmit="return checkPay()">
  <table>
  <th>菜品</th>
  <th>数量</th>
  <th>单价</th>
  <th>小计</th>
   <c:set var="totalMoney" value="0"></c:set>
   <c:forEach items="${myOrder}" var="myOrder">
    <tr>
     <td colspan="4" ><input type="hidden" name="id" value="${myOrder.key.id}"></td>
    </tr>
    <tr>
     <td><a href="toDetail" title="${myOrder.key.productName}" target="_blank" name="productName">${myOrder.key.productName}</a></td>
     <td>
      ${myOrder.value}
     </td>
     <td>￥${myOrder.key.price}</td>
     <td><b>￥${myOrder.key.price*myOrder.value}</b></td>
     <c:set  var="totalMoney" value="${totalMoney+myOrder.key.price*myOrder.value}"></c:set>
    </tr>
   </c:forEach>
   <tr>
    <td colspan="4" class="FontW CorRed Font14">共计费用：￥${totalMoney}</td>
    </tr>
   <tr>
    <td colspan="2" class="FontW CorRed Font14"><a href="toMyCart"/>返回购物车 </td>
    <td colspan="2"><input type="submit" name="" value="确认支付订单" class="Submit">
   </tr>
   </table>
  </form>
 </div>
<%--头--%>
<jsp:include page="../base/foot.jsp"></jsp:include>
</body>
</html>
<script type="text/javascript">
 function checkPay(){

  var result = confirm("确定支付订单？");
  if(result == false){
   layer.msg("支付操作已取消");
   return false;
  }
  if(result == true){
   layer.msg("支付成功");
   return true;
  }
 }
</script>
