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
	height: 1200px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
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

/*---------------------------------이미지 영역--------------------------------------------------*/
.img1 {
	position: absolute;
	padding-left: 10%;
	padding-top: 0px;
}

.img2 {
	position: absolute;
	padding-left: 40%;
	padding-top: 0px;
}

.img3 {
	position: absolute;
	padding-left: 70%;
	padding-top: 0px;
}

.img4 {
	position: absolute;
	padding-left: 10%;
	padding-top: 600px;
}

.img5 {
	position: absolute;
	padding-left: 40%;
	padding-top: 600px;
}

.img6 {
	position: absolute;
	padding-left: 70%;
	padding-top: 600px;
}
/*---------------------------------------------개발자소개 영역---------------------------------*/
.nameTitle {
	font-size: 20pt;
	font-weight: bold;
	color: black;
	text-align: center;
}

.Title {
	color: black;
	width: 100px;
	line-height: 150%;
	font-size: 14pt;
	text-align: left;
	display: inline-block;
}

.sign {
	color: black;
	width: 200px;
	line-height: 150%;
	font-size: 14pt;
	text-align: center;
	padding-right: 10px;
}

.text {
	color: black;
	width: 200px;
	line-height: 150%;
	font-size: 14pt;
	text-align: left;
	display: inline-block;
}
</style>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div id="box">
		<section id="section">
			<div id="conbox">
				<table>
	<!-------------------- 첫번째 줄 ---------------------------->
					<tr>
						<td>
							<div class="img1">
								<img src="${path}/resources/images/Lee.png" style="float: left;"
									width="300px" height="300px" />
								<div class="lee">
									<p class="nameTitle">이지은</p>
									<span class="Title">Introduce</span>
									<span class="sign">|</span>
									<span class="text">(본인소개 1줄 소개)</span> <br>
									<span class="Title">Role</span>
									<span class="sign">|</span>
									<span class="text">(우선 빈칸으로)</span> <br>
									<span class="Title">Email</span>
									<span class="sign">|</span>
									<span class="text">x931112@naver.com</span>
							 </div>
						</div>
				   </td>
					    <td>
							<div class="img2">
								<img src="${path}/resources/images/Son.jpg"
									style="display: block; margin: 0 auto;" width="300px"
									height="300px" />
								<div class="Son">
									<p class="nameTitle">손현종</p>
									<span class="Title">Introduce</span>
									<span class="sign">|</span>
									<span class="text">(본인소개 1줄 소개)</span> <br> 
									<span class="Title">Role</span>
									<span class="sign">|</span>
									<span class="text">(우선 빈칸으로)</span> <br>
									<span class="Title">Email</span>
									<span class="sign">|</span>
									<span class="text">x931112@naver.com</span>
							</div>
						</div>
					</td>
						<td>
							<div class="img3">
								<img src="${path}/resources/images/Pyeon.png"
									style="float: right; margin: 0 auto;" width="300px"
									height="300px" />
								<div class="Pyeon">
									<p class="nameTitle">편준장</p>
									<span class="Title">Introduce</span>
									<span class="sign">|</span>
									<span class="text">(본인소개 1줄 소개)</span> <br> 
									<span class="Title">Role</span>
									<span class="sign">|</span>
									<span class="text">(우선 빈칸으로)</span> <br>
									<span class="Title">Email</span>
									<span class="sign">|</span>
									<span class="text">x931112@naver.com</span>
								</div>
							</div>
						</td>
					</tr>
    <!-------------------- 두번째 줄 ---------------------------->
					<tr>
						<td>
							<div class="img4">
								<img src="${path}/resources/images/Cho.png" style="float: left;"
									width="300px" height="300px" />
								<div class="Cho">
									<p class="nameTitle">조민형</p>
									<span class="Title">Introduce</span>
									<span class="sign">|</span>
									<span class="text">(본인소개 1줄 소개)</span> <br>
									<span class="Title">Role</span>
									<span class="sign">|</span>
									<span class="text">(우선 빈칸으로)</span> <br>
									<span class="Title">Email</span>
									<span class="sign">|</span>
									<span class="text">x931112@naver.com</span>
							 </div>
						</div>
					</td>
						<td>
							<div class="img5">
								<img src="${path}/resources/images/Choi.jpg"
									style="display: block; margin: 0 auto;" width="300px"
									height="300px" />
								<div class="Choi">
									<p class="nameTitle">최혜정</p>
									<span class="Title">Introduce</span>
									<span class="sign">|</span>
									<span class="text">(본인소개 1줄 소개)</span> <br> 
									<span class="Title">Role</span>
									<span class="sign">|</span>
									<span class="text">(우선 빈칸으로)</span> <br>
									<span class="Title">Email</span>
									<span class="sign">|</span>
									<span class="text">x931112@naver.com</span>
							  </div>
						 </div>
					 </td>
						 <td>
							<div class="img6">
								<img src="${path}/resources/images/Park.png"
									style="float: right;" width="300px" height="300px" />
								<div class="Park">
									<p class="nameTitle">박진영</p>
									<span class="Title">Introduce</span>
									<span class="sign">|</span>
									<span class="text">(본인소개 1줄 소개)</span> <br>
									<span class="Title">Role</span>
									<span class="sign">|</span>
									<span class="text">(우선 빈칸으로)</span> <br>
									<span class="Title">Email</span>
									<span class="sign">|</span>
									<span class="text">x931112@naver.com</span>
								</div>
							</div>
					    </tr>
				 </table>
			  </div>
		</section>
	</div>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>