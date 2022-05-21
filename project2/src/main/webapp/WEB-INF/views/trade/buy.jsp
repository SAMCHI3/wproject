<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/css/buytrade.css">
<div id="page">
   <div class="background">
      <div id="trade">
         <c:if test="${vo.scode!=null}">
            <div class="trade1">
               <div><image src="/display?fileName=${vo.pimage}" width=100 height=100></div>
               <div id="tr">
                  <div class="tr1">${vo.pmodel}</div>
                  <div class="tr1">${vo.pename}</div>
                  <div class="tr1">${vo.pkname}</div>
                  <c:if test="${vo.ssize!=null}">
                     <div class="tr1">사이즈: <strong>${vo.ssize}</strong></div>
                  </c:if>
                  <c:if test="${vo.ssize==null}">
                     <div class="tr1">사이즈: <strong>${param.ssize}</strong></div>
                  </c:if>
                  <c:if test="${vo.ssell!=null}">
                     <div class="tr1">즉시 구매가 : <strong>
                     <fmt:formatNumber value="${vo.ssell}" pattern="#,###"/>원
                     </strong></div>
                  </c:if>
               </div>
            </div>
            <hr>
            <div id="text">
               <h2><span>구매</span>하시기전에 꼭 확인하세요!</h2>
               <div class="text1">
                  <h4>구매하려는 상품이 맞습니다.</h4> 
                  상품 이미지, 모델번호, 출시일, 상품명, 사이즈를 한 번 더 확인했습니다.
                  <input type="checkbox" class="chk">
               </div>
               <div class="text1">
                  <h4>국내/해외에서 발매한 정품 · 새상품입니다.</h4>
                  모든 구성품이 그대로이며, 한 번도 착용하지 않은 정품・새상품입니다. 
                  국내 발매 상품 여부는 확인드리지 않습니다.
                  <input type="checkbox" class="chk1">
               </div>
               <div class="text1">
                  <h4>제조사에서 불량으로 인정하지 않는 기준은 하자로 판단하지 않습니다.</h4>
                  박스/패키지와 상품 컨디션에 민감하시다면 검수 기준을 반드시 확인하시기 바랍니다.
                  <input type="checkbox" class="chk2">
               </div>
               <div class="text1">
                  <h4>KREAM의 최신 이용정책을 모두 확인하였으며, 구매를 계속합니다.</h4>
                  건전하고 안전한 거래를 위해 반드시 숙지해야 할 미입고, 페널티, 부정거래 등의 이용정책을 확인했습니다.
                  <input type="checkbox" class="chk3">
               </div>
               <div class="select">
                  <c:if test="${vo.ssize==null}">
                     <button id="buy1">입찰 계속</button>
                  </c:if>
                  <c:if test="${vo.ssize!=null}">
                     <button id="buy">구매 계속</button>
                  </c:if>
                  <button id="cancel"><a href="/productList/read?pmodel=${param.pmodel}&uid=${uid}">구매 취소</a></button>
               </div>
            </div>
         </c:if>
         <c:if test="${vo.scode==null}">
            <div>
               <h3>이 상품은 입찰구매만 가능합니다.</h3>
            </div>
            </c:if>
      </div>
   </div>
</div>
<script>
   $("#buy").on("click", function(){
      if ($(".chk").is(":checked") == false){
         if(!confirm("구매동의 약관에 체크해 주세요!")) return;
      }else if($(".chk1").is(":checked") == false){
         if(!confirm("구매동의 약관에 체크해 주세요!")) return;
      }else if($(".chk2").is(":checked") == false){
         if(!confirm("구매동의 약관에 체크해 주세요!")) return;
      }else if($(".chk3").is(":checked") == false){
         if(!confirm("구매동의 약관에 체크해 주세요!")) return;
      }else if($(".chk").is(":checked") == true){
         if(!confirm("선택한 상품을 구매하시겠습니까?")) return;
         location.href="/trade/insert?pmodel=${vo.pmodel}&ssize=${vo.ssize}&uid=${uid}";
      }else if($(".chk1").is(":checked") == true){
         if(!confirm("선택한 상품을 구매하시겠습니까?")) return;
      }else if($(".chk2").is(":checked") == true){
         if(!confirm("선택한 상품을 구매하시겠습니까?")) return;
      }else if($(".chk3").is(":checked") == true){
         if(!confirm("선택한 상품을 구매하시겠습니까?")) return;
      }
   });
   
   $("#buy1").on("click", function(){
      if ($(".chk").is(":checked") == false){
         if(!confirm("구매동의 약관에 체크해 주세요!")) return;
      }else if($(".chk1").is(":checked") == false){
         if(!confirm("구매동의 약관에 체크해 주세요!")) return;
      }else if($(".chk2").is(":checked") == false){
         if(!confirm("구매동의 약관에 체크해 주세요!")) return;
      }else if($(".chk3").is(":checked") == false){
         if(!confirm("구매동의 약관에 체크해 주세요!")) return;
      }else if($(".chk").is(":checked") == true){
         if(!confirm("선택한 상품을 구매하시겠습니까?")) return;
         location.href="/trade/insert1?pmodel=${vo.pmodel}&ssize=${param.ssize}";
      }else if($(".chk1").is(":checked") == true){
         if(!confirm("선택한 상품을 구매하시겠습니까?")) return;
      }else if($(".chk2").is(":checked") == true){
         if(!confirm("선택한 상품을 구매하시겠습니까?")) return;
      }else if($(".chk3").is(":checked") == true){
         if(!confirm("선택한 상품을 구매하시겠습니까?")) return;
      }
   });
   
   $("#cancel").on("click", function(){
	   location.href="/productList/read?pmodel=" + ${param.pmodel} + "&uid=" + ${uid};
   });
</script>