<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link href="/resources/css/mypage.css" rel="stylesheet">
<div id="page">
	<div class="container">
	<h2><a href="/user/mypage?uid=${vo.uid}">마이페이지</a></h2>
		<div  class="my-list">
			<ul  class="my-list1">
			<h4>쇼핑 정보</h4>
				<li><a href="/user/update?uid=${vo.uid}">회원정보수정</a></li>
				<li><a href="/user/smypage?uid=${vo.uid}">판매정보</a></li>
				<li><a href="/user/bmypage?uid=${vo.uid}">구매정보</a></li>
				<li><a href="/user/lmypage?uid=${vo.uid}" style="color:black;"><strong>관심상품</strong></a></li>
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
		
	<div style="position: relative; left: 15rem; bottom: 20rem;">
		<h2>관심상품</h2>
		<hr style="border: 3px solid black; border-radius: 10px;">
		<div id="tbl"></div>
		<script id="temp" type="text/x-handlebars-template">
		{{#each llist}}
			<div class="trade1">
				<div style="display: inline-flex;">
					<image src="/display?fileName={{pimage}}" width=150 height=150 class="read"
					onClick=getRead()>
				</div>
				<div class="tr">
					<div class="tr2 lpcnt" style="display:none">{{lpcnt}}</div>
					관심모델:<div class="tr2 pmodel">{{pmodel}}</div>
					<div class="tr2">상품명:{{pename}}</div>
					<div class="tr2">최근거래금액:{{plprice}}</div>
				</div>
			</div>
		{{/each}}
		</script>
		<div class="pagination"></div>
		</div>
	</div>
</div>
<script>
	var page="1";
	var uid="${vo.uid}";
	getllist();

	function getllist(){
		$.ajax({
			type:"get",
			dataType:"json",
			url:"/mypage/llist.json",
			data:{lid:uid},
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
			}
		});
	}
	
	function getRead(){
		$("#tbl").on("click",".read",function(e){
		      e.preventDefault();
		      var pmodel=$(this).parent().parent().find(".pmodel").html();
		      var lpcnt=$(this).parent().parent().find(".lpcnt").html();
		      location.href="/productList/read?pmodel="+pmodel+"&uid="+uid+"&lpcnt="+lpcnt;
		   })
	}
	
</script>



