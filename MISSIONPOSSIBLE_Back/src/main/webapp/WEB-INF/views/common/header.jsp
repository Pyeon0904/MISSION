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

<!-- 부트 스트랩
<script src="${path}/resources/js/bootstrap.min.js"></script>
<link href="${path}/resources/css/bootstrap.min.css" rel="stylesheet">
-->

<style>
	*{margin:0; padding:0;}
	.headerArea{
		width:1200px;
		height:82px;
		margin:0 auto;
	}
	ul.headerMenu, ul.introMenu, ul{
		list-style-type:none;
	}
	ul.headerMenu li.header_li {
		width:150px;
		height:80px;
		float:left;
		font-size:1.4em;
		font-weight:bold;
		text-align:center;
		line-height:3.5;
		margin-left:60px;
	}
	ul.headerMenu li.header_li:nth-child(6){
		width:50px;
		height:80px;
	}
	ul.headerMenu>li.introduce>ul.introMenu{
		width:250px;
		height:60px;
		margin-left:-50px;
	}
	ul.headerMenu>li.introduce>ul.introMenu li {
		width:120px;
		height:50px;
		float:left;
		font-size:0.8em;
		font-weight:bold;
		text-align:center;
		line-height:3;
		display:none;
		float:left;
	}
	#hamburger{
		width:450px;
		height:800px;
		background-color:#F7F8E0;
		left:100%;
		top:82px;
		transform:translateX(-100%);
		box-shadow: -20px 20px 20px grey;
		position: relative; /*z-index 사용해서 배치 앞으로 하기 위해 작성*/
		z-index: 999;
	}
	#login{
		width:450px;
		height:600px;
		position:absolute;
		background-color:#F7F8E0;
		left:100%;
		transform:translateX(-100%);
		text-align:center;
		position: relative; /*z-index 사용해서 배치 앞으로 하기 위해 작성*/
		z-index: 999;
	}
	#loginSubmit, #afterLoginList{
		width:300px;
		height:50px;
		float:none;
		margin:0 auto;
		background-color:#8FBC8F;
	}
	#loginList{
		font-size:20px;
		width:300px;
		height:50px;
		float:none;
		margin:0 auto;
		background-color:#F7F8E0;
		position: relative; /*z-index 사용해서 배치 앞으로 하기 위해 작성*/
		z-index: 999;
	}
	#hamburgerText{
		font-size:25px;
		font-weight:bold;
		color: #FF6347
	}
</style>
<script type="text/javascript">
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
					<li class="header_li introduce">
						<a href="${ path }/introduce/introduce">소개</a>
						<ul class="introMenu">
							<li><a href="${ path }/introduce/introduce">홈페이지 소개</a></li>
							<li><a href="${ path }/introduce/developer">개발자 소개</a></li>
						</ul>
					</li>
					<li class="header_li"><a href="${ path }/challenge/recruitList">챌린지</a></li>
					<li class="header_li">
						<a href="${ path }">
							<!-- 로고 이미지 -->
							<img src="${path}/resources/images/file.png" width="150px" height="82px"/>
						</a>
					</li>
					<li class="header_li"><a href="${ path }/board/boardList">고객센터</a></li>
					<li class="header_li"><a href="${ path }/review/reviewList">후기게시판</a></li>
					<li class="btnHBG header_li"><a href="#"><i class="fa fa-bars" aria-hidden="true"></i></a></li>
				</ul>
			</nav>
			<div id="hamburger">
				<div id="login">
					<br><br><br><br><br><br><br>
					<!-- 로그인 전 -->
					<c:if test="${ loginMember == null }">
						<h1 id="hamburgerText">"오늘은 어떤 작전을 시작해볼까요?"</h1>
						<br><br>
						<h4>로그인 해주세요</h4>
						<br><br>
						<input type="button" class="btn btn-outline-success btn-lg" id="loginSubmit" onclick="location.href='${ path }/member/login'" value="로그인"/>
						<br><br><br><br><br>
					    <input type="button" id="loginList" class="btn btn-outline-success btn-lg" onclick="#" value="후기>"/><hr>
						<input type="button" id="loginList" class="btn btn-outline-success btn-lg" onclick="#" value="인증샷>"/><hr>
						<input type="button" id="loginList" class="btn btn-outline-success btn-lg" onclick="#" value="고객센터>"/>
					</c:if>
					<!-- 로그인 후 -->
					<c:if test="${ loginMember != null }">
						<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
						<h3>${ loginMember.nickname }</h3>
						<br><br><br>
						<input type="button" id="afterLoginList" class="btn btn-outline-success btn-lg" onclick="location.href='${ path }/member/myPage'" value="마이페이지"/><br><br>
						<input type="button" id="afterLoginList" class="btn btn-outline-success btn-lg" onclick="location.href='${ path }/member/followList'" value="팔로우"/><br><br>
						<table class="table table-striped table-bordered table-hover" id="loginTable" style="width: 300px; margin:auto; text-align: center">
							<th class="success">참가중</th>
							<th class="success">완료</th>
							<th class="success">개설</th>
							<tr class="success">
								<td>0</td>
								<td>0</td>
								<td>0</td>
							</tr>
						</table>
						<br><br>
						<input type="button" id="loginList" class="btn btn-outline-success btn-lg" onclick="#" value="찜>"/><hr>
						<table style="width: 300px; margin:auto;">
							<tr>
								<td>보유 포인트</td>
								<th style="width: 100px">${ loginMember.point }</th>
							</tr>
						</table>
						<hr>
						<table style="width: 300px; margin:auto;">
							<tr>
								<td>등급</td>
								<th style="width: 100px">${ loginMember.gradeName }</th>
							</tr>
						</table>
						<br><br>
						<button class="btn btn-outline-success btn-lg" onclick="location.replace('${path}/member/logout')">로그아웃</button>
					</c:if>
				</div>
			</div>
		</div>
	</header>
 <!--  
</body>
</html>
 -->
