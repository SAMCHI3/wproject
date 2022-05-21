<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="/resources/css/mypage.css" rel="stylesheet" >
<link href="/resources/css/update.css" rel="stylesheet" >  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
		<div id="page" class="container">
				 <h2><a href="/user/mypage?uid=${vo.uid}">마이페이지</a></h2>
				 <h1>프로필 정보</h1>
				<div  class="my-list">
					<ul  class="my-list1">
					<h4>쇼핑 정보</h4>
						<li><a href="/user/update?uid=${vo.uid}" style="color:black;"><strong>회원정보수정</strong></a></li>
						<li><a href="/user/smypage?uid=${vo.uid}">판매정보</a></li>
						<li><a href="/user/bmypage?uid=${vo.uid}">구매정보</a></li>
						<li><a href="/user/lmypage?uid=${vo.uid}">관심상품</a></li>
					</ul>
					<br>
		            <ul class="my-list2">
		                <h4>내 정보</h4>
		                <li><a href="profile.html">프로필 정보</a></li>
		            <li><a href=" addressbook.html">주소록</a></li>
		                <li><a href="account.html">판매 정산 계좌</a></li>
		            </ul>
				</div>
		<div class="d-flex p-3 my-profile profile-update">
					<div class="flex-shrink-0">
						<c:if test="${vo.uimage == null}">
								<img src="/resources/img/기본이미지.jpg" onerror="this.src='/resources/img/유저.png'" style="width: 150px; height: 150px; border-radius: 12px;"/>
						</c:if>
						<c:if test="${vo.uimage != null}">
								<img src="/display?fileName=${vo.uimage}" style="width: 150px; height: 150px; border-radius: 12px;">
						</c:if>
					</div>
						<div class="flex-grow-1 ms-3 mt-1">
							<h4 class="fw-bold mb-0">${vo.uid}</h4>
							<div class="tr1">${vo.uemail}</div>
							<div class="tr1">${vo.utel}</div>
						</div>
					</div>
	
	<form name="frm"   enctype="multipart/form-data">
		<table>
			<div class="unit">
				<h6>아이디</h6>
					<input type="text" name="uid" value="${vo.uid}" readonly>
			</div>
			<div class="unit">
				<h6>비밀번호</h6>
				<input type="password" name="upass" >
			</div>
			<div class="unit">
				<h6>이름<h6>
				<input type="text" name="uname" value="${vo.uname}">
			</div>
			<div class="unit">
				<h6>전화번호</h6>
				<input type="text" name="utel" value="${vo.utel}">
			</div>
			<div class="unit">
				<h6>이메일</h6>
				<input type="text" name="uemail" value="${vo.uemail}">
			</div>
			
			<div class="unit">
				<h6>결제방법</h6>
				<input type="text" name="upay" value="${vo.upay}">
			</div>
			<div class="unit">
				<h6>주소</h6>
					<input type="text" name="uaddress" size=30 value="${vo.uaddress}" style="width:400px; float:left;">
					<button type="button" id="search">주소검색</button>
			</div>
			<div class="unit">
				<h6>상세주소</h6>
				<input type="text" name="uaddress1" value="${vo.uaddress1}" style="width:500px;">
			</div>
			<div class="unit">
				<h6>사진 변경</h6>
					<input type="file" name="file" style="display:none;">
					<img src="/resources/img/기본이미지.jpg" style="width: 150px; height: 150px; border-radius: 12px;" id="image">
					<input type="hidden" name="uimage" value="${vo.uimage}">
			</div>
		</table>
		<div class="update-button">
			<button type="submit" class="update">정보수정</button>
			<button type="reset">수정취소</button>
			<div class="ubutton"><a href="/delete?uid=${uid}">유저탈퇴</a></div>
		</div>
	</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous">
</script>

<script>
	$("#search").on("click", function(){
		new daum.Postcode({
			oncomplete: function(data){
				console.log(data);
				$(frm.uaddress).val(data.address);
			}
		}).open();	
	});
	
	$(frm).on("submit", function(e){
		e.preventDefault();
		
		var upass=$(frm.upass).val();
		var uname=$(frm.uname).val();
		var utel=$(frm.utel).val();
		var uemail=$(frm.uemail).val();
		var upay=$(frm.upay).val();
		var uaddress=$(frm.uaddress).val();
		var uaddress1=$(frm.uaddress1).val();
		var file=$(frm.file).val();

		
		if(upass==""){
			alert("비밀번호를 입력하세요!");
			$(frm.upass).focus();
			return;
		}else if(uname=="") {
			alert("이름을 입력하세요!");
			$(frm.uname).focus();
			return;
		}else{
			if(!confirm("회원정보를 수정 하실래요?")) return;
			frm.method="post";
			frm.action="update";
			frm.submit();
		}
	});
	
	$(frm.file).on("change", function(e){
		var file=$(frm.file)[0].files[0];
		$("#image").attr("src", URL.createObjectURL(file));
	});
	
	$("#image").on("click", function(){
		$(frm.file).click();
	})
</script>