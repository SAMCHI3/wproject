<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<link href="/resources/css/buyinsert.css" rel="stylesheet" >
<div id="page">
   <h1>구매계속</h1>
   <div class=background>
      <div id="trade">
         <div class="trade-position">
            <div class="trade1">
               <div>
                  <image src="/display?fileName=${vo.pimage}" width=100 height=100>
               </div>
               <div id="tr">
                  <div class="tr1">${vo.pmodel}</div>
                  <div class="tr1">${vo.pename}</div>
                  <div class="tr1">${vo.pkname}</div>
                  <c:if test="${vo.ssize!=null}">
                     <div class="tr1">사이즈: ${vo.ssize}</div>
                  </c:if>
                  <c:if test="${vo.ssize==null}">
                     <div class="tr1">사이즈: ${param.ssize}</div>
                  </c:if>
                  <c:if test="${vo.ssell!=null}">
                     <div class="tr1">즉시 구매가 : 
                        <fmt:formatNumber value="${vo.ssell}" pattern="#,###"/>원
                     </div>
                  </c:if>
                  <c:if test="${vo.ssell==null}">
                     <div class="tr1">최근 거래가 : 
                        ${vo.plprice}
                     </div>
                  </c:if>
               </div>
            </div>
       
         </div>
      </div>
      <div id="buy1">
         <form name="frm" method="post" action="insert" enctype="multipart/form-data">
            <table>
               <c:if test="${vo.ssell==null}">
                  <tr>
                     <td class="title" width=130>입찰금액입력</td>
                     <td width=500><input type="text" id="sbuy1">원</td>
                  </tr>
               </c:if>
               <tr>
                  <td class="title" width=130>전화번호</td>
                  <td width=500><input type="text" name="btell"> 
                  <%--                   value="${vo.utel}"></td> --%>
               </tr>
               <tr>
                  <td class="title" width=130 style="padding-top:7px; text-align:center">주소</td>
                  <td width=500><input type="text" name="baddress" size=30>
                     <%--                   value="${vo.uaddress}"> --%>
                     <button type="button" id="search">주소검색</button> <br></td>
               </tr>
               <tr>
                  <td width="130" class="title">상세주소</td>
                  <td width="450"><input type="text" name="baddress1" size="50"></td>
               </tr>
               <c:if test="${vo.ssize!=null}">
               <tr>
               <td width="130" class="title">결제방법</td>
               <td width="600">
               
                  <select>
                     <option>카드결제</option>
                     <option>카카오페이결제</option>
                     <option>무통장결제</option>
                  </select>
               </td>
            </tr>
            </c:if>
            <tr style="display:none;">
               <td><input type="text" name="bprice" value="${vo.ssell}"></td>
               <td><input type="text" name="bid" value="${uid}"></td>
               <td><input type="text" name="bsize" value="${vo.ssize}"></td>
               <td><input type="text" id="bsize1" value="${param.ssize}"></td>
               <c:if test="${vo.smodel!=null}">
                  <td><input type="text" name="bmodel" value="${vo.smodel}"></td>
               </c:if>
               <c:if test="${vo.smodel==null}">
                  <td><input type="text" name="bmodel" value="${vo.pmodel}"></td>
               </c:if>
               <td><input type="text" name="bout" value="5"></td>
               <td><input type="text" name="scode" value="${vo.scode}"></td>
               <td><input type="text" name="sout" value="5"></td>
               <td><input type="text" name="ing"></td>
               <td><input type="text" id="ing1" value="1"></td>
               <td><input type="text" id="ing" value="2"></td>
            </tr>
            </table>
            <div class="buy-button">
            
            	  <c:if test="${vo.ssize!=null}">
                     <button onClick="requestPay()" type="button" name="buy" value="1" class="sbuy"  >즉시구매</button>
                  </c:if>
                  <c:if test="${vo.ssize==null}">
                     <button type="submit" name="buy" id="bid" value="2" class="sbuy1">입찰구매</button>
                  </c:if>
               <button type="reset">결제취소</button>
            </div>
         </form>
      </div>
   </div>   
</div>
<script>
   $(frm).on("submit", function(e) {
      e.preventDefault();
   });
   
//    //즉시구매눌렀을때
//    $(".sbuy").on("click", function() {
//       var bprice = $(frm.bprice).val();
//       var bid = $(frm.bid).val();
//       var bsize = $(frm.bsize).val();
//       var bmodel = $(frm.bmodel).val();
//       var baddress = $(frm.baddress).val();
//       var baddress1 = $(frm.baddress1).val();
//       var btell = $(frm.btell).val();
//       var ing1=$("#ing1").val();
//       var bout=$(frm.bout).val();
//       var scode=$(frm.scode).val();
//       var sout=$(frm.sout).val();
//       $(frm.ing).val(ing1);
      
//       alert(scode +"n"+ sout) + "n" + ing;
//       if (btell == "") {
//          alert("전화번호를 입력해주세요!");
//          $(frm.btell).focus();
//          return;
//       } else if (baddress == "") {
//          alert("주소를 입력해주세요!");
//          $(frm.baddress).focus();
//          return;
//       } else if (baddress1 == "") {
//          alert("주소를 입력해주세요!");
//          $(frm.baddress1).focus();
//          return;
//       } else {
//          if (!confirm("상품을구매하실래요?")) return;
//          frm.submit();
       
//       }
//    });
   
   $(".sbuy1").on("click", function() {
      frm.action="insert1";
      var sbuy = $("#sbuy1").val();
      var bid = $(frm.bid).val();
      var bsize1 = $("#bsize1").val();
      var bmodel = $(frm.bmodel).val();
      var baddress = $(frm.baddress).val();
      var baddress1 = $(frm.baddress1).val();
      var btell = $(frm.btell).val();
      var ing=$("#ing").val();
      $(frm.bsize).val(bsize1);
      $(frm.bprice).val(sbuy);
      $(frm.bout).val('0');
      $(frm.ing).val(ing);
      

      if (btell == "") {
         alert("전화번호를 입력해주세요!");
         $(frm.btell).focus();
         return;
      } else if (baddress == "") {
         alert("주소를 입력해주세요!");
         $(frm.baddress).focus();
         return;
      } else if (baddress1 == "") {
         alert("주소를 입력해주세요!");
         $(frm.baddress1).focus();
         return;
      } else {
         if (!confirm("상품을 입찰구매하실래요?")) return;
         frm.submit();

      }
   });

   $("#search").on("click", function() {
      new daum.Postcode({
         oncomplete : function(data) {
            console.log(data);
            $(frm.baddress).val(data.address);
         }
      }).open();
   });
      
   var uid="${uid}";
   var pmodel="${vo.pmodel}";
   var pkname="${vo.pkname}";
   var plprice="${vo.ssell}";
   var uemail="${vo.uemail}";
   var uname="${vo.uname}";
   var utel="${vo.utel}";
   var uaddress="${vo.uaddress}";
   var uaddress1="${vo.uaddress1}";
   var apay="";
   var del=1;
   var pimage="${vo.pimage}";
   
      //카카오결제API
      var IMP = window.IMP; // 생략 가능
         IMP.init("imp85774140"); // 예: imp00000000

      function requestPay() {
         // IMP.request_pay(param, callback) 결제창 호출
         IMP.request_pay({ // param
            pg : "kakaopay",
            pay_method : "card",
            merchant_uid : "likeit" + new Date().getTime(), //주문번호
            name : pkname,
            amount : plprice,
            buyer_email : uemail,
            buyer_name : uname,
            buyer_tel : utel,
            buyer_addr : uaddress + uaddress1,
         }, function(rsp) { // callback
            if (rsp.success) { //결제성공
               apay="kakao";
               $.ajax({
                     type : "post",
                     url : "/trade/pinsert",
                     data : {aid:uid, aemail:uemail, aname:uname, amodel:pmodel, akname:pkname, aprice:plprice,
                        aaddress:uaddress, aaddress1:uaddress1, atell:utel, apay:apay, del:del, aimage:pimage},
                     dataType : "json",
               });
               location.href="/productList/list";
            } else { //결제실패
               alert("실패");
            }
         });
      }
</script>