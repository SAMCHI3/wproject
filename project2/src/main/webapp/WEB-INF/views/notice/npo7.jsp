<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="/resources/css/notice.css" rel="stylesheet" >
<div id="page" class="container">
<div class="notice-home">
	<h1>공지사항</h1>
	<div>
		<ul>
			<li><a href="/notice/home?ucode=${ucode}">공지사항</a></li>
			<li><a href="/notice/nfaq?ucode=${ucode}">자주묻는 질문</a></li>
			<li><a href="/notice/npo?ucode=${ucode}" style="color:black;"><strong>검수기준</strong></a></li>
		</ul>
	</div>
	<div>
		<div>
			<ul>
				<li><a href="/notice/npo?ucode=${ucode}">신발</a></li>
				<li><a href="/notice/npo2?ucode=${ucode}">의류</a></li>
				<li><a href="/notice/npo3?ucode=${ucode}">패션잡화</a></li>
				<li><a href="/notice/npo4?ucode=${ucode}">테크</a></li>
				<li><a href="/notice/npo5?ucode=${ucode}">라이프</a></li>
				<li><a href="/notice/npo6?ucode=${ucode}">프리미엄 시계</a></li>
				<li><a href="/notice/npo7?ucode=${ucode}" style="color:black;"><strong>프리미엄 가방</strong></a></li>
			</ul>
	</div>
	</div>
</div>
<div class="notice-home2">
<h1>검수기준</h1>
	<div id="tbl"></div>
		<ul>
			<li>
				<c:if test="${ucode== 2}">
					<button class="insert"><a href="/notice/insert?ucode=${ucode}">글쓰기</a></button>
				</c:if>
			</li>
		</ul>
	<script id="temp" type="text/x-handlebars-template">
	{{#each list}}
		<tr>
			<td width="150">
				<button class="ntitle"><a href="/notice/read3?ncount={{ncount}}"> {{ntitle}}</a></button>
			</td>
		</tr>
	{{/each}}
	</script>	
</div>
</div>
<script>
	var page=1;
	getList();
	
function getList(){
	$.ajax({
		type: "get",
		url: "/notice/list.json",
		data: {page:page,ncode1:"3",ncode2:"7"},
		dataType: "json",
		success: function(data){
			var template = Handlebars.compile($("#temp").html());
			$("#tbl").html(template(data));
		
			
		}
	});
}
</script>
