<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
div {
  box-sizing : border-box;
}
body {
  margin : 0;
}
</style>
<html>
<head>
	<title>shopping</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script src="/resources/pagination.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript" src="/resources/chart.js"></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	<link href="/resources/css/header.css" rel="stylesheet" >
	<link href="/resources/css/footer.css" rel="stylesheet" >
</head>
<header>
	<div id="inner">
		<h1><a href="/"><img src="/resources/img/it.png" style="width:150px;"></a></h1>
			<ul class="menu">
				<li><a href="/board/list">게시글</a></li>
				<li><a href="/productList/list">SHOP</a></li>
			</ul>
			<hr/>
			<ul class="login">
				<li>
					<c:if test="${uid!=null}">
						<span>
							<a href="/user/mypage?uid=${uid}">마이페이지</a>
						</span>
					</c:if>
				</li>
				<li>
					<c:if test="${ucode== 2}">
						<span>
							<a href="/user/list">유저관리</a>
						</span>
					</c:if>
				</li>		
				<li><c:if test="${uid==null}">
					<span>
						<a href="/user/login">로그인</a>
					</span>
				</c:if>
				</li>
				<li>
				<c:if test="${uid!=null}">
					<span>
						<a href="/user/logout">로그아웃</a>
					</span>
				</c:if>	
				</li>
				<li><a href="/notice/home?ucode=${ucode}">공지사항</a></li>
			</ul>
	</div>
</header>
<body>
	<div id="page">
		<div id="content">
			<jsp:include page="${pageName}"/>
		</div>
		
	</div>
</body>
<div class="container-fluid footer">
	            <div class="footer-logo"">
	           		 <ul class="upper">
	                	<li><h5>이용약관</h5></li>
	                	<li><h5>채용</h5></li>
	                	<li><h5>소셜미디어</h5></li>
	                	<li><h5>회사소개</h5></li>
	                 </ul>
	                <h1><strong>LIKE IT.</strong></h1>
	                <hr />
	                <br>
	                <div class="Service-center">
			                <h1>고객센터</h1>
			                <h2>1588-0000</h2>
			                <p>평일 09:00 ~ 18:00<br>
			                   	 점심시간 13:00 ~ 14:00
			                </p>
	            		</div>
	                <h3>회사소개</h3><br>
	                <div class="h5">
		                <h5>00주식회사 대표 000</h5>
		                <h5> 사업자등록번호: 000-00-00000</h5>
		                <h5>사업장소재지 인천광역시 미추홀구 학익동000-00,4층</h5>
	                </div>
	                <h2 class="footer-copy">2022 인천일보아카데미@copyright all right reserved</h2>
	            </div>
	        </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
<script>
	$("#chat").on("click", function(e){
		e.preventDefault();
		window.open("/chat", "chat", "width=500, height=700, top=200, left=900");
	});
</script>
</html>
