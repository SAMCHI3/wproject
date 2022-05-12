<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/resources/css/mypage.css" rel="stylesheet" >
<link href="/resources/css/account.css" rel="stylesheet" >
<title>Insert title here</title>
</head>
<body>
	 <div class="container">
        <h2><a href="/user/mypage?uid=${vo.uid}">마이페이지</a></h2>
				 <h1>판매정산계좌</h1>
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
                <h4>내 정보</h4>
                <li><a href="/user/profile">프로필 정보</a></li>
            	<li><a href="/user/addressbook">주소록</a></li>
                <li><a href="/user/account?" style="color:black;"><strong>판매 정산 계좌</strong></a></li>
            </ul>
        </div>
        <div class="my-account">
            <p><strong>은행명</strong></p>
            <select class="aselect">
                <option>기업은행</option>
                <option>국민은행</option>
                <option>신한은행</option>
                <option>우리은행</option>
                <option>대구은행</option>
                <option>하나은행</option>
                <option>농협은행</option>
                <option>제주은행</option>
                <option>카카오뱅크</option>
            </select>
            <p><strong>계좌 번호</strong></p>
            <input type="text" name="acconut-name">
            <p><strong>예금주</strong></p>
            <input type="text" name="my-name">
            <div class="account-submit">
                <button type="submit">저장하기</button>
            </div>
        </div>
    </div>
</body>
</html>