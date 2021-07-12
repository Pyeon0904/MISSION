<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../common/header.jsp"%> 

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!-- D-Day 로직 구현한 파일 include -->
<%@ include file="date.jsp" %>		

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>challengeRecruit</title>
	<!-- 아이콘 라이브러리 link -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<!-- 제이쿼리 import -->
	<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>

	<style>
	
	/* 전체 영역--------------------------------------------------------------------------*/
            
         /*---------------제일 바깥 영역 설정-----------------*/
         #box{ 
            background-color:rgb(224, 239, 132);
            width:100%;
            height:1300px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
            margin-top:330px;
            margin-bottom:100px;
            margin-left:-10px;
            padding:10px;
         }
         /*-------------------컨텐츠 영역---------------------*/
         #conbox{
            width:1200px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/
            position:relative; 
            top:20px;
            margin:0 auto;
            background-color:rgb(255, 255, 255, 0.5);
         }
             
      /*-----------------------------------------------------------------------------------*/
		
		#subHeaderContainer{width:100%; height:70px;}
    	#subHeaderContainer h2{float:left; margin-top:20px;}
    	#subHeaderContainer .funcArea .btn{width:100px; height:30px; float:right; margin:20px 20px 0px 0px;}
    	
    	#challengeContTable table{
    		width:85%; height:1013px; margin:0 auto;
    	}
    	
    	#challengeContTable table tr:nth-child(-n+9){
    		height:50px;
    	}
    	
    	#challengeContTable table tr:nth-child(n+2):nth-child(-n+9) td:nth-child(1){
    		width:200px;
    	}
    	
    	
	</style>
</head>
<body>
	<div id="box">
	<section id="section">
	<div id="conbox">

	
			<div id="subHeaderContainer">
			
			<!-- 모집중인 챌린지 조회 상태일 때의 뷰페이지 SubHeader -->
			<c:if test="${ (todayNum < startNum) and (todayNum < endNum) }">
			
				<h2>모집중인 챌린지 정보</h2>
				<div class="funcArea">
					<!-- 참가신청 버튼 클릭시 addMyChallengeList.do로 참가신청을 의미하는 값과 해당 게시물의 No값을 넘긴다. -->
					<form action="${ path }/challenge/saveMyChallengeList.do" method="GET" class="" id="challengeJoinForm">
						<input type="hidden" name="myStatus" value="JOIN" />
						<input type="hidden" name="myChallengeNo" value="${ challenge.challengeNo }"/>
						<input class="btn btnJoin" type="button" value="참가신청"/>
					</form>
					<script>
					$(document).ready(()=>{	
						$("#challengeJoinForm").on("click",function(event){
							if(confirm("해당 챌린지에 참여하시겠습니까?")){
								$("#challengeJoinForm").submit();
							} 
							else {
								alert("취소되었습니다.");
							}
						});
					});
					</script>
					
					<!-- 찜하기 버튼 클릭시 addMyChallengeList.do로 찜하기 의미하는 값과 해당 게시물의 No값을 넘긴다. -->
					<form action="${ path }/challenge/saveMyChallengeList.do" method="GET" class="" id="challengeZzimForm">
						<input type="hidden" name="myStatus" value="ZZIM" />
						<input type="hidden" name="myChallengeNo" value="${ challenge.challengeNo }"/>
						<input class="btn btnZzim" type="button" value="찜하기"/>
					</form>
					<script>

					$(document).ready(()=>{	
						$("#challengeZzimForm").on("click",function(event){
							if(confirm("해당 챌린지를 찜하시겠습니까?")){
								$("#challengeZzimForm").submit();
							}
							else{
								alert("요청이 취소되었습니다.");
							}
						});
					});
					</script>
					<form action="${ path }/challenge/recruitList" method="GET" class="" id="challengeListForm">
						<input type="hidden" name="" value="" />
						<input class="btn btnList" type="submit" value="목록으로"/>
					</form>
				</div>
				
			</c:if>
			
			<!-- 종료된 챌린지 조회 상태일 때의 뷰페이지 SubHeader -->
			<c:if test="${ (todayNum >= startNum) and (todayNum >= endNum) }">
			
				<h2>종료된 챌린지 정보</h2>
				<div class="funcArea">
					<form action="${ path }/challenge/endList" method="GET" class="" id="challengeListForm">
						<input type="hidden" name="" value="" />
						<input class="btn btnList" type="submit" value="목록으로"/>
					</form>
				</div>
				
			</c:if>
			
			</div>
			
			<div id="challengeContTable">
				<table id="detailContInfo">
					<tr>
						<!-- 챌린지 제목 단 -->
						<td colspan="2">													
																						
							<!-- 
								챌린지 시작일에서 오늘 날짜를 뺌 D-Day 완성! 
							-->
							
							<!-- 모집중인 챌린지 조회 상태일 때의 D-Day 부분-->
							<c:if test="${ (todayNum < startNum) and (todayNum < endNum) }">
								<span style="font-size:1.2em;">
									D-<c:out value="${ startNum - todayNum }"></c:out>&nbsp;
								</span>
							</c:if>
							
							<!-- 종료된 챌린지 조회 상태일 때의 D-Day 부분 -->
							<c:if test="${ (todayNum > startNum) and (todayNum > endNum) }">
								<span style="font-size:1.2em;">
									[챌린지종료]
								</span>
							</c:if>
							
							<c:if test="${ challenge.attendStatus == 'PUBLIC' }">
								<span style="font-size:1.2em;">[단체]</span>
							</c:if>
							<c:if test="${ challenge.attendStatus == 'PRIVATE' }">
								<span style="font-size:1.2em;">[개인]</span>
							</c:if>
							
							<!-- 카테고리 이름 출력 부분-->
							<span style="font-size:1.2em;">
								[<c:out value="${ challenge.categoryName }"/>]
							</span>
							
							<!-- 챌린지 제목 출력 부분 -->
							<span style="font-size:1.2em;">
								&nbsp;<c:out value="${ challenge.title }"/>
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>등록일</span>
						</td>
						<td>
							<fmt:formatDate var="regDate" value="${ challenge.createDate }" pattern="yyyy-MM-dd"/>
							<span>
								<c:out value="${ regDate }"/>
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>모집기간</span>
						</td>
						<td>
							<fmt:formatDate var="recruitEnd" value="${ challenge.startDate }" pattern="yyyy-MM-dd"/>
							<span>
								<c:out value="${ recruitEnd }"/>까지
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>진행기간</span>
						</td>
						<td>
							<fmt:formatDate var="clgEnd" value="${ challenge.deadline }" pattern="yyyy-MM-dd"/>
							<span>
								<c:out value="${ clgEnd }"/>까지
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>모집 인원</span>
						</td>
						<td>
							<span>
								<c:if test="${ challenge.maxCount != 9999 }">
									<c:out value="${ challenge.maxCount }"/>명
								</c:if>
								<c:if test="${ challenge.maxCount == 9999 }">
									제한 없음
								</c:if>
								
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>참여시 차감 포인트</span>
						</td>
						<td>
							<span>
								<c:out value="${ challenge.minusPoint }"/>P
							</span>
						</td>
					</tr>
					<tr>
						<td>
							<span>오픈 카톡 링크</span>
						</td>
						<td>
							<span>
								<c:out value="${ challenge.opentalkLink }"/>
							</span>
						</td>
					</tr>
					<tr>
						<!-- 챌린지 상세 설명(Content) -->
						<td colspan="2">
							<p>
								<c:out value="${ challenge.content }"/><br>
								⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢠⣴⣾⣿⣶⣶⣆⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀<br>
								⢀⢀⢀⣀⢀⣤⢀⢀⡀⢀⣿⣿⣿⣿⣷⣿⣿⡇⢀⢀⢀⢀⣤⣀⢀⢀⢀⢀⢀<br>
								⢀⢀ ⣶⢻⣧⣿⣿⠇ ⢸⣿⣿⣿⣷⣿⣿⣿⣷⢀⢀⢀⣾⡟⣿⡷⢀⢀⢀⢀<br>
								⢀⢀⠈⠳⣿⣾⣿⣿⢀⠈⢿⣿⣿⣷⣿⣿⣿⣿⢀⢀⢀⣿⣿⣿⠇⢀⢀⢀⢀<br>
								⢀⢀⢀⢀⢿⣿⣿⣿⣤⡶⠺⣿⣿⣿⣷⣿⣿⣿⢄⣤⣼⣿⣿⡏⢀⢀⢀⢀⢀<br>
								⢀⢀⢀⢀⣼⣿⣿⣿⠟⢀⢀⠹⣿⣿⣿⣷⣿⣿⣎⠙⢿⣿⣿⣷⣤⣀⡀⢀⢀<br>
								⢀⢀⢀ ⢸⣿⣿⣿⡿⢀⢀⣤⣿⣿⣿⣷⣿⣿⣿⣄⠈⢿⣿⣿⣷⣿⣿⣷⡀⢀<br>
								⢀⢀⢀⣿⣿⣿⣿⣷⣀⣀⣠⣿⣿⣿⣿⣷⣿⣷⣿⣿⣷⣾⣿⣿⣿⣷⣿⣿⣿⣆<br>
								⣿⣿⠛⠋⠉⠉⢻⣿⣿⣿⣿⡇⡀⠘⣿⣿⣿⣷⣿⣿⣿⠛⠻⢿⣿⣿⣿⣿⣷⣦<br>
								⣿⣿⣧⡀⠿⠇⣰⣿⡟⠉⠉⢻⡆⠈⠟⠛⣿⣿⣿⣯⡉⢁⣀⣈⣉⣽⣿⣿⣿⣷<br>
								⡿⠛⠛⠒⠚⠛⠉⢻⡇⠘⠃⢸⡇⢀⣤⣾⠋⢉⠻⠏⢹⠁⢤⡀⢉⡟⠉⡙⠏⣹<br>
								⣿⣦⣶⣶⢀⣿⣿⣿⣷⣿⣿⣿⡇⢀⣀⣹⣶⣿⣷⠾⠿⠶⡀⠰⠾⢷⣾⣷⣶⣿<br>
								⣿⣿⣿⣿⣇⣿⣿⣿⣷⣿⣿⣿⣇⣰⣿⣿⣷⣿⣿⣷⣤⣴⣶⣶⣦⣼⣿⣿⣿⣷<br>
							</p>
						</td>
					</tr>
				</table>
			</div>
	</div>
	</section>
	</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%> 