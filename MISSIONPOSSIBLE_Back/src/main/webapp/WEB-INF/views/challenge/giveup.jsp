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
		/* 전체 영역--------------------------------------------------------------------------*/
				
			/*---------------제일 바깥 영역 설정-----------------*/
			#box{ 
			   background-color:none;
			   width:100%;
			   height:auto; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
			   margin-top:50px;
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
    	#subHeaderContainer .subHeaderImg{width:300px; height:70px; float:left;position:relative;left:-35px;}
    	#subHeaderContainer .funcArea .btn{width:100px; height:30px; float:right; margin:20px 20px 0px 0px;}
    	
    	#challengeGiveupCont table{
    		width:100%; height:400px; margin:0 auto;
    	}
    	.submitArea{width:150px; height:30px; margin:20px auto;}
    	.btnSubmit{width:150px; height:30px; font-size:0.9em;border:1px solid lightgray;}
    	
    	td,th,caption{font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;font-size:13px;color:#666;letter-spacing:0px}
    	
		/* table */
		table.table01 {border-collapse:separate;border-spacing:0;line-height:1.5;border-top:1px solid #ccc;border-left:1px solid #ccc;margin:auto;}
		table.table01 th {padding: 10px;font-weight: bold;vertical-align: middle;text-align:center;border-right:1px solid #ccc;border-bottom:1px solid #ccc;border-top:1px solid #fff;border-left:1px solid #fff;background:#eee;}
		table.table01 td {padding:10px;vertical-align:middle;border-right:1px solid #ccc;border-bottom:1px solid #ccc;}
    	input[type="text"]{font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;font-size:12px;color:#666;padding-left:3px;border:1px solid #ABADB3;width:250px;height:25px;}
    	select{font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;font-size:12px;color:#666;vertical-align:middle;border:none}
    	
    	/* select_style */
		.selbox{*margin-top:2px;height:28px;*height:18px;padding:3px 4px 4px 3px;border:solid 1px #abadb3;vertical-align:middle}
    	
	</style>
</head>
<body>
	<div id="box">
	<section id="section">
	<div id="conbox">

	
		
			<div id="subHeaderContainer">
				<div class="subHeaderImg test">
					<img alt="" src="${path}/resources/images/pageTitle/챌린지포기신청.png">
				</div>
			</div>
			<div id="challengeGiveupCont">
				<form action="${ path }/challenge/giveup" method="POST" class="" id="giveupRequest">
					<table>
						<colgroup>
							<col width="50%">
							<col width="*">
						</colgroup>
						<tbody>
						<tr>
							<td colspan="2" style="text-align:center;font-size:0.9em;line-height:2;">
								<p>
									<span style="font-size:1.3em;font-weight:bold">더 좋은 서비스를 제공하기 위해 피드백을 남겨주시면 감사하겠습니다.</span><br>
									<span style="font-size:0.8em;">하단 입력란에 탈퇴할 챌린지의 이름을 띄어쓰기, 기호 포함 <b>"완벽 일치"</b>하게 기입해주세요.</span>
								</p>
							</td>
						</tr>
						<tr>
							<th>포기 사유</th>
							<td>
								<c:set var="giveupArray" 
									value="${ fn:split('챌린지에 대한 불만족/챌린지 수행 시간 부족/챌린지에 대한 동기부여 및 자존감 하락/건강상의 이유/더 이상 챌린지가 필요하지 않음/기타', '/') }"
								/>
								<select id="giveupReason" class="selbox" name="giveupReason">
									<c:forEach var="item" items="${giveupArray}" varStatus="reason">
										<option value="${ item }">${ reason.count }. ${ item }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<th>
								챌린지 이름
							</th>
							<td>
								[<c:out value="${ cTitle }"/>]
							</td>
						</tr>
						<tr>
							<th>
								챌린지 이름 입력
							</th>
							<td>
								<input type="hidden" name="cNo" value="${ cNo }"/>
								<input type="hidden" name="cTitle" value="${ cTitle }"/>
								<input type="hidden" name="id" value="${ loginMember.id }"/>
								<input type="text" name="inputTitle" placeholder="챌린지 이름을 입력하시오."/>
							</td>
						</tr>
						</tbody>
					</table>
					<div class="submitArea">
						<input type="submit" class="btnSubmit" value="포기 신청하기"/>
					</div>
				</form>
			</div>
	</div>
	</section>
	</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%> 