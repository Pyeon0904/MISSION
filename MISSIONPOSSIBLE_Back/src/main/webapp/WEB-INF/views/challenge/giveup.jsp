<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../common/header.jsp"%> 
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>challengGiveup</title>
	<!-- 아이콘 라이브러리 link -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<!-- 제이쿼리 import -->
	<script src="${path}/js/jquery-3.6.0.min.js"></script>

	<style>
		/* 전체 영역-------------------------------------------------------------------------*/
				
			/*---------------제일 바깥 영역 설정-----------------*/
			#box{ 
			   background-color:rgb(224, 239, 132);
			   width:100%;
			   height:800px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
			   margin-top:330px;
			   margin-bottom:100px;
			   margin-left:-10px;
			   padding:10px;
			}
			/*-------------------컨텐츠 영역---------------------*/
			#conbox{
				width:800px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/
				position:relative; 
				top:20px;
				margin:auto;
			}
			    
		/*-----------------------------------------------------------------------------------*/
			
	
		*{margin:0; padding:0;}
		
		#subHeaderContainer{width:100%; height:70px;}
    	#subHeaderContainer h2{float:left; margin-top:20px;}
    	#subHeaderContainer .funcArea .btn{width:100px; height:30px; float:right; margin:20px 20px 0px 0px;}
    	
    	#challengeGiveupCont table{
    		width:85%; height:400px; margin:0 auto;
    	}
    	.submitArea{width:150px; height:50px; margin:0 auto;}
    	.btnSubmit{width:150px; height:50px; font-size:1.2em;}
    	
    	
	</style>
</head>
<body>
	<div id="box">
	<section id="section">
	<div id="conbox">

	
		
			<div id="subHeaderContainer">
				<h2>챌린지 포기 신청</h2>
			</div>
			<div id="challengeGiveupCont">
				<form action="#" method="POST" class="" id="giveupRequest">
					<table>
						<tr>
							<td colspan="2">
								<p>
									어떠한 사정이 있으신가요? 피드백을 남겨주시면 앞으로 더 좋은 서비스를 제공하기 위해 더 노력하겠습니다.<br>
									탈퇴할 챌린지의 이름을 띄어쓰기, 기호 포함 <span id="strong">"완벽 일치"</span>하게 입력 후 포기 신청바랍니다.
								</p>
							</td>
						</tr>
						<tr>
							<td>포기 사유</td>
							<td>
								<c:set var="giveupArray" 
									value="${ fn:split('챌린지에 대한 불만족/챌린지 수행 시간 부족/챌린지에 대한 동기부여 및 자존감 하락/건강상의 이유/기타', '/') }"
								/>
								<select id="giveupReason" name="giveupReason">
									<c:forEach var="item" items="${giveupArray}" varStatus="reason">
										<option value="${ item }">${ reason.count }. ${ item }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>
								챌린지 이름
							</td>
							<td>
								"[챌린지 이름]"
							</td>
						</tr>
						<tr>
							<td>
								챌린지 이름 입력
							</td>
							<td>
								<input type="text" name="inputTitle" placeholder="챌린지 이름을 입력하시오."/>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<div class="submitArea">
									<input type="submit" class="btnSubmit" value="포기 신청하기"/>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
	</div>
	</section>
	</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%> 