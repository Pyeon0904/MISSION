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

<style>
	/* --- 헤더 위쪽 관리자 권한 부분 ------------------------------------------------------------------------- */
		/* 메뉴바 위치 */
		.menu {
			z-index:17;
			text-align:center;
			position: absolute;
			left:0%;
			top: 150px;
			margin:auto;
			width: 100%;
			height:45px;
		}
		.col{ position:relative; width:100%; }
	
		/*하위 메뉴 구분하기*/
		.semititle{ 
			text-align:center;
			font-family: 'GmarketSansMedium';
			font-size: 16px;
			padding: 10px 10px;
			color:green;
			text-decoration: none;
		}
		
		/*메인 탭*/	
		.maintab {
			position:relative;
			left: 49%;
			list-style-type: none;		
			padding: 0;
			margin: 0;
		}
			
		/*메인탭 설정*/
		.maintab li {
			float: left;
			width: 120px;
			position: relative;
			padding: 0;
			line-height: 25px;
		}
			
		/*글자 관련 설정*/
		.submenu {
			text-align:center;
			display: block;
			font-family: 'GmarketSansMedium';
			font-size: 16px;
			padding: 10px;
			color:#948c84;
			text-decoration: none;
		}
		
		/*세부 탭 기본 설정*/
		.detailtab {
			position: absolute;
			left: 0px;
			width: 200px;
			list-style-type: none;
			padding: 0;
			margin: 0;
			display:none;
		}
	/* ---------------------------------------------------------------------------- */
	
	/* 공통 헤더 부분 ---------------------------------------------------------------------------- */
	*{margin:0; padding:0;}
	.headerArea{
		width:1200px;
		height:82px;
		margin:0 auto;
	}
	ul.headerMenu, ul.introMenu, ul.challengeMenu, ul{
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
	ul.introMenu{
		width:250px;
		height:60px;
		margin-left:-50px;
	}
	ul.introMenu li {
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
	ul.challengeMenu{
		width:250px;
		height:60px;
		margin-left:-50px;
	}
	ul.challengeMenu li {
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
	ul.headerMenu>li.challenge>ul.challengeMenu{
		width:250px;
		height:60px;
		margin-left:-50px;
	}
	ul.headerMenu>li.challenge>ul.challengeMenu li {
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
	ul.headerMenu>li.challenge>ul.challengeMenu{
		width:250px;
		height:60px;
		margin-left:-50px;
	}
	ul.headerMenu>li.challenge>ul.challengeMenu li {
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
		display:none;
	}
	#login{
		width:450px;
		height:600px;
		position:absolute;
		background-color:#F7F8E0;
		left:100%;
		transform:translateX(-100%);
		text-align:center;
		/*position: relative; z-index 사용해서 배치 앞으로 하기 위해 작성*/
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
		$(".introduce").hover(
			function(){
<<<<<<< HEAD
				$(".introMenu li").not(':animated').slideDown(400);
			},	
			function(){
				$(".introMenu li").not(':animated').slideUp(400);
			}	
		);
		$(".challenge").hover(
			function(){
				$(".challengeMenu li").not(':animated').slideDown(400);
			},	
			function(){
				$(".challengeMenu li").not(':animated').slideUp(400);
			}	
		);
=======
				$(".introMenu li").slideDown(400);
			},	
			function(){
				$(".introMenu li").slideUp(400);
			}	
		);
		$(".challenge").hover(
				function(){
					$(".challengeMenu li").slideDown(400);
				},	
				function(){
					$(".challengeMenu li").slideUp(400);
				}	
			);
		/*
		$(".introduce").on("mouseenter", () => {
			$(".introMenu li").slideDown(400);
		});
		$(".introduce").on("mouseleave", () => {
			$(".introMenu li").slideUp(400);
		});
		*/
		
		$(".challenge").on("mouseenter", () => {
			$(".challengeMenu li").slideDown(400);
		});
		$(".challenge").on("mouseleave", () => {
			$(".challengeMenu li").slideUp(400);
		});
		
>>>>>>> 224f81a064f30fbb81d8f9d8690613311e13c300
	    $(".btnHBG").on("click", () => {
	       $("#hamburger").css("position", "fixed").css("top", "100px").animate({width:'toggle'}, 400);
	    });
	});
</script>
</head>
<body>
	<!-- 헤더 위 관리자권한 부분------------------------------------------------------------ -->
	<c:if test="${ loginMember.id eq 'admin' }">
		<div class="menu">
				<div class="col">
				<ul class="maintab">
					<li><a class="semititle" href="${ path }/admin/viewUser">고객관리</a></li>
					<li><a class="semititle" href="${ path }/admin/viewChallenge">챌린지관리</a></li>
					<li><a class="semititle" href="${ path }/admin/report/reportReview">신고접수</a></li>
					<li><a class="semititle" href="${ path }/admin/viewBoard">고객센터관리</a>
					<li><a class="semititle" href="${ path }/admin/review/viewReview">후기관리</a></li>
				</ul>
				</div>
		</div>
	</c:if>
		<!-- ----------------------------------------------------------------------------- -->

	<header>
		<div class="headerArea">
			<nav>
				<ul class="headerMenu">
					<li class="header_li">
						<a href="${ path }">
							<!-- 로고 이미지 -->
							<img src="${path}/resources/images/logofirst.png" width="150px" height="150px"/>
						</a>
						
					</li>
					<li class="header_li introduce">
						<a href="${ path }/introduce/introduce">소개</a>
						<ul class="introMenu">
							<li><a href="${ path }/introduce/introduce">홈페이지 소개</a></li>
							<li><a href="${ path }/introduce/developer">개발자 소개</a></li>
						</ul>
					</li>
					<li class="header_li challenge">
						<a href="${ path }/challenge/recruitList">챌린지</a>
						<ul class="challengeMenu">
							<li><a href="${ path }/challenge/challengeRegister">챌린지 등록</a></li>
							<li><a href="${ path }/challenge/recruitList">챌린지 목록</a></li>
						</ul>
<<<<<<< HEAD
					</li>
					<li class="header_li">
						<a href="${ path }">
							<!-- 로고 이미지 -->
							<img src="${path}/resources/images/file.png" width="150px" height="82px"/>
						</a>
=======
>>>>>>> 224f81a064f30fbb81d8f9d8690613311e13c300
					</li>
					<li class="header_li"><a href="${ path }/board/boardList">고객센터</a></li>
					<li class="header_li"><a href="${ path }/review/reviewList">후기게시판</a></li>
					<li class="btnHBG header_li"><a href="#"><i class="fa fa-bars" aria-hidden="true"></i></a></li>
				</ul>
			</nav>
			<div id="hamburger">
				<div id="login">
					<div class="btnHBG" style="font-size:2em; text-align:left; margin-left:20px;">
						<i class="fa fa-caret-square-o-right" aria-hidden="true"></i>
					</div>
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
								<!-- 로그인 POST 요청에서 구한 유저의 업적을 출력 -->
								<c:forEach var="achieveCount" items="${ achievements }">
									<td><c:out value="${ achieveCount }"/></td>
								</c:forEach>
							</tr>
						</table>
						<br><br>
<<<<<<< HEAD
						<input type="button" id="loginList" class="btn btn-outline-success btn-lg" onclick="location.href='${path}/challenge/zzimList'" value="찜>"/><hr>
						<table style="width: 300px; margin:auto;">
=======
						<input type="button" id="loginList" class="btn btn-outline-success btn-lg" onclick="location.href='${path}/challenge/zzimList'" value="찜>"/>
						<br><br><br>
						<table style="width: 300px; height: 100px; margin:auto; text-align: left;">
>>>>>>> 224f81a064f30fbb81d8f9d8690613311e13c300
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
