<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="/resources/css/notice.css" rel="stylesheet" >
<div id="page" class="container">
<div class="notice-home">
	<h1 style="font-weight:bold;">공지사항</h1>
	<div>
		<ul>
			<li><a href="/notice/home?ucode=${ucode}">공지사항</a></li>
			<li><a href="/notice/nfaq?ucode=${ucode}" style="color:black"><strong>자주묻는 질문</strong></a></li>
			<li><a href="/notice/npo?ucode=${ucode}">검수기준</a></li>
		</ul>
	</div>
	<div>
		<div>
			<ul>
				<li><a href="/notice/nfaq?ucode=${ucode}">이용정책</a></li>
				<li><a href="/notice/nfaq2?ucode=${ucode}">공통</a></li>
				<li><a href="/notice/nfaq3?ucode=${ucode}" style="color:black"><strong>구매</strong></a></li>
				<li><a href="/notice/nfaq4?ucode=${ucode}">판매</a></li>
			</ul>
	</div>
	</div>
</div>
<div class="notice-home2">
<h2>자주묻는 질문-구매</h2>
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
				<button class="ntitle"><a href="/notice/read2?ncount={{ncount}}"> {{ntitle}}</a></button>
			</td>
		</tr>
	{{/each}}
	</script>	
</div>
</div>
<script>
	var page=2;
	getList();
	
function getList(){
	$.ajax({
		type: "get",
		url: "/notice/list.json",
		data: {page:page,ncode1:"2",ncode2:"3"},
		dataType: "json",
		success: function(data){
			var template = Handlebars.compile($("#temp").html());
			$("#tbl").html(template(data));
		
			
		}
	});
}
</script>