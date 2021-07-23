<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<title>작 전 : MISSION</title>

<!-- 아이콘 라이브러리 link -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
 a { text-decoration: none; color: black; }
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'GmarketSansLight';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}


/* --- 헤더(로고 & 메뉴바) 스타일 ------------------------------------------------------------------------- */

		#bg{
			padding:0px;
			overflow-x:hidden;
			z-index:0;	
		}

		/* 로고 설정 */
		.logo {
			margin: 0px;
			position: absolute;
			top: 15px;
			left:45%;
			width: 150px;
			display: inline-block;
			z-index:1;
		}
		
		#homeIntroButton {
			margin: 0px;
			position: absolute;
			left:5.5%;
			z-index:1;
		}
	
		/*메뉴바*/
		.menu {
			position: absolute;
			left:3%;
			top: 20px;
			margin:0px;
			width: 800px;
			height:45px;
		}
		
		/* 햄버거 위치 */
		.menu2 {
			position: absolute;
			right:0%;
			top: 20px;
			margin:0px;
			width: 800px;
			height:45px;
		}
		
		/*마우스 on 
		.col:hover{ position:relative; width:800px; height:180px; background-color : green;}
		
		
		/*하위 메뉴 구분하기*/
		.semititle{ 
			text-align:center;
			display: block;
			font-family: 'GmarketSansMedium';
			font-size: 16px;
			padding: 10px 20px;
			color:black;
			text-decoration: none;
		}
	
		/*메인 탭*/	
		.maintab {
			position:relative;
			left:0px;
			list-style-type: none;
			padding: 0;
			margin: 0;
		}
		
		/*메인탭 설정*/
		.maintab li {
			float: left;
			width: 150px;
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
			padding: 10px 20px;
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
/* ----------------------------------------------------------------------------------------------- */

/* --- 헤더 위쪽 관리자 권한 부분 ------------------------------------------------------------------------- */
		/* 메뉴바 위치 */
		.adminMenu {
			z-index:17;
			text-align:center;
			position: absolute;
			left:0%;
			top: 150px;
			margin:auto;
			width: 100%;
			height:45px;
		}
		.adminCol{ position:relative; width:100%; }
	
		/*하위 메뉴 구분하기*/
		.adminSemititle{ 
			text-align:center;
			font-family: 'GmarketSansMedium';
			font-size: 16px;
			padding: 10px 10px;
			color:green;
			text-decoration: none;
		}
		
		/*메인 탭*/	
		.adminMaintab {
			position:relative;
			left: 0%;
			list-style-type: none;		
			padding: 0;
			margin: 0;
		}
			
		/*메인탭 설정*/
		.adminMaintab li {
			float: left;
			width: 140px;
			position: relative;
			padding: 0;
			line-height: 25px;
		}
			
		/*글자 관련 설정*/
		.adminSubmenu {
			text-align:center;
			display: block;
			font-family: 'GmarketSansMedium';
			font-size: 16px;
			padding: 10px;
			color:#948c84;
			text-decoration: none;
		}
		
		/*세부 탭 기본 설정*/
		.adminDetailtab {
			position: absolute;
			left: 0px;
			width: 200px;
			list-style-type: none;
			padding: 0;
			margin: 0;
			display:none;
		}
	/* ---------------------------------------------------------------------------- */
	
/* 햄버거 버튼 관련 ----------------------------------------------------------------------------------------------- */
	
		/* 햄버거 (세 줄) 버튼 */
		.btnHBG {
			position: absolute;
			top: 7px;
			text-align:center;
		}
		
		#hamburger{
			width:450px;
			height:850px;
			background-color:#FFFFFF;
			left:100%;
			top:82px;
			transform:translateX(-100%);
			box-shadow: -20px 20px 20px grey;
			position: fixed; /*z-index 사용해서 배치 앞으로 하기 위해 작성*/
			display:none;
			z-index: 999;
		}
		
		#login{
			width:450px;
			height:600px;
			position:absolute;
			background-color:#FFFFFF;
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
			background-color:#FFFFFF;
			border-radius: 20px;
			border : 0;
			box-shadow: 5px 5px 5px gray;
			cursor:pointer;
		}
		#loginList{
			font-size:20px;
			width:300px;
			height:50px;
			float:none;
			margin:0 auto;
			background-color:#97FD97;
			position: relative; /*z-index 사용해서 배치 앞으로 하기 위해 작성*/
			z-index: 999;
			border-radius: 20px;
			border : 0;
			box-shadow: 5px 5px 5px gray;
			cursor:pointer;
		}
		#hamburgerText{
			font-size:25px;
			font-weight:bold;
			color: #FF6347;
		}
	
		.menu2 ul li{
			float:right;
			
		}
/* ----------------------------------------------------------------------------------------------- */
		
		/* 로그인, 회원가입 버튼 */
		.pageTitle{
			width: 100px;
			height: 45px;
		}
		
		.modal{ 
		  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none; z-index: 8;
		}
				
	
</style>
<script>
		$(document).on('mouseover', '.menu a', function () {
			$('.detailtab').slideDown(0);
		});
		
		$(document).on('mouseleave', 'div', function () {
		         $('.detailtab').slideUp(0);
		});
        
		$(document).ready(()=>{
			$(".btnHBG").on("click", () => {
		 		$("#hamburger").animate({width:'toggle'}, 400);
		 	});
		});
		
		$(function(){ 

			  $("#level").click(function(){
			    $(".modal").fadeIn();
			  });
			  
			  $(".modal").click(function(){
			    $(".modal").fadeOut();
			  });
			  
		});
</script>

</head>
<body id="bg">
	<!-- 헤더 관리자권한 부분------------------------------------------------------------ -->
		<c:if test="${ loginMember.status eq 'A' }">
			<div class="adminMenu">
					<div class="adminCol">
					<ul class="adminMaintab">
						<li><a class="adminSemititle" href="${ path }/admin/member/admin_viewAllMember">회원관리</a></li>
						<li><a class="adminSemititle" href="${ path }/admin/challenge/viewChallenge">챌린지관리</a></li>
						<li><a class="adminSemititle" href="${ path }/admin/member/admin_viewReportMember">신고관리</a></li>
						<li><a class="adminSemititle" href="${ path }/admin/board/viewQna">고객센터관리</a>
						<li><a class="adminSemititle" href="${ path }/admin/review/viewReview">후기게시판관리</a></li>
					</ul>
					</div>
			</div>
		</c:if>
	<!-- ----------------------------------------------------------------------------- -->

	<header>
		<!-- 로고 이미지 삽입 -->
	      <a href="${path}/"> <img class="logo"
	         src="${path}/resources/images/greenLogo.png" />
	      </a>
	      
	    <!-- 초록색 선 (로고 아래) -->
	      <hr id="greenLine" style="margin-top:200px; background-color:rgba(26, 252, 26); height:2px;">
		
		
		<div class="menu">
			<div class="col">
			<ul class="maintab">
				<li><a class="semititle" href="${path}/introduce/introduce">소개</a>
					<ul class="detailtab">
						<li><a class="submenu" href="${path}/introduce/introduce">작전 소개</a></li>
                        <li><a class="submenu" href="${path}/introduce/developer">개발자 소개</a></li>
					</ul></li>

				<li><a class="semititle" href="${path}/challenge/recruitList">챌린지</a>
					<ul class="detailtab">
						<li><a class="submenu" href="${path}/challenge/challengeRegister">챌린지 등록</a></li>
						<li><a class="submenu" href="${path}/challenge/recruitList">챌린지 목록</a></li>	
					</ul></li>

				<li><a class="semititle" href="${path}/board/boardList">고객센터</a>
					<ul class="detailtab">
					</ul></li>

				<li><a class="semititle" href="${path}/review/reviewList">후기게시판</a>
					<ul class="detailtab">
					</ul></li>
			</ul>
			</div>
		</div>
		
		<div class="menu2">
			<div class="col">
			<ul class="maintab">
				<li class="btnHBG header_li">
					<a href="#"><i class="fa fa-bars" aria-hidden="true"></i></a>
				</li>
				<c:if test="${ loginMember == null }">
				<li>
					<a href="${path}/member/enrollCheck"><img class="pageTitle"
						src="${path}/resources/images/signinButton.png"/>
					</a>
				</li>
				<li>
					<a href="${path}/member/login"><img class="pageTitle"
						src="${path}/resources/images/loginButton.png"/>
					</a>
				</li>
				</c:if>
			</ul>
			</div>
		</div>
			
			
			
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
						<input type="button" id="loginSubmit" onclick="location.href='${ path }/member/login'" value="로그인"/>
						<br><br><br><br><br>
					    <input type="button" id="loginList"  onclick="#" value="후기"/><br><br>
						<input type="button" id="loginList"  onclick="#" value="인증샷"/><br><br>
						<input type="button" id="loginList"  onclick="#" value="고객센터"/>
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
							<th class="success" onclick="location.href='${path}/challenge/successList'">완료</th>
							<th class="success" onclick="location.href='${path}/challenge/myCreateList'">개설</th>
							<tr class="success">
								<!-- 로그인 POST 요청에서 구한 유저의 업적을 출력 -->
								<c:forEach var="achieveCount" items="${ achievements }">
									<td><c:out value="${ achieveCount }"/></td>
								</c:forEach>
							</tr>
						</table>
						<br><br>
						<input type="button" id="loginList" onclick="location.href='${path}/challenge/zzimList'" value="찜" style="position: relative; z-index: 2;"/>
						<br><br><br>
						<table style="width: 300px; height: 100px; margin:auto; text-align: left;">
							<tr>
								<td style="color:#8FBC8F">보유 포인트</td>
								<th style="width: 100px">${ loginMember.point }</th>
							</tr>
						</table>
						
						<table style="width: 300px; margin:auto; text-align: left;">
							<tr>
								<td style="color:#8FBC8F" id="gallery" class="gallery"><a href="#" id="level" class="level">등급</a></td>
								<th style="width: 100px">${ loginMember.gradeName }</th>
							</tr>
						</table>
						<div class="modal">
						    <img src="${path}/resources/images/point/tbLevel.JPG" id="gallery_img" class="gallery_img" style="margin-top: 150px;" title="클릭하면 사라집니다">
						</div>
						<br><br>
						<button style="background-color: #FFFFFF; border-radius: 20px; border : 0; box-shadow: 5px 5px 5px gray;cursor:pointer; " onclick="location.replace('${path}/member/logout')">로그아웃</button>
					</c:if>
				</div>
			</div>
	</header>
</body>
	