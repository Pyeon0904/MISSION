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
	background-color: rgb(224, 239, 132);
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

/*-----------------------------------------------------------------------------------*/
.img1{
position: absolute;
  padding-left: 10%;
  padding-top: 0px;
}
.img2{
position: absolute;
   padding-left: 40%;
  padding-top: 0px;
}
.img3{
position: absolute;
   padding-left: 70%;
  padding-top: 0px;
}
.img4{
position: absolute;
   padding-left: 10%;
  padding-top: 600px;
}
.img5{
position: absolute;
  padding-left: 40%;
  padding-top: 600px;
}
.img6{
position: absolute;
   padding-left: 70%;
  padding-top: 600px;
}
.nameTitle{
color: black;
	line-height: 2em;
	font-size: 13pt;
	font-weight: 100;
	color: black;
	text-align: center;
}
.nameTitle span{
font-size: 20pt;
	font-weight: bold;
	color: black;
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
				<!-- 첫번째 줄 -->
					<tr>
					<td>
					<div class="img1">
				<img src="${path}/resources/images/Lee.png" 
				style="float: left;" width="300px" height="300px"/>
				<p class="nameTitle"><span>이지은</span>
				<br>개발자 소개 테스트 테스트 테스트 테스트 
				<br>두번째줄</p>
				
				</div>
					</td>
					<td>
						<div class="img2">
				<img src="${path}/resources/images/son.jpg" 
				style="display: block; margin:0 auto;" width="300px" height="300px"/>
				<p class="nameTitle"><span>손현종</span>
				<br>개발자 소개 테스트 테스트 테스트 테스트 
				<br>두번째줄</p>
				</div>
					</td>
					<td>
						<div class="img3"> 
				<img src="${path}/resources/images/Pyeon.png" 
				style="float: right;" width="300px" height="300px"/>
				<p class="nameTitle"><span>편준장</span>
				<br>개발자 소개 테스트 테스트 테스트 테스트 
				<br>두번째줄</p>
				</div>
					</td>
					</tr>
					<!-- 두번째 줄 -->
					<tr>
					<td>
						<div class="img4">
				<img src="${path}/resources/images/Cho.png" 
				style="display: block; margin:0 auto;" width="300px" height="300px"/>
				<p class="nameTitle"><span>조민형</span>
				<br>개발자 소개 테스트 테스트 테스트 테스트 
				<br>두번째줄</p>
				</div>
					</td>
					<td>
				<div class="img5">
				<img src="${path}/resources/images/choi.jpg" 
				style="display: block; margin:0 auto;" width="300px" height="300px"/>
				<p class="nameTitle"><span>최혜정</span>
				<br>개발자 소개 테스트 테스트 테스트 테스트 
				<br>두번째줄</p>
				</div>
					</td>
					<td>
						<div class="img6">
				<img src="${path}/resources/images/Park.png" 
				style="display: block; margin:0 auto;" width="300px" height="300px"/>
				<p class="nameTitle"><span>박진영</span>
				<br>개발자 소개 테스트 테스트 테스트 테스트 
				<br>두번째줄</p>
				</div>
					</td>
					</tr>
				</table>
			</div>
		</section>
	</div>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>