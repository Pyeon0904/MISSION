<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작전_MISSIONPOSSIBLE</title>

<!-- 아이콘 라이브러리 link -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- 제이쿼리 import -->
<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>

<!-- 부트 스트랩 -->
<script src="${path}/resources/js/bootstrap.min.js"></script>
<link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet">


<style>
	*{margin:0; padding:0;}
	.headerArea, .introArea{
		width:1200px;
		height:82px;
		margin:0 auto;
	}
	ul.headerMenu, ul.introMenu, ul{
		list-style-type:none;
	}
	ul.headerMenu li {
		width:150px;
		height:80px;
		float:left;
		font-size:1.4em;
		font-weight:bold;
		text-align:center;
		line-height:3.5;
		margin-left:60px;
	}
	ul.headerMenu li:nth-child(6){
		width:50px;
		height:80px;
	}
	ul.introMenu li {
		width:120px;
		height:50px;
		float:left;
		font-size:1em;
		font-weight:bold;
		text-align:center;
		line-height:3;
		display:none;
	}
	ul.introMenu li:nth-child(1){
		margin-left:10px;
	}
	#hamburger{
		width:450px;
		height:800px;
		position:relative;
		background-color:#F7F8E0;
		left:100%;
		top:-1px;
		transform:translateX(-100%);
	}
	#loginSubmit{
		width: 80%;
		float:none;
		margin:0 auto;
	}
	#login{
		text-align:center;
	}
	#loginList{
		font-size: 20px;
	}
</style>
		<script>
			$(document).ready(()=>{
				$(".introduce").on("mouseenter", () => {
					$(".introMenu li").slideDown(400);
				});
				$(".introduce").on("mouseleave", () => {
					$(".introMenu li").slideUp(400);
				});
				$("#hamburger").hide();
	            $(".btnHBG").on("click", () => {
	                $("#hamburger").animate({width:'toggle'}, 400);
	             });
			});
		</script>
</head>
<body>
	<header>
		<div class="headerArea">
			<nav>
				<ul class="headerMenu">
					<li class="introduce"><a href="#">소개</a></li>
					<li><a href="#">챌린지</a></li>
					<li>
						<a href="#">
							<!-- 로고 이미지 -->
							<img src="${path}/resources/img/mung.jpg" width="150px" height="82px"/>
						</a>
					</li>
					<li><a href="#">고객센터</a></li>
					<li><a href="#">후기게시판</a></li>
					<li class="btnHBG"><a href="#"><i class="fa fa-bars" aria-hidden="true"></i></a></li>
				</ul>
			</nav>
			<div class="introArea">
				<nav>
					<ul class="introMenu">
						<li><a href="#">홈페이지 소개</a></li>
						<li><a href="#">개발자 소개</a></li>
					</ul>
				</nav>
			</div>
			<div id="hamburger">
				<div id="login">
					<br><br><br><br><br><br><br>
					<c:if test="${ loginMember == null }">
						<h4>로그인 해주세요.</h4>
						<br><br>
						<input type="button" class="btn btn-outline-success btn-lg" id="loginSubmit" onclick="location.href='${ path }/member/login'" value="로그인"/>
						<br><br><br><br><br><br><br><br><br>
						<ul id="loginList">
							<li><a href="#">후기>></a></li>
							<li><a href="#">인증샷>></a></li>
							<li><a href="#">고객센터>></a></li>
						</ul>
					</c:if>
					<c:if test="${ loginMember != null }">
						<h4>
							<a href="${ path }/member/view">
							${ loginMember.nickname }
							</a>님, 안녕하세요.<br><br><br>
						</h4>
						<button onclick="location.replace('${path}/member/logout')">로그아웃</button>
					</c:if>
				</div>
			</div>
		</div>
	</header>
