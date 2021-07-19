<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath }" />
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<!DOCTYPE html>
<html>
<style>
/* 전체 영역--------------------------------------------------------------------------*/

/*---------------제일 바깥 영역 설정-----------------*/
#box {
	background-color: none;
	width: 100%;
	height: 1800px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
	margin-top: 100px;
	margin-bottom: 100px;
	margin-left: -10px;
	padding: 10px;
}
/*-------------------컨텐츠 영역---------------------*/
#conbox {
	width: 1600px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/
	position: relative;
	top: 20px;
	margin: auto;
}

/*-----------------------------------------------------------------------------------*/

/*---------------------------팀명 소개---------------------------*/


.teamTitle {
	font-family: 'GmarketSansMedium';
	color: black;
	font-size: 30pt;
	font-weight: bold;
	position: absolute;
	left: 20%;
}

.teamline {
	border-left: 3px solid grey;
	height: 450px;
	position: absolute;
	left: 27%;
	top: 0;
}

.content {
	width: 450px;
	height: 800px;
	padding-top: 30px;
	padding-bottom: 10px;
	position: absolute;
	left: 30%;
	vertical-align: top;
}
/*----------------------폰트--------------------------*/
.teamcontent {
	color: black;
	line-height: 1.5em;
	padding-right: 17px;
	font-size: 20pt;
	font-weight: 100;
}

.teamcontent span {
	font-size: 20pt;
	font-weight: bold;
	color: black;
}
/*---------------------------프로젝트명 소개---------------------------*/


.proTitle {
	font-family: 'GmarketSansMedium';
	color: black;
	width : 300px;
	font-size: 30pt;
	font-weight: bold;
	position: absolute;
	right: 15%; 
	top: 750px;
}

.proline {
	border-left: 3px solid grey;
	height: 450px;
	position: absolute;
	right: -10%;
	top: 550px;
}

.content2 {
	width: 500px;
	height: 800px;
	padding-top: 550px;
	padding-bottom: 200px;
	position: absolute;
	left: 29%;
	top: 200px;
}
/*----------------------폰트--------------------------*/
.procontent {
	color: black;
	line-height: 1.5em;
	padding-right: 17px;
	font-size: 20pt;
	font-weight: 100;
	color: black;
}

.procontent span {
	font-size: 20pt;
	font-weight: bold;
	color: black;
}
.lastimg{
    padding-top: 1200px;	
}
</style>
<head>
<meta charset="UTF-8">
</head>
<body>
	<!-- 팀명 404에러 -->
	<div id="box">
		<section id="section">
			<div id="conbox">
				<div id="intro">
					<table class="teamName">
						<tr>
							<td><p class="teamTitle">
									404<br>에러<br>
								</p>
								<p class=teamline></p></td>
						</tr>
						<tr>
							<td class="content">
								<p class="teamcontent">
									&nbsp;&nbsp;<span>404에러</span>는<br> &nbsp;&nbsp;사이트를 만들며 <span>미래를
										위해</span> 끊임없이 공부하는 사람들이라는 의미를 담아두고있다. <br>
									<br> &nbsp;&nbsp;<span>404에러</span>의 의미<br>
									<span>社(모일 사)恐(두려울 공)思(생각할 사)碍(거리낄 애)勵(힘쓸 려)</span>
                                     프로젝트를 진행하면서 발생하는 어떠한 장애 에러도 함께 모여서 생각하며 힘쓰면 두려울 것이 없다
								</p>
							</td>
						</tr>
					</table>
				</div>
								
<!-- 프로젝트명 작전 -->
				<div id="intro2">
					<table class="proName">
						<tr>
							<td rowspan="2"></td>
						</tr>
						<tr>
							<td class="content2">
								<p class="procontent">
									&nbsp;&nbsp;<span>작전</span>는<br> &nbsp;&nbsp;작심(作心) 
									: 마음을 단단히 먹음 + 이심전심(以心傳心) : 마음과 마음이 서로 뜻이 통함
                                      = 작심전심(作心傳心) : 마음먹은 일을 뜻이 맞는 사람과 함께 한다 <br>
                                      
									<br> <span>작심(作心) : 마음을 단단히 먹음 + 이심전심(以心傳心) 
									: 마음과 마음이 서로 뜻이 통함 = 작심전심(作心傳心) : 마음먹은 일을 뜻이 맞는 사람과 함께 한다</span>
								</p>
							
									<p class=proline></p>
							</td>
								<td><p class="proTitle">작전<br>作心<br></p></td>
						</tr>
					</table>
				</div>
				<div class="lastimg">
				<img src="${path}/resources/images/flower1.png" 
				style="display: block; margin:0 auto;" width="1000px" height="578px"/>
				</div>
			</div>
		</section>
	</div>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>