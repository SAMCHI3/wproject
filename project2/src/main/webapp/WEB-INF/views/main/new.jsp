<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" href="/resources/css/new.css">

<div id="page">
	<h1>NEW ITEM!</h1>
	<img src="/resources/img/신상품3.jpg" class="newimg">
	<div id="new"></div>
	<jsp:include page="${category}"/>
	<script id="temp" type="text/x-handlebars-template">
	{{#each list}}
		<div class="new">
			<div><a href="/productList/read?pmodel={{pmodel}}"><img src="/display?fileName={{pimage}}" width=150></a></div>
			<div><p class="ellipsis-pename">{{pename}}</p></div>
			<div><p class="ellipsis-pkname">{{pkname}}</p></div>
			<div><p class="ellipsis-pbrand">{{pbrand}}</p></div>
			<div><p class="ellipsis-plprice">{{plprice}}</p></div>
		</div>
	{{/each}}
	</script>
	<script>
		Handlebars.registerHelper("display", function(ssell){
		      return ssell.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		   });
	</script>
	<div class="pagination"></div>
</div>
<script>
	var page=1;
	
	getList();
	function getList(){
		$.ajax({
			type:"get",
			url:"/product/list3.json",
			data:{page:page},
			dataType:"json",
			success:function(data){
				var template = Handlebars.compile($("#temp").html());
				$("#new").html(template(data));
				$(".pagination").html(getPagination(data));
			}
		});
	}
	
	$(".pagination").on("click", "a", function(e){
		e.preventDefault();
		page=$(this).attr("href");
		getList();
	});
</script>