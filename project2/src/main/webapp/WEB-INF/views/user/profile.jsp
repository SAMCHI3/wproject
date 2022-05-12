<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/resources/css/mypage.css" rel="stylesheet" >
<link href="/resources/css/profile.css" rel="stylesheet" >
<title>Insert title here</title>
</head>
<body>
<div class="container">
        <h2><a href="mypage.html">마이페이지</a></h2>
        <h2 style="padding-left: 48%">프로필 정보</h2>
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
                <li><a href="/user/profile" style="color:black;"><strong>프로필 정보</strong></a></li>
            	<li><a href="/user/addressbook">주소록</a></li>
                <li><a href="/user/account">판매 정산 계좌</a></li>
            </ul>
        </div>
        <div class="d-flex p-3 my-profile">
            <div class="flex-shrink-0">
                <img src="img/3강.png" width="120px">
            </div>
            <div class="flex-grow-1 ms-3 mt-1">
                <h4 class="fw-bold mb-0">Kelly Rowan </h4>
                <div class="filebox">
                    <label for="file">업로드</label>
                    <input type="file" id="file">
                    <input class="upload-name" value="파일선택">
                </div>
                <br>
                <hr>
                <div>
                    <h4>로그인 정보</h4>
                    <div class="unit">
                        <h6>이메일 주소</h6>
                        <input type="text" value="KREAM@naver.com" readonly>
                        <button>변경</button>
                    </div>
                    <div class="unit">
                        <h6>비밀번호</h6>
                        <input type="password" value="00000000" readonly>
                        <button>변경</button>
                    </div>
                    <h4 style="margin: 30px 0px 30px 0px">개인 정보</h4>
                    <div class="unit">
                        <h6>아이디</h6>
                        <input type="text" value="tlvmfh3" readonly>
                        <button>변경</button>
                    </div>
                    <div class="unit">
                        <h6>휴대폰 번호</h6>
                        <input type="text" value="010-0000-0000" readonly>
                        <button>변경</button>
                    </div>
                    <div class="unit">
                        <h6>신발 사이즈</h6>
                        <input type="text" value="270" readonly>
                        <button>변경</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
<script>
    $(document).ready(function () {
        var fileTarget = $('#file');
        fileTarget.on('change', function () { // 값이 변경되면
            var cur = $(".filebox input[type='file']").val();
            $(".upload-name").val(cur);
        });
    }); 
</script>