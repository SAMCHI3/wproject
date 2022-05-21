
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<link href="/resources/css/buysinsert.css" rel="stylesheet" >
<head>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>


<div id="page">
<div class="background">
   <h1>판매등록</h1>
   <div class="container">
      <c:if test="${vo.bprice!=null}">
      <div class="buy">
         <div id="trade">
         <div class="trade1">
            <div class="trade2">
               <image src="/display?fileName=${vo.pimage}" width=100 height=100>
            </div>
            <div id="tr">
               <div class="trl" id="sid" style="display: none;">${uid}</div>
               <div class="tr1" id="smodel">${vo.pmodel}</div>
               <div class="tr1">${vo.pename}</div>
               <div class="tr1">${vo.pkname}</div>
               <c:if test="${vo.plprice==null}">
                  <div class="tr1" id="plprice">즉시판매가격: <fmt:formatNumber value="${vo.bprice}" pattern="#,###"/>원</div>
               </c:if>
               <c:if test="${vo.plprice!=null}">
                  <div class="tr1" id="plprice">평균거래가격: ${vo.plprice}</div>
               </c:if>
               <div class="tr1" id="ssize">판매 사이즈: ${param.bsize}</div>
            </div>
         </div>
      </div>
      <hr>
      <form name="frm" method="post" action="sinsert" enctype="multipart/form-data">
      <div id="buy1">
         <table>
            <c:if test="${vo.plprice!=null}">
               <tr style="position: relative; left: 8rem;">
                  <td class="title" width=200>판매금액입력</td>
                  <td width=500><input type="text" id="ssell1">원</td>
               </tr>
            </c:if>
            <tr style="display:none;">
               <td><input type="text" name="sid" value="${uid}"></td>
               <td><input type="text" name="ssize" value="${param.bsize}"></td>
               <td><input type="text" name="smodel" value="${vo.pmodel}"></td>
               <td><input type="text" id="ssell" value="${vo.bprice}"></td>
               <td><input type="text" name="bcode" value="${vo.bcode}"></td>
               <td><input type="text" name="ssell"></td>
               <td><input type="text" id="ing" value="3"></td>
               <td><input type="text" id="ing1" value="4"></td>
               <td><input type="text" name="ing"></td>
               <td><input type="text" name="sout" value="5"></td>
               <td><input type="text" name="bout" value="5"></td>
            </tr>
         </table>
         <c:if test="${vo.plprice==null}">
            <div class="sbutton"><button type="submit" class="sell1">즉시판매</button></div>
         </c:if>
         <c:if test="${vo.plprice!=null}">
            <div class="sbutton"><button type="submit" class="sell" >입찰판매</button></div>
         </c:if>
      </div>
   </form>
   </c:if>
   <c:if test="${vo.bprice==null}">
      <h3>이 상품은 입찰판매만 가능합니다.</h3>
   </c:if>
   		</div>
	</div>
</div>
<script>
   
   $(frm).on("submit", function(e) {
      e.preventDefault();
   });
   
   //즉시판매눌렀을때
   $(".sell1").on("click", function() {
      var bcode = $(frm.bcode).val();
      var ssell = $("#ssell").val();
      var sid = $(frm.sid).val();
      var ssize = $(frm.ssize).val();
      var smodel = $(frm.smodel).val();
      var ing = $("#ing").val();
      var sout = $(frm.sout).val();
      var bout = $(frm.bout).val();
      $(frm.ssell).val(ssell);
      $(frm.ing).val(ing);
      
      if (!confirm("상품을 즉시판매하실래요?")) return;
      frm.submit();
   });
   
   //입찰판매눌렀을때
   $(".sell").on("click", function() {
      frm.action="sinsert1";
      var ssell = $("#ssell1").val();
      var sid = $(frm.sid).val();
      var ssize = $(frm.ssize).val();
      var smodel = $(frm.smodel).val();
      var ing1 = $("#ing1").val();
      ssell = $(frm.ssell).val(ssell);
      ing = $(frm.ing).val(ing1);
      $(frm.sout).val('0');
      
      if (!confirm("상품을 입찰판매하실래요?")) return;
      frm.submit();
   });

</script>