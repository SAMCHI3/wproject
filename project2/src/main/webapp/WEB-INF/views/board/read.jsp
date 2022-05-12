<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
		<link rel="stylesheet" href="/resources/css/boardread.css">
		<title>게시글작성</title>
	</head>
<div id="page">
   <h1>게시글정보</h1>
      <form name="frm" method="post" enctype="multipart/form-data">
       <div class="container">
      	 
         <div width="100" class="title">게시글 번호</div>
         	<div><input class="bno form-control" type="text" name="bno" value="${vo.bno}"readonly="readonly"></div>
         
         <div width="100" class="title">작성자</div>
         	<div><input class="form-control" type="text" name="bid" value="${vo.bid}"readonly="readonly"></div>
        
        <div width="100" class="title">작성일</div>
			<div class="form-control form1">
				<fmt:formatDate value="${vo.bdate}" pattern="yyyy-MM-dd HH:mm:ss" />
			</div>
            <div width="100" class="title">이미지</div>
            <div width="500">
               <img id="image" src="/display?fileName=${vo.bimage}" width="500" 
               accept="image/*">
               <input type="file" name="file" style="display: none">
            </div>
         
            <div width="100" class="title">내용</div>
           <div style="margin-bottom:20px;">
           		<input type="text" id="bcontent" name="bcontent" value="${vo.bcontent}" 
           		readonly="readonly">
           </div>
           
           
         <span class="imote"><button>❤️</button>${vo.bcount}</span>
         <h5>댓글</h5>
     <div class="read-button">
			<c:set var="bid" value="${vo.bid}" />
         <c:if test="${bid eq uid}">
            <button type="button" id="update">수정</button>
            <button class=delete type="button">삭제</button>
         </c:if>

		</div>  
		<div>
			<div id="replies"></div>
			<script id="temp" type="text/x-handlebars-template">
  		 	{{#each list}}
				<div class="row" rno="{{rno}}" style="border:none; padding-bottom:10px;">
					<div style="display:none;">
						{{rbno}} {{rno}}
					</div>
					<h4 class="replies"><img src="/display?fileName={{uimage}}"> {{rid}} 
						<span>{{rdate}}</span> </h4>
					<textarea class="rcontent" rows=3 sytle="board:none;">{{rcontent}}</textarea>
					<div class="rbutton" style="display:{{display rid}}">
						<button type="button" class="rupdate">수정</button>
						<button type="button" class="rdelete">삭제</button>
					</div>
				</div>
			{{/each}}
   			</script>
			<script>
            Handlebars.registerHelper("display", function(rid) {
               if (rid != "${uid}") {
                  return "none";
               }
            });
         </script>
         <div style="display: none;">
            <input type="text" name="rid"> 
            <input type="text" name="rbno"> 
            <input type="image" name="rimage" value="${vo.uimage}">
         </div>
         <textarea id="editor" rows="10" cols="80" name="rcontent" placeholder="내용"></textarea>
         <button style="float: right;" type="submit" id="insert">댓글등록</button>
      </div>
   </form>
</div>
<script>

var page=1;
var rbno="${vo.bno}";
var rimage="${vo.uimage}"

getRlist();

//댓글 등록
$(frm).on("submit", function(e){
   e.preventDefault();
   frm.action="/reply/insert";
   // frm.method="post";
   var rid="${uid}";
   var rcontent = CKEDITOR.instances.editor.getData();
   if(rcontent==""){
      alert("내용을 입력해주세요");
      $(CKEDITOR.instances.editor.getData()).focus();
      return;
   }
   if(!confirm("등록하시겠습니까?"))return;
        rbno=$(frm.rbno).val(rbno);
        rid=$(frm.rid).val(rid);
        alert(rbno+rid+rcontent+rimage)
       frm.submit();
         alert("등록성공");

});

//댓글 수정
$("#replies").on("click",".rupdate",function(e){
   e.preventDefault();
   var row=$(this).parent().parent();
   var rno=row.attr("rno");
   var rcontent=row.find(".rcontent").val();
   if(!confirm("내용을 수정하실래요?")) return;
   $.ajax({
      type:"post",
      url:"/reply/update",
      data:{rcontent:rcontent, rno:rno},
      success:function(){
         alert("수정되었습니다!");
         getRlist();
      }
   });
});

//댓글 삭제
$("#replies").on("click",".rdelete",function(e){
   e.preventDefault();
   var row=$(this).parent().parent();
   var rno=row.attr("rno");
    if(!confirm(rno+" 번 게시글을 삭제하시겠습니까?")) return;
    
   $.ajax({
      type:"post",
      url:"/reply/delete",
      data:{rno:rno},
      success:function(data){
         alert("삭제성공");
         getRlist();
      }
   })
});
//목록 출력 함수
function getRlist(){
   $.ajax({
      type:"get",
      url:"/reply/list.json",
      dataType:"json",
      data:{page:page, rbno:rbno},
      success: function(data){
         var template = Handlebars.compile($("#temp").html());
         $("#replies").html(template(data));
//          $(".pagination").html(getPagination(data));
         
      }
   });
}

$(".pagination").on("click", "a", function(e){
   e.preventDefault();
   page=$(this).attr("href");
   getRlist();
});





//댓글

//ckEditor출력
var ckeditor_config = {
    resize_enable : false, //editor 사이즈를 변경하지 못한다. 
    enterMode : CKEDITOR.ENTER_BR, 
    shiftEnterMode : CKEDITOR.ENTER_P, 
    filebrowserUploadUrl : "/ckupload", 
    height: 300
 };
 CKEDITOR.replace('editor', ckeditor_config)
    
 //게시글 수정,삭제
$(frm).on("click","#update",function(e){
   e.preventDefault();
      var bno=$(this).parent().parent().find(".bno").val();
      alert(bno);
      location.href="/board/update?bno=" + bno;
   })

   $("#page").on("click",".delete",function(e){
      e.preventDefault();
      var bno=$(this).parent().parent().find(".bno").val();
      if(!confirm(bno+" 번 게시글을 삭제하시겠습니까?")) return;
      
      $.ajax({
         type: "get",
         url: "/board/delete",
         data: {bno:bno},
         success: function(data){
            alert("삭제 처리 완료!");
            location.href="/board/list";
            
         }
      })
   })
</script>