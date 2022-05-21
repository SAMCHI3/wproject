<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <head>
    <!-- CSS only -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
		<link rel="stylesheet" href="/resources/css/boardinsert.css">
		<link rel="stylesheet" href="/resources/css/header.css">
		<link rel="stylesheet" href="/resources/css/footer.css">
		<title>게시글수정</title>
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
<div id="page" style="height:1400px;">
<div class="container">
   <h1>게시글수정</h1>
      <form class="form-insert" name="frm" enctype="multipart/form-data">
       <table style="display:inline-block;">
      	<tr>
      	<td width="100" class="titile">번호</td>
      		<td><input class="form-control" type="text" name="bno" value="${vo.bno}" readonly="readonly"></td>
      	</tr>
         <tr>
         <td width="100" class="title">작성자</td>
         	<td><input class="form-control" type="text" name="bid" value="<c:out value='${uid}'/>"readonly="readonly"></td>
         </tr>
         <tr>
            <td width="100" class="title">이미지</td>
            <td width="500">
               <input type="file" name="file" style="display: none;">
               <img src="/display?fileName=${vo.bimage}"  id="image"  width="500" >
              	<input type="hidden" name="bimage" value="${vo.bimage}">
            </td>
         </tr>
         <tr>
            <td width="100" class="title">내용</td>
           <td><input type="text" id="bcontent" name="bcontent" style="width: 500px; height: 100px;" value="${vo.bcontent}"></input></td>
         </tr>
        
      </table>
      <div class="insert-button1" style="text-align: center; padding: 20px;">
         <button type="submit" class="update">완료</button>
        <button type="reset">취소</button>
      </div>
   </form>
   </div>
</div>
<div class="container-fluid footer">
	            <div class="footer-logo">
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>


	$(frm).on("submit",function(e){
	 	e.preventDefault();
		var file=$(frm.file).val();
	 	var bcontent=$(frm.bcontent).val();
	 	var bid=$(frm.bid).val();
		
	 	 if(bcontent==""){
	         alert("내용을 입력하세요");
	         $(frm.bcontent).focus();
	       return;
	 		}
	 	if(!confirm("수정하시겠습니까?")) return;
		frm.method="post";
		frm.action="update";
	  	frm.submit();
	 });
	//이미지미리보기
	$("#image").on("click",function(){
	   $(frm.file).click();
	})
	
	$(frm.file).on("change",function(e){
	   var file=$(frm.file)[0].files[0]
	   $("#image").attr("src",URL.createObjectURL(file))
	})
</script>