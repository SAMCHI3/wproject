<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="/resources/css/productlistupdate.css">

<div id="page">
	
		<form name="frm" method="post" enctype="multipart/form-data">
		<div class="container">
		<h1>상품수정</h1>
		<table>
			<tr class="information">
				<td width="100" class="title">모델명</td>
				<td width="500"><input type="text" value="${vo.pmodel}" name="pmodel" size="10" readonly="readonly"></td>
			</tr>
			<tr class="information">
				<td width="100" class="title">상품이미지</td>
				<td width="500">
					<img id="image" src="/display?fileName=${vo.pimage}" width="300" accept="image/*">
					<input type="file" name="file" style="display: none">
					<input type="hidden" name="pimage" value="${vo.pimage}"> 
				</td>
			</tr>
			<tr class="information">
				<td width="100" class="title">상품브랜드</td>
				<td width="500"><input type="text" value="${vo.pbrand}" name="pbrand" size="50"></td>
			</tr>
			<tr class="information">
				<td width="100" class="title">상품명(E)</td>
				<td width="500"><input type="text" value="${vo.pename}" name="pename" size="50"></td>
			</tr>
			<tr class="information">
				<td width="100" class="title">상품명(K)</td>
				<td width="500"><input type="text" value="${vo.pkname}" name="pkname" size="50"></td>
			</tr>
			<tr>
            <td width="100" class="title2">상품카테고리1</td>
            <td width="500" class="pcode">
               <c:if test="${vo.pcode == 'sh' }">
                  <input type="radio" name="pcode" value="sh" checked="checked">신발
               </c:if>
               <c:if test="${vo.pcode != 'sh' }">
                  <input type="radio" name="pcode" value="sh">신발
               </c:if>
            
               <c:if test="${vo.pcode == 'cl' }">
                  <input type="radio" name="pcode" value="cl" checked="checked">의류
               </c:if>
               <c:if test="${vo.pcode != 'cl' }">
                  <input type="radio" name="pcode" value="cl">의류
               </c:if>
               
               <c:choose>
                  <c:when test="${vo.pcode == 'etc'}">
                     <input type="radio" name="pcode" value="etc" checked="checked">잡화
                  </c:when>
                  <c:otherwise>
                     <input type="radio" name="pcode" value="etc" >잡화
                  </c:otherwise>
               </c:choose>
            </td>
         </tr>
           <tr>
	           <td width="100" class="title2">상품카테고리2</td>
	           <td width="500">
                 <select name="pccode">
                     <c:if test="${vo.pccode == 'sn' }">
                           <option value="sn" selected="selected">스니커즈</option> 
                       </c:if>
                       <c:if test="${vo.pccode != 'sn' }">
                           <option value="sn" >스니커즈</option> 
                       </c:if>
                
                     <c:if test="${vo.pccode == 'lo' }">
                           <option value="lo" selected="selected">로퍼/플랫</option> 
                       </c:if>
                       <c:if test="${vo.pccode != 'lo' }">
                           <option value="lo">로퍼/플랫</option> 
                       </c:if>
                     
                     <c:if test="${vo.pccode == 'sa' }">
                      <option value="sa" selected="selected">샌들/슬리퍼</option> 
                       </c:if>
                       <c:if test="${vo.pccode != 'sa' }">
                      <option value="sa" >샌들/슬리퍼</option> 
                       </c:if>
                    
                     <c:if test="${vo.pccode == 'bo' }">
                       <option value="bo" selected="selected">부츠</option> 
                       </c:if>
                       <c:if test="${vo.pccode != 'bo' }">
                       <option value="bo">부츠</option> 
                       </c:if>
                  
                     <c:if test="${vo.pccode == 'lts' }">
                         <option value="lts" selected="selected">긴팔 티셔츠</option> 
                       </c:if>
                       <c:if test="${vo.pccode != 'lts' }">
                         <option value="lts">긴팔 티셔츠</option> 
                       </c:if>
                  
                     <c:if test="${vo.pccode == 'sts' }">
                         <option value="sts" selected="selected">반팔 티셔츠</option> 
                       </c:if>
                       <c:if test="${vo.pccode != 'sts' }">
                         <option value="sts">반팔 티셔츠</option> 
                       </c:if>
                   
                     <c:if test="${vo.pccode == 'hd' }">
                        <option value="hd" selected="selected">후드</option> 
                       </c:if>
                        <c:if test="${vo.pccode != 'hd' }">
                        <option value="hd">후드</option> 
                       </c:if>
                    
                     <c:if test="${vo.pccode == 'ss' }">
                       <option value="ss" selected="selected">스웨트셔츠</option> 
                       </c:if>
                       <c:if test="${vo.pccode != 'ss' }">
                       <option value="ss">스웨트셔츠</option> 
                       </c:if>
                   
                     <c:if test="${vo.pccode == 'cd' }">
                        <option value="cd" selected="selected">니트웨어</option> 
                       </c:if>
                        <c:if test="${vo.pccode != 'cd' }">
                        <option value="cd">니트웨어</option> 
                       </c:if>
                     
                     <c:if test="${vo.pccode == 'ts' }">
                      <option value="ts" selected="selected">셔츠</option> 
                       </c:if>
                       <c:if test="${vo.pccode != 'ts' }">
                      <option value="ts">셔츠</option> 
                       </c:if>
                     
                     <c:if test="${vo.pccode == 'jk' }">
                      <option value="jk" selected="selected">자켓</option> 
                       </c:if>
                       <c:if test="${vo.pccode != 'jk' }">
                      <option value="jk">자켓</option> 
                       </c:if>
                     
                     <c:if test="${vo.pccode == 'ct' }">
                      <option value="ct" selected="selected">코트</option> 
                       </c:if>
                        <c:if test="${vo.pccode != 'ct' }">
                      <option value="ct">코트</option> 
                       </c:if>
                    
                     <c:if test="${vo.pccode == 'pd' }">
                       <option value="pd" selected="selected">패딩</option> 
                       </c:if>
                         <c:if test="${vo.pccode != 'pd' }">
                       <option value="pd">패딩</option> 
                       </c:if>
                    
                     <c:if test="${vo.pccode == 'pt' }">
                       <option value="pt" selected="selected">바지</option> 
                       </c:if>
                         <c:if test="${vo.pccode != 'pt' }">
                       <option value="pt">바지</option> 
                       </c:if>
                    
                      <c:if test="${vo.pccode == 'spn' }">
                       <option value="spn" selected="selected">반바지</option> 
                       </c:if>
                        <c:if test="${vo.pccode != 'spn' }">
                       <option value="spn">반바지</option> 
                       </c:if>
                     
                       <c:if test="${vo.pccode == 'cap' }">
                       <option value="cap" selected="selected">모자</option>
                       </c:if>
                       <c:if test="${vo.pccode != 'cap' }">
                       <option value="cap">모자</option>
                       </c:if>
                       
                  	 <c:if test="${vo.pccode == 'bag' }">
                          <option value="bag" selected="selected">가방</option> 
                      </c:if>
                      <c:if test="${vo.pccode != 'bag' }">
                          <option value="bag">가방</option> 
                      </c:if>
                                
                     <c:if test="${vo.pccode == 'watch' }">
                     	<option value="watch" selected="selected">시계</option> 
                     </c:if>
                     <c:if test="${vo.pccode != 'watch' }">
                     	<option value="watch">시계</option> 
                     </c:if>
                     
                     <c:if test="${vo.pccode == 'figure' }">
                     	<option value="figure" selected="selected">기타</option> 
                     </c:if>
                      <c:if test="${vo.pccode != 'figure' }">
                     	<option value="figure">기타</option> 
                     </c:if>
                  </select>
               </td>
             </tr>
         
         <tr>
            <td width="100" class="title2">상품카테고리3</td>
            <td width="500" class="pcode2">
               <c:if test="${vo.plux == '1' }">
                  <input type="radio" name="plux"  value="1" checked="checked">럭셔리
               </c:if>
               <c:if test="${vo.plux != '1' }">
                  <input type="radio" name="plux"  value="1">럭셔리
               </c:if>
         </tr>
         <tr>
            <td width="100" class="title2">성별</td>
            <td width="500" class="pcode2">
               <c:if test="${vo.pgender == '1' }">
                  <input type="radio" name="pgender" value="1" checked="checked">남자
               </c:if>
               <c:if test="${vo.pgender != '1' }">
                  <input type="radio" name="pgender" value="1" >남자
               </c:if>
               <c:if test="${vo.pgender == '2' }">
               <input type="radio" name="pgender" value="2" checked="checked">여자
               </c:if>
               <c:if test="${vo.pgender != '2' }">
               <input type="radio" name="pgender" value="2">여자
               </c:if>
               <c:if test="${vo.pgender == '3' }">
               <input type="radio" name="pgender" value="3" checked="checked">키즈
               </c:if>
               <c:if test="${vo.pgender != '3' }">
               <input type="radio" name="pgender" value="3">키즈
               </c:if>
            </td>
         </tr>
		</table>
		<div style="text-align: center; padding: 20px;" class="update-button">
			<input type="submit" value="수정">
			<input type="button" class="delete" value="삭제">
			<input type="reset" value="취소">
		</div>
		</div>z
	</form>
</div>
<script>

	$(frm).on("click",".delete",function(e){
		e.preventDefault();
		var pmodel=$(frm.pmodel).val();
		if(!confirm(pmodel+"상품을 삭제하시겠습니까?"))return;
		$.ajax({
			type:"post",
			data:{pmodel:pmodel},
			url:"/productList/delete",
			success:function(data){
				alert("삭제완료");
				location.href="/";
			}
		})
	})

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
		}
		if(!confirm("수정하시겠습니까?")) return;
		$.ajax({
			datatype:"post",
			url:"/productList/update",
			data:{pmodel:pmodel,pimage:pimage,pbrand:pbrand,pename:pename,pkname:pkname,pcode:pcode,pccode:pccode,plux:plux,pgender:pgender},
			success:function(data){
				alert("수정성공");
				frm.submit();
			}
		})
		
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