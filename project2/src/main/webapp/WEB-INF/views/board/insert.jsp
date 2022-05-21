<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <head>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
		<link rel="stylesheet" href="/resources/css/boardinsert.css">
		<title>게시글작성</title>
	</head>
<div id="page">
	<div class="container">
	   	<h1>게시글작성</h1>
	      <form class="form-insert" name="frm" method="post" enctype="multipart/form-data">
	       <table style="display:inline-block;">
	      
	         <tr>
	         <td width="100" class="title">작성자</td>
	         	<td><input class="form-control" type="text" name="bid" value="${uid}"readonly="readonly"></td>
	         </tr>
	         <tr>
	            <td width="100" class="title">이미지</td>
	            <td width="500">
	               <img id="image" src="https://via.placeholder.com/500x500" width="500" accept="image/*">
	               <input type="file" name="file" style="display: none">
	            </td>
	         </tr>
	         <tr>
	            <td width="100" class="title">내용</td>
	           <td><textarea rows="20" cols="100" id="bcontent" name="bcontent" style="width:500px; height:100px; resize:none;"></textarea></td>
	         </tr>
	        
	      </table>
	      <div class="insert-button">
	         <button type="submit">등록</button>
	        <button type="reset">취소</button>
	      </div>
	   	</form>
	</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script>

$(frm).on("submit",function(e){
 	e.preventDefault();
	var bimage=$(frm.file).val();
 	var bcontent=$(frm.bcontent).val();
 	var bid=$(frm.bid).val();
	
	
 	if(bimage==""){
         alert("이미지을 선택하세요");
         return;
    }else if(bcontent==""){
         alert("내용을 입력하세요");
         $(frm.bcontent).focus();
      	return;
	}
 	if(!confirm("등록하시겠습니까?")) return;
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