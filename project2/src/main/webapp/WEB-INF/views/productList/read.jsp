<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/resources/css/read.css">
    <link rel="stylesheet" href="/resources/css/footer.css">
    
<div id="page">
	
	<div class="container">
			<div class="update-box">
			<c:if test="${ucode== 2}">
   				<button class="update">수정/삭제</button>
   			</c:if>
   			</div>
			<div class="image">
				<c:if test="${uid==null}">
					<img src="/display?fileName=${vo.pimage}">
				</c:if>
				<c:if test="${uid!=null}">
					<img src="/display?fileName=${vo.pimage}">
				</c:if>
			</div>
			<div class="info">
				<form name="frm" method="post" action="update1">
				<div>
					<input style="display: none;"  type="text" name="pmodel" value="${vo.pmodel}">
					<input style="display: none;"  type="text" name="lpcnt" value="${vo.lpcnt}">
					<input style="display: none;"  type="text" name="plcount" value="${vo.plcount}">
					<input style="display: none;"  type="text" name="uid" value="${uid}">
					<input style="display: none;"  type="text" name="lid" value="${uid}">
					<input style="display: none;"  type="text" name="lmodel" value="${vo.pmodel}">
					<input style="display: none;"  type="text" name="lno" value="${vo.lno}">
					
			 		<c:if test='${vo.lpcnt=="0" || vo.lpcnt=="1" && uid!=null}'>
					<button type="submit" id="dib">🤍 <span style="display:none;">[${vo.plcount}]</span></button>
			 		</c:if> 
			 		<c:if test='${vo.lpcnt=="2"}'> 
					<button type="button" id="cancel">❤️<span style="display:none;"> [${vo.plcount}]</span></button> 
					</c:if> 
				</div>
				</form>
				<div style="display="inline-block;">
				<c:if test="${uid==null}">
					<h2>${vo.pbrand}</h1>
					<h5>${vo.pename}</h3>
					<h5>${vo.pkname}</h3>
				</c:if>
				<c:if test="${uid!=null}">
					<h2>${vo.pbrand}</h1>
					<h5>${vo.pename}</h3>
					<h5>${vo.pkname}</h3>
				</c:if>
				</div>
				<c:if test="${vo.pcode=='sh'}">
				<h5>
					사이즈: <select id="size">
						<option value="220">220</option>
						<option value="225">225</option>
						<option value="230">230</option>
						<option value="235">235</option>
						<option value="240">240</option>
						<option value="245">245</option>
						<option value="250">250</option>
						<option value="255">255</option>
						<option value="260">260</option>
						<option value="265">265</option>
						<option value="270">270</option>
						<option value="275">275</option>
						<option value="280">280</option>
					</select>
				</h5>
			</c:if>
			<c:if test="${vo.pcode=='cl'}">
				<h5>
					사이즈 :<select id="size">
						<option value="xs">XS</option>
						<option value="s">S</option>
						<option value="m">M</option>
						<option value="l">L</option>
						<option value="xl">XL</option>
						<option value="XXL">XXL</option>
						<option value="free">FREE</option>
					</select>
				</h5>
			</c:if>	
				<hr/>
			<div class="price">
				<div>
				<c:if test="${uid==null}">
					최근거래가<h4>${vo.plprice}</h4>
				</c:if>
				<c:if test="${uid!=null}">
					최근거래가<h4>${vo.plprice}</h4>
				</c:if>
				</div>
				<div style="margin-top:30px;">
				<button class="buy">즉시구매</button>
				<button class="buy1">입찰구매</button>
				<button class="sell">즉시판매</button>
				<button class="sell1">입찰판매</button>
				</div>
			<div class="info1">
				<h1>상품정보</h1>
				<h4>모델명</h4>
				<h3 class="pmodel">
				<c:if test="${uid==null}">
					${vo.pmodel}
				</c:if>
				<c:if test="${uid!=null}">
					${vo.pmodel}
				</c:if>
				</h3>
			</div>
			<div class="info-delivery">
			<img src="/resources/img/택배.png">
			<h1>배송정보</h3>
				<h5>일반배송 무료 검수 후 배송</h5>
				<h5> ・5-7일 내 도착 예정</h5>
			</div>
		</div>
	</div>
	<div class="inspection">
			<div class="detail">
				<img src="/resources/img/인증.png">
				<h4>100% 정품 보증</h4>
				<h5>KREAM에서 검수한 상품이 정품이 아닐 경우, 구매가의 3배를 보상합니다.</h5>
			</div>
			<div class="detail">
				<img src="/resources/img/검수.png">
				<h4>엄격한 다중 검수</h4>
				<h5>모든 상품은 검수센터에 도착한 후, 상품별 전문가 그룹의 체계적인 시스템을 거쳐 검수를 진행합니다.</h5>
			</div>
			<div class="detail">
				<img src="/resources/img/보상.png">
				<h4>정품 인증 패키지</h4>
				<h5>검수에 합격한 경우에 한하여 KREAM의 정품 인증 패키지가 포함된 상품이 배송됩니다.</h5>
			</div>
		</div>
		
			<div id="chart"></div>
		
</div>
<script>
	var ssize=""
	var uid="${uid}";
	var plcount="${vo.plcount}";
	var lpcnt="${vo.lpcnt}";
	var pmodel="${vo.pmodel}";
	var smodel="${vo.pmodel}"
	
	//찜
	$(frm).on("submit", function(e){
		e.preventDefault();
		
		if(uid!=null){
			plcount;
			lpcnt;
			var lmodel=$(frm.pmodel).val();
			var lid=$(frm.uid).val();
		}

		if(!confirm("찜하시겠습니까?")) return;
		
		 if(lpcnt=="0"){
			 lpcnt="2";
			 $(frm.lpcnt).val(lpcnt);
			 plcount=plcount+1;
			 $(frm.plcount).val(plcount);
			 $(frm.lmodel).val(lmodel);
			 $(frm.lid).val(lid);
			 alert("찜완료")
			 frm.method="post";
			 frm.action="insert1";
			 frm.submit();
		 }
		 
		 else if(lpcnt=="1"){
			 lpcnt="2";
			 $(frm.lpcnt).val(lpcnt);
			 plcount=plcount+1;
			 $(frm.plcount).val(plcount);
			 $(frm.lmodel).val(lmodel);
			 $(frm.lid).val(lid);
			 lno=$(frm.lno).val();
			 alert("찜완료")
			 frm.method="post";
			 frm.action="update1";
			 frm.submit();
			// location.href="/productList/read?pmodel=" + pmodel +"&uid=" + uid + "&lpcnt=" + lpcnt
		 }
	})
			 
	//찜 취소
	$(frm).on("click","#cancel",function(e){
		e.preventDefault();
		plcount;
		lpcnt;
		var lmodel=$(frm.pmodel).val();
		var lid=$(frm.uid).val();
		if(!confirm("찜취소 하시겠습니까?")) return;
		
		if(lpcnt=="2"){
			lpcnt="1";
			$(frm.lpcnt).val(lpcnt);
			plcount=plcount-1;
			$(frm.plcount).val(plcount);
			lno=$(frm.lno).val();
			
			alert("찜취소")
			frm.method="post";
			frm.action="update2";
			frm.submit();
		//	location.href="/productList/read?pmodel=" + pmodel+"&uid=" + uid + "&lpcnt=" + lpcnt
		}
	})	 
			 
	$(".buy1").on("click", function(){
		ssize = $('#size option:selected').val();
	});
	
	$(".buy").on("click", function(){
		ssize = $('#size option:selected').val();
	});
	
	$(".sell").on("click", function(){
		ssize = $('#size option:selected').val();
	});
	
	$(".sell1").on("click", function(){
		ssize = $('#size option:selected').val();
	});
	
	$("#page").on("click",".like",function(){
		
	})
	
	$("#page").on("click",".update",function(){
		var pmodel=$(".pmodel").html();
		location.href="update?pmodel="+pmodel;
	})

	//즉시구매버튼
	$("#page").on("click",".buy",function(){
		location.href="/trade/read?pmodel=${vo.pmodel}&ssize=" + ssize + "&uid=" + uid;
	})
	
	//입찰구매버튼
	$("#page").on("click",".buy1",function(){
		location.href="/trade/read1?pmodel=${vo.pmodel}&ssize=" + ssize;
	})
	//즉시판매버튼
	$("#page").on("click",".sell",function(){
		location.href="/trade/sinsert?pmodel=${vo.pmodel}&bsize=" + ssize;
	})
	
	//입찰판매버튼
	$("#page").on("click",".sell1",function(){
		location.href="/trade/sinsert1?pmodel=${vo.pmodel}&bsize=" + ssize;
	})
	
	//상품수정
   $("#page").on("click",".update",function(){
      var pmodel=$(".pmodel").html();
      location.href="update?pmodel="+pmodel;
   })
   
   //판매차트
   $.ajax({
		type:"get",
		url:"/productList/read.json",
		data: {smodel:smodel},
		success:function(data){
			var title="최근판매현황";
			lineChart(title, data);
		}
	});
	
	//구매차트
	   $.ajax({
			type:"get",
			url:"/productList/read1.json",
			data: {bmodel:smodel},
			success:function(data){
				var title="최근구매현황";
				lineChart1(title, data);
			}
		});
</script>