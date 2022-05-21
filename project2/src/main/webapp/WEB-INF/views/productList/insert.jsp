<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/resources/css/productlistinsert.css">
<div id="page">
	<div class="container">
	<h1>상품등록</h1>
		<form name="frm" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td width="100" class="title">모델명</td>
				<td width="500"><input type="text" name="pmodel" size="10" class="input"></td>
			</tr>
			<tr>
				<td width="100" class="title">상품이미지</td>
				<td width="500">
					<img id="image" src="https://via.placeholder.com/300x200" width="300" accept="image/*">
					<input type="file" name="file" style="display: none">
				</td>
			</tr>
			<tr>
				<td width="100" class="title">상품브랜드</td>
				<td width="500"><input type="text" name="pbrand" size="50" class="input"></td>
			</tr>
			<tr>
				<td width="100" class="title">상품명(E)</td>
				<td width="500"><input type="text" name="pename" size="50" class="input"></td>
			</tr>
			<tr>
				<td width="100" class="title">상품명(K)</td>
				<td width="500"><input type="text" name="pkname" size="50" class="input"></td>
			</tr>
			
			<tr>
				<td width="100" class="title">상품카테고리1</td>
				<td width="500" class="pcode">
					<input type="radio" name="pcode" value="sh">신발
					<input type="radio" name="pcode" value="cl">의류
					<input type="radio" name="pcode" value="etc">잡화
				</td>
			</tr>
			<tr>
				<td width="100" class="title">상품카테고리2</td>
				<td width="500">
					<select name="pccode">
						<option value="" selected="selected">카테고리선택</option> 
						<option value="sn">스니커즈</option> 
						<option value="lo">로퍼/플랫</option> 
						<option value="sa">샌들/슬리퍼</option> 
						<option value="bo">부츠</option> 
						<option value="lts">긴팔 티셔츠</option> 
						<option value="sts">반팔 티셔츠</option> 
						<option value="hd">후드</option> 
						<option value="ss">스웨트셔츠</option> 
						<option value="cd">니트웨어</option> 
						<option value="ts">셔츠</option> 
						<option value="jk">자켓</option> 
						<option value="ct">코트</option> 
						<option value="pd">패딩</option> 
						<option value="pt">바지</option> 
						<option value="spn">반바지</option> 
						<option value="cap">모자</option> 
						<option value="bag">가방</option> 
						<option value="watch">시계</option> 
						<option value="figure">기타</option> 
					</select>
				</td>
			</tr>
			<tr>
				<td width="100" class="title">상품카테고리2</td>
				<td width="500" class="pcode2">
					<input type="radio" name="plux"  value="1">럭셔리
			</tr>
			<tr>
				<td width="100" class="title">성별</td>
				<td width="500" class="gender">
					<input type="radio" name="pgender" value="1">남자
					<input type="radio" name="pgender" value="2">여자
					<input type="radio" name="pgender" value="3">키즈
				</td>
			</tr>
		</table>
		<div class="insert-button">
			<input type="submit" value="등록">
			<input type="reset" value="취소">
		</div>
	</form>
	</div>
</div>
<script>


	$(frm).on("submit", function(e){
		e.preventDefault();
		var pmodel=$(frm.pmodel).val();
		var pimage=$(frm.file).val();
		var pbrand=$(frm.pbrand).val();
		var pename=$(frm.pename).val();
		var pkname=$(frm.pkname).val();
		var pcode=$('input[name="pcode"]:checked').val();
		var pccode=$(frm.pccode).val();
		var plux=$('input[name="plux"]:checked').val();
		var pgender=$('input[name="pgender"]:checked').val();
		
		
		if(pmodel==""){
			alert("모델명을 입력하세요");
			$(frm.pmodel).focus();
			return;
		}else if(pimage==""){
			alert("상품이미지를 입력하세요");
			return;
		}else if(pbrand==""){
			alert("상품브랜드를 입력하세요");
			$(frm.pbrand).focus();
			return;
		}else if(pename==""){
			alert("상품명(E)를 입력하세요");
			$(frm.pename).focus();
			return;
		}else if(pkname==""){
			alert("상품명(K)를 입력하세요");
			$(frm.pkname).focus();
			return;
		}else if($(':radio[name="pcode"]:checked').length<1){
			alert("상품카테고리1를 선택하세요");
			return;
		}else if(pccode==""){
			alert("상품카테고리2를 선택하세요");
			return;
		}else if($(':radio[name="pgender"]:checked').length<1){
			alert("성별을 선택하세요");
			return;
		}
		if(!confirm("등록하시겠습니까?")) return;
		frm.submit();
	})
	//이미지미리보기
	$("#image").on("click",function(){
		$(frm.file).click();
	})
	
	$(frm.file).on("change",function(e){
		var file=$(frm.file)[0].files[0]
		$("#image").attr("src",URL.createObjectURL(file))
	})
</script>
</div>