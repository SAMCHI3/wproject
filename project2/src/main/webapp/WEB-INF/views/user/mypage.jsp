<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link href="/resources/css/mypage.css" rel="stylesheet" >
<div id="page">
	<div class="container">
				<h2><a href="/user/mypage?uid=${vo.uid}">마이페이지</a></h2>
				 <h1>프로필 정보</h1>
				<div  class="my-list">
					<ul  class="my-list1">
					<h4>쇼핑 정보</h4>
						<li><a href="/user/update?uid=${vo.uid}">회원정보수정</a></li>
						<li><a href="/user/smypage?uid=${vo.uid}">판매정보</a></li>
						<li><a href="/user/bmypage?uid=${vo.uid}">구매정보</a></li>
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
					<div class="d-flex p-3 my-profile">
						<div class="flex-shrink-0">
							<img src="/display?fileName=${vo.uimage}" style="width: 150px; height: 150px; border-radius: 12px;">
						</div>
						<div class="flex-grow-1 ms-3 mt-1">
							<h4 class="fw-bold mb-0">${vo.uid}</h4>
							<div class="tr1">${vo.uemail}</div>
							<div class="tr1">${vo.utel}</div>
							<div class="profile-link">
                    			<a href="/user/update?uid=${vo.uid}">프로필 수정</a>
                			</div>
						</div>
					</div>
				<div class="buy">
					<div class="purchase-ui">
		                <div class="purchase-top">
		                    <a href="#">
		                        <dl>
		                            <dt style="color:red;">0</dt>
		                            <dd>판매 입찰</dd>
		                        </dl>
		                        <dl>
		                            <dt>0</dt>
		                            <dd>진행중</dd>
		                        </dl>
		                        <dl>
		                            <dt>0</dt>
		                            <dd>종료</dd>
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
		            <div>
						<div id="tbl"></div>
						</div>
					</div>
					<script id="temp" type="text/x-handlebars-template">
				{{#each slist}}
					<div class="trade1">
						<div style="display: inline-flex; position: relative; bottom: 25px;">
							<image src="/display?fileName={{pimage}}" width=150 height=150>
						</div>
						<div class="tr">
							<div class="tr2">판매자:{{sid}}</div>
							<div class="tr2">판매모델:{{pmodel}}</div>
							<div class="tr2">판매금액:<strong>{{asdf ssell}}원</strong></div>
							<div class="tr2">판매일:{{sdate}}</div>
							
						</div>
						<div class="tr2 tr3">{{dis3 ing}} {{dis2 sout}}</div>
					</div>
				{{/each}}
				</script>
				<script>
				// 금액 자리수나누기
			      Handlebars.registerHelper("asdf", function(ssell){
			         return ssell.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
			      });
				</script>
						<div class="sale">
						<div class="purchase-ui">
		                <div class="purchase-top">
		                    <a href="#">
		                        <dl>
		                            <dt style="color:red;">0</dt>
		                            <dd>구매 입찰</dd>
		                        </dl>
		                        <dl>
		                            <dt>0</dt>
		                            <dd>진행중</dd>
		                        </dl>
		                        <dl>
		                            <dt>0</dt>
		                            <dd>종료</dd>
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
							<div id="tbl1"></div>
							</div>
								<script id="temp1" type="text/x-handlebars-template">
									{{#each blist}}
										<div class="trade1">
											<div style="display: inline-flex;">
											<image src="/display?fileName={{pimage}}" width=150 height=150>
										</div>
										<div class="tr">
										<div class="tr2">구매자:{{bid}}</div>
										<div class="tr2">구매모델:{{pmodel}}</div>
										<div class="tr2">입찰구매금액:<strong>{{asdf bprice}}원</strong></div>
										<div class="tr2">입찰구매일:{{bdate}}</div>
											
										</div>
											<div class="tr2 tr3">{{dis ing}} {{dis1 bout}}</div>
										</div>
									{{/each}}
								</script>
								<script>
								 // 금액 자리수나누기
							      Handlebars.registerHelper("asdf", function(bprice){
							         return bprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
								</script>
							</div>
						</div>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
        <Script>
        
		Handlebars.registerHelper("dis3", function(ing){
	        if(ing==3) return "즉시판매";
	        else return "입찰판매";
	      });
		
		Handlebars.registerHelper("dis2", function(sout){
	        if(sout==0) return "판매중";
	        else return "판매완료";
	      });
	</Script>
        <Script>
		Handlebars.registerHelper("dis", function(ing){
	        if(ing==1) return "즉시구매";
	        else return "입찰구매";
	      });
		
		Handlebars.registerHelper("dis1", function(bout){
	        if(bout==0) return "구매중";
	        else return "구매완료";
	      });
	</Script>
<script>
	var page="1";
	var uid="${vo.uid}";
	getSlist();
	getBlist();
	function getSlist(){
		$.ajax({
			type:"get",
			dataType:"json",
			url:"/mypage/slist.json",
			data:{sid:uid},
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#tbl").html(template(data));
			}
		});
	}
	
	function getBlist(){
		$.ajax({
			type:"get",
			dataType:"json",
			url:"/mypage/blist.json",
			data:{bid:uid},
			success:function(data){
				var template = Handlebars.compile($("#temp1").html());
				$("#tbl1").html(template(data));
			}
		});
	}
</script>



