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
		/* ---------------제일 바깥 영역 설정----------------- */
		#box {
			background-color: none;
			width: 100%;
			height: auto; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
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
		/* ----------------------------------------------- */

/* 이미지 위치 */
		.pageTitle{
			margin-left : 280px;
		}



</style>
<head>
<meta charset="UTF-8">
</head>

<body>
	<div id="box">
		<section id="section">
			<div id="conbox">

					<a><img class="pageTitle"
					src="${path}/resources/images/소개.png"/>
					</a>
					
			</div>
		</section>
	</div>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>