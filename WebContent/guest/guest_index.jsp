<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>

<link rel="stylesheet" href="../css/style.css">
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body>
	<%@ include file="guest_top.jsp"%>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

	<script>
		$('.carousel').carousel({
			interval : 2000
		})
	</script>

	<div id="demo" class="carousel slide" data-ride="carousel" style="width:80%;">
		<div class="carousel-inner">
			<!-- 슬라이드 쇼 -->
			<div class="carousel-item active">
				<!--가로-->
				<img class="d-block w-100" src="../image/welcome.jpg"
					alt="First slide">
				<div class="carousel-caption d-none d-md-block">
					
					<a role="button" class="btn btn-success" href="../member/login.jsp" >로그인하러 가기</a>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="../image/jean_credit.jpg" alt="Second slide">
				<div class="carousel-caption d-none d-md-block">
					
					<a role="button" class="btn btn-success" href="../guest/productlist.jsp">카드보러 가기</a>
					</div>
			</div>
			<div class="carousel-item">
				<img class="d-block w-100" src="../image/choice.jpg" alt="Third slide">
				<div class="carousel-caption d-none d-md-block">
					<a role="button" class="btn btn-success" href="../guest/benefit.jsp" >혜택별 카드 보기</a>
					</div>
			</div>
		</div>
		<!-- / 슬라이드 쇼 끝 -->
		<!-- 왼쪽 오른쪽 화살표 버튼 -->
		<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"> </span> <!-- <span>Previous</span> -->
		</a> <a class="carousel-control-next" href="#demo" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"> </span>
			<!-- <span>Next</span> -->
		</a>
		<!-- / 화살표 버튼 끝 -->
		<!-- 인디케이터 -->
		<ul class="carousel-indicators">
			<li data-target="#demo" data-slide-to="0" class="active"></li>
			<!--0번부터시작-->
			<li data-target="#demo" data-slide-to="1"></li>
			<li data-target="#demo" data-slide-to="2"></li>
		</ul>
		<!-- 인디케이터 끝 -->
	</div>

	<%@ include file="guest_bottom.jsp"%>
</body>
</html>