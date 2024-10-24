<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../base/base.jsp"%>
<html>
<head>
  <meta charset="utf-8" />
  <title>购物车</title>
  <link href="${ctx}/static/pro/style/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="${ctx}/static/pro/js/public.js"></script>
  <script type="text/javascript" src="${ctx}/static/pro/js/jquery-1.6.2.js"></script>
  <script type="text/javascript" src="${ctx}/static/pro/js/jqpublic.js"></script>
  <script type="text/javascript" src="${ctx}/static/pro/js/jquery-1.4.2.js"></script>
  <script>
    $(function () {

      $("input:checkbox").click(function(){
        var len = $("input:checkbox:checked").length;
        document.getElementById("shuliang").innerHTML = len+'<a>件</a>';
      });

      $(".delcart").click(function () {
        $(this).parents("tr").remove();
        var productId = $(this).attr("id");
        $.post("toDelete",{"productId":productId});
        });

      $(".allselect").click(function () {
       $(".productId").attr("checked","checked");
      });
      $(".min").click(function () {
        var $buyNumInp = $(this).siblings("input");
        var buyNum = $buyNumInp.val();
        var newBuyNum = parseInt(buyNum)-1;
        if(buyNum>1){
          newBuyNum =buyNum - 1;
          $buyNumInp.val(newBuyNum);
        }
      });

      $(".add").click(function () {
        var $buyNumInp = $(this).siblings("input");
        var buyNum = $buyNumInp.val();
        var newBuyNum = parseInt(buyNum) + 1;
        $buyNumInp.val(newBuyNum);
      });
    })
  /*  function minusValue() {
      var minusValue = document.getElementById("shuliang").value;
      minusValue.val(minusValue-1);
    }
    function addValue() {
      var addValue = document.getElementById("shuliang").value;
      addValue.val(minusValue+1);
    }*/
  function checkAmount() {
    var len = $("input:checkbox:checked").length;
    if(len <= 0) {
      alert("请勾选你要结算的商品");
      return false;
    }else{
      return true;
    }
  }
  </script>

</head>

<body>
  <%--头--%>
  <jsp:include page="../base/head.jsp"></jsp:include>
 <div class="gwc" style=" margin:auto;">
  <table cellpadding="0" cellspacing="0" class="gwc_tb1" style=" margin:auto;">
    <tr>
      <td class="tb1_td1">
       <%-- <input id="Checkbox1" type="checkbox"  name="allselect" class="allselect"/>--%></td>
      <td class="tb1_td1"><%--全选--%></td>
      <td class="tb1_td3">商品</td>
      <td class="tb1_td4">原价</td>
      <td class="tb1_td5">数量</td>  
      <td class="tb1_td6">单价</td>
      <td class="tb1_td7">操作</td>
    </tr>
  </table>
   </div>
  <div class="gwc" style=" margin:auto;">
       <form method="post" action="toOrder" onsubmit="return checkAmount()">
          <table cellpadding="0" cellspacing="0" class="gwc_tb2" id="table1" style=" margin:auto;">
            <c:set var="totalMoney" value="0"></c:set>
            <c:forEach items="${cart}"  var="entry">
              <tr>
                <input type="hidden" name="id" value="${entry.key.id}">
                <td class="tb2_td1"><input type="checkbox" value="${entry.key.id}" name="checkId"/></td>
                <td class="tb2_td2"><a href="toDetail" target="_blank"><img src="${ctx}${entry.key.imageUrl}"/></a></td>
                <td class="tb2_td3"><a href="toDetail" target="_blank" name="productName">${entry.key.productName}</a></td>
                <td class="tb1_td4" name="price"><s>￥${entry.key.price}</s></td>
                <td class="tb1_td5">
                  <a class="min" href="javascript:void(0)" value="+" class="min">-</a>
                  <input id="text_box1" name="buyNum" type="text" value="${entry.value}" style=" width:40px;height:28px; text-align:center; border:1px solid #ccc;" />
                  <a class="add" href="javascript:void(0)" value="+" class="add">+</a>
                <td class="tb1_td6"><label id="total1" class="tot" style="color:#ff5500;font-size:14px; font-weight:bold;">${entry.key.price}</label></td>
                <td class="tb1_td7"><a href="javascript:void(0)" class="delcart" id="${entry.key.id}">删除</a></td>
              </tr>
            </c:forEach>
         </table>
          <table cellpadding="0" cellspacing="0" class="gwc_tb3" style=" margin:auto;">
            <tr>
              <td class="tb1_td1"></td>
              <td class="tb3_td2 GoBack_Buy Font14"><a href="/index" target="_blank" >继续购物</a></td>
              <td class="tb3_td2">你已选商品
                <label id="shuliang" style="color:#ff5500;font-size:25px; font-weight:bold;">${buyCount}件</label></td>
              <td class="tb3_td4"><span id="jz1"></span>
                <input type="submit" class="jz2" id="jz2" value="结算"/>
            </tr>
          </table>
</form>
  </div>
<!--End content-->
<%--foot--%>
<jsp:include page="../base/foot.jsp"></jsp:include>
</body>
</html>
