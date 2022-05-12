<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/resources/css/mypage.css" rel="stylesheet" >
<link href="/resources/css/addressbook.css" rel="stylesheet" >
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h2><a href="/user/mypage?uid=${vo.uid}">마이페이지</a></h2>
				 <h1>주소록</h1>
		<div class="my-list">
			<ul class="my-list1">
				<h4>쇼핑 정보</h4>
				<li><a href="/user/update?uid=${vo.uid}">회원정보수정</a></li>
				<li><a href="/user/smypage?uid=${vo.uid}">판매정보</a></li>
				<li><a href="/user/bmypage?uid=${vo.uid}">구매정보</a></li>
				<li><a href="/user/lmypage?uid=${vo.uid}">관심상품</a></li>
			</ul>
			<br>
			<ul class="my-list2">
				<li><a href="/user/profile">프로필 정보</a></li>
            	<li><a href="/user/addressbook" style="color:black;"><strong>주소록</strong></a></li>
                <li><a href="/user/account">판매 정산 계좌</a></li>
			</ul>
		</div>
		<div class="my-address">
			<p>입력된 주소가 없습니다</p>
			<button><a href="#">+ 주소 추가하기</a></button>
		</div>
	</div>
</body>
</html>