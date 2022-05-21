<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/resources/css/mypage.css" rel="stylesheet" >
<div id="page">
<div class="container">
	<h2><a href="/user/mypage?uid=${vo.uid}">마이페이지</a></h2>
	<h1>구매 정보</h1>
	<div  class="my-list">
		<ul class="my-list1">
		<h4>쇼핑 정보</h4>
			<li><a href="/user/update?uid=${vo.uid}">회원정보수정</a></li>
			<li><a href="/user/smypage?uid=${vo.uid}">판매정보</a></li>
			<li><a href="/user/bmypage?uid=${vo.uid}" style="color:black;"><strong>구매정보</strong></a></li>
			<li><a href="/user/lmypage?uid=${vo.uid}">관심상품</a></li>
		</ul>
		<br>
            <ul class="my-list2">
                <h4>내 정보</h4>
                <li><a href="/user/profile">프로필 정보</a></li>
            	<li><a href="/user/addressbook">주소록</a></li>
                <li><a href="/user/accont">판매 정산 계좌</a></li>
            </ul>
	</div>
	<div class="trade">
		
	<div>
		<div class="buy">
		<div class="purchase-ui">
               <div class="purchase-top">
                   <a href="#">
                       <dl>
                           <dt style="color:red;">${vo1 + vo2}</dt>
                           <dd>총구매현황</dd>
                       </dl>
                       <dl>
                           <dt>${vo1}</dt>
                           <dd>입찰구매</dd>
                       </dl>
                       <dl>
                           <dt>${vo2}</dt>
                           <dd>구매완료</dd>
                       </dl>
                   </a>
               </div>
           </div>	
           <div>
                <select>
                    <option>전체</option>
                    <option>최근 정렬 순</option>
                    <option>높은 가격 순</option>
                </select>
            </div>
            <hr>
                <div id="tbl"></div>
		</div>
		<script id="temp" type="text/x-handlebars-template">
		{{#each blist1}}
			<div class="trade1">
				<div style="display: inline-flex;">
					<image src="/display?fileName={{pimage}}" width=150 height=150>
				</div>
				<div class="tr">
					<div class="tr2">구매자:{{bid}}</div>
					<div class="tr2">판매모델:{{pmodel}}</div>
					<div class="tr2">구매금액:{{asdf bprice}}원</div>
					<div class="tr2">구매일:{{bdate}}</div>
				</div>
					<div class="tr2 tr3">{{dis ing}} {{dis1 bout}}</div>
			</div>
		{{/each}}
		</script>
		<Script>
		// 금액 자리수나누기
	      Handlebars.registerHelper("asdf", function(bprice){
	         return bprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	      });
		
		Handlebars.registerHelper("dis", function(ing){
	        if(ing==1) return "즉시구매";
	        else return "입찰구매";
	      });
		
		Handlebars.registerHelper("dis1", function(bout){
	        if(bout==0) return "구매중";
	        else return "구매완료";
	      });
	</Script>
	</div>
</div>
</div>
<script>
	var page="1";
	var uid="${vo.uid}";

	getBlist();
	
	function getBlist(){
		$.ajax({
			type:"get",
			dataType:"json",
			url:"/mypage/blist1.json",
			data:{bid:uid},
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
			}
		});
	}
</script>



