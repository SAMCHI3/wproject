<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<html>
	<head>
		<link href="/resources/css/update.css" rel="stylesheet" > 
		<link href="/resources/css/userinsert.css" rel="stylesheet" > 
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원가입</title>
	</head>
	<body>
	<div id="page" class="container">
		<h1>회원가입</h1>
			<form name="frm" method="post">
				<div class="form-group has-feedback unit">
					<label for="uname"><h6>성명</h6></label>
					<input class="form-control" type="text" id="uname" name="uname" />
				</div>
				<div class="unit">
					<label for="uid"><h6>아이디<span>(필수)</span></h6></label>
					<button type="button" id="check">중복체크</button>
					<input class="form-control" type="text" name="uid" style="margin-top:10px;">
				</div>
				<div class="form-group has-feedback unit">
					<label for="upass"><h6>패스워드<span>(필수)</span></h6></label>
					<input class="form-control" type="password" id="upass" name="upass" />
				</div>
				<div class="form-group has-feedback unit">
					<h6>생년월일</h6>
					<select name="udate">
					<option value="" selected="selected">연도선택</option>
				       <%for(int i=1950; i<=2022; i++){ %>				       
				       <option value="<%=i %>"><%=i %></option>
				       <%} %>
				     </select>년&nbsp;
				     <select name="udate2">
				     <option value="" selected="selected">월선택</option>
				       <%for(int i=1; i<=12; i++){ %>
				       <option value="<%=i %>"><%=i %></option>
				       <%} %>
				     </select>월
				     <select name="udate3">
				     <option value="" selected="selected">일선택</option>
				       <%for(int i=1; i<=31; i++){ %>
				       <option value="<%=i %>"><%=i %></option>
				       <%} %>
				     </select>일
				</div>
				<div class="form-group has-feedback unit">	
			           <h6>성별선택</h6>
	              	 		<select name="ugender">
	                  			<option value="" selected="selected">성별선택</option>
			              	 		<option value="1">남자</option> 
									<option value="2">여자</option> 
					 		</select>					
				</div>
				<div class="form-group has-feedback unit">
					<label for="uemail"><h6>이메일<span>(필수)</span></h6></label>
					<button type="button" id="check2">이메일중복체크</button>
					<input class="form-control" type="email" id="uemail" name="uemail" style="margin-top: 10px;"/>
				</div>
				<div class="form-group has-feedback unit">
					<label for="utel"><h6>전화번호<span>(필수)</span></h6></label>
					<input class="form-control" type="text" id="utel" name="utel" placeholder="ex)010-1111-1111"/>
				</div>
				<div class="form-group has-feedback unit">
					<label for="uaddress"><h6>주소<span>(필수)</span></h6></label>
					<button type="button" id="search">주소검색</button><br>
					<input class="form-control" type="text" id="uaddress" name="uaddress" style="margin-top:10px;"/>
				</div>
			
				<div class="form-group has-feedback unit">
					<label for="uaddress1"><h6>상세주소</h6></label>
					<input class="form-control" type="text" id="uaddress1" name="uaddress1" />
				</div>
				<div class="insert-button">
					<button type="submit">회원가입</button>
					<button type="button">취소</button>
				</div>
			</form>
		</div>
	</body>
	
</html>
<script>
$("#search").on("click", function(){
	new daum.Postcode({
		oncomplete: function(data){
			console.log(data);
			$(frm.uaddress).val(data.address);
		}
	}).open();	
});
var check=false;
$("#check").on("click", function(){
	var uid=$(frm.uid).val();
	if(uid==""){
		alert("아이디를 입력하세요!");
		$(frm.uid).focus();
		return;
	}
	
	$.ajax({
		type: "post",
		url: "/user/inserttest",
		data: {uid:uid},
		success: function(data){
			if(data==0){
				alert("사용할수 있는 아이디입니다!");
				check=true;
			}else if(data==1){
				alert("이미 사용중인 아이디입니다!");
			}else if(data==2){
				alert("이미 사용중인 아이디입니다!");
			}else{
				alert("이미 사용중인 아이디입니다!");
			}
		}
	});
});

//이메일중복체크
$("#check2").on("click", function(){
	var uemail=$(frm.uemail).val();
	if(uemail==""){
		alert("이메일을 입력하세요!");
		$(frm.uemail).focus();
		return;
	}
	
	$.ajax({
		type: "post",
		url: "/user/inserttest2",
		data: {uemail:uemail},
		success: function(data){
			if(data==0){
				alert("사용할수 있는 이메일입니다!");
				check=true;
			}else if(data==1){
				alert("이미 사용중인 이메일입니다!");
			}else if(data==2){
				alert("이미 사용중인 이메일입니다!");
			}else{
				alert("이미 사용중인 이메일입니다!");
			}
		}
	});
});

$(frm.uid).on("change", function(){
	check=false;	
});


$(frm).on("submit",function(e){
	e.preventDefault();
	var uname=$(frm.uname).val();
	var uid=$(frm.uid).val();
	var upass=$(frm.upass).val();
	var udate=$(frm.udate).val();
	var udate2=$(frm.udate2).val();
	var udate3=$(frm.udate3).val();
	var ugender=$(frm.ugender).val();
	var uemail=$(frm.uemail).val();
	var utel=$(frm.utel).val();
	var uaddress=$(frm.uaddress).val();
	var uaddress1=$(frm.uaddress1).val();
	
// 	alert(uname+"\n"+uid+"\n"+upass+"\n"+udate+"\n"+udate2+"\n"+udate3+"\n"+ugender+"\n"+uemail+"\n"+utel+"\n"+uaddress+"\n"+uaddress1+"\n")
	
	if(uname==""){
         alert("이름을 입력하세요");
         $(frm.uname).focus();
         return;
      }else if(uid==""){
         alert("아이디를 입력하세요");
         $(frm.uid).focus();
         return;
		}else if(!check){
			alert("아이디 중복 체크를 하세요!");
			return;
		}else if(upass==""){
         alert("비밀번호를 입력하세요");
         $(frm.upass).focus();
         return;
      }else if(udate==""){
	         alert("생년월일의 연도를 선택하세요");
	         return;
      }else if(udate2==""){
	         alert("생년월일의 월을 선택하세요");
	         return;
      }else if(udate3==""){
	         alert("생년월일의 일을 선택하세요");
	         return;
      }else if(ugender==""){
    	  alert('성별을 선택하세요.');
    	return;
      }else if(uemail==""){
         alert("이메일을 입력하세요");
         $(frm.uemail).focus();
         return;
      }else if(utel==""){
         alert("전화번호를 입력하세요");
         $(frm.utel).focus();
         return;
      }else if(uaddress==""){
         alert("주소를 입력하세요");
         $(frm.uaddress).focus();
         return;
      }else if(uaddress==""){
          alert("상세주소를 입력하세요");
          $(frm.uaddress).focus();
          return;
      }
      if(!confirm("회원가입하시겠습니까?")) return;
     	frm.submit();		
	});
</script>

