<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.sun.xml.internal.ws.client.RequestContext"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../common/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ㅇㅇ</title>
	<!-- 아이콘 라이브러리 link -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<!-- 제이쿼리 import -->
	<script src="${path}/resources/js/jquery-3.6.0.min.js"></script>
	
	<style>
		/* 
		*{margin:0; padding:0;}
		#wrap{width:1200px; height:auto; margin:0 auto;}
		*/
		/* 전체 영역--------------------------------------------------------------------------*/
            
         /*---------------제일 바깥 영역 설정-----------------*/
         #box{ 
            background-color:rgb(224, 239, 132);
            width:100%;
            /*height:1000px; 높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
            height:auto;
            margin-top:330px;
            margin-bottom:100px;
            margin-left:-10px;
            padding:20px 0 40px 0;
         }
         /*-------------------컨텐츠 영역---------------------*/
         #conbox{
            width:1200px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/
            position:relative; 
            top:20px;
            margin:auto;
         }
             
      /*-----------------------------------------------------------------------------------*/
		
		#subHeaderContainer{width:100%; height:70px; }
    	#subHeaderContainer h2{float:left; margin-top:20px;}
    	#subHeaderContainer .funcArea .btn{width:100px; height:30px; float:right; margin:20px 20px 0px 0px;}
    	
    	#challengeContTable table tr:nth-child(1) #detailCont{
    		width:750px; height:1013px; background-color:rgb(255,255,255,0.5);
    	}
    	#challengeContTable table tr:nth-child(1) #certCalendarArea{
    		width:450px; height:350px; 
    	}
    	#challengeContTable table tr:nth-child(1) #certCalendarArea #calContainer{
    		width:400px; height:300px; margin:0 auto;
    	}
    	#challengeContTable table tr:nth-child(1) #certCalendarArea #calContainer .calTable #yyyymmArea {
    		width:150px; height:20px; margin: 0 auto;
    	}
    	#challengeContTable table tr:nth-child(2) #progressBarArea{
    		width:450px; height:150px;
    	}
    	#challengeContTable table tr:nth-child(2) #progressBarArea #barContainer{
    		width:400px; height:100px; margin:0 auto;
    	}
    	#challengeContTable table tr:nth-child(2) #progressBarArea #barContainer h4{margin:0 0 20px 0px;}
    	#challengeContTable table tr:nth-child(2) #progressBarArea #barContainer .barEmpty{
    		width:400px; height:10px; 
    		border:1px solid gray; border-radius:5px;
    		margin:0 auto; background-color:#f0f0f0;
    	}
    	#challengeContTable table tr:nth-child(2) #progressBarArea #barContainer .barEmpty .barGreen{
    		height:100%; background-color:lime; border-radius:5px;
    	}
    	#challengeContTable table tr:nth-child(2) #progressBarArea #barContainer .progStatus{
    		float:right;
    	}
    	#challengeContTable table tr:nth-child(3) #memberCertList{
    		width:450px; height:513px;
    	}
    	#challengeContTable table tr:nth-child(3) #memberCertList h4{
    		margin:10px 0 20px 20px;
    	}
    	
    	.certListCont {width:100%; height:90%; overflow:scroll; overflow-x:hidden;}
    	.certListCont .certListDisplay ul{list-style-type : none; margin-left:25px;}
		.certListCont .certListDisplay ul li .certItemCont {
			width:380px; height:75px; margin-bottom:10px;
		}
		.certListCont .certListDisplay ul li .certItemCont .certItemPhotoBox{
			width:70px; height:70px; float:left;
		}
		.certListCont .certListDisplay ul li .certItemCont .certItemInfoCont{
			width:300px; height:70px; float:left;
		}
		.certListCont .certListDisplay ul li .certItemCont .certItemInfoCont .certItemTitle{
			width:100%; height:20px; font-weight:bold; margin-left:5px;
			overflow:hidden; text-overflow: ellipsis;white-space:nowrap;
		}
		.certListCont .certListDisplay ul li .certItemCont .certItemInfoCont .certItemSubCont{
			width:100%; height:50px; margin-left:5px;
			line-height:1.7;
			overflow:hidden; 
			display: -webkit-box;
	        -webkit-line-clamp: 2;
	        -webkit-box-orient: vertical;
	    }
	</style>
<body>	
	<div id="box">
    	<section id="section">
        	<div id="conbox">
					<div id="subHeaderContainer">
						<h2>참여중인 챌린지 정보</h2>
						<div class="funcArea">
							<form action="${path}/challenge/giveup" method="GET" class="" id="challengeGiveupForm">
								<input type="hidden" name="" value="" />
								<button class="btn btnGiveup" type="submit">포기하기</button>
							</form>
							<button type="button" class="btn btnCertify" 
								onclick="window.open('${ path }/challenge/signPopup?no=${ challenge.challengeNo }','인증팝업','width=500, height=400,scrollbars= 0, toolbar=0, menubar=no')">
								인증하기
							</button>
							<form action="#" method="GET" class="" id="challengeChatForm">
								<input type="hidden" name="" value="" />
								<button class="btn btnChat" type="submit">채팅방 입장</button>
							</form>
						</div>
					</div>

				<div id="challengeContTable">
					<table>
						<tr>
							<td rowspan="3" id="detailCont">
								<table id="detailContInfo">
									<tr>
										<td colspan="2">
											<!-- [개인] / [단체] 상태 출력 -->
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
												<c:out value="${ challenge.title }"/>
											</span>
										</td>
									</tr>
									<tr>
										<td>
											<span>진행 기간</span>
										</td>
										<td>
											<!-- D-Day 로직 구현한 파일 include -->
											<%@ include file="date.jsp" %>
											<!-- 챌린지 수료까지의 D-Day -->
											<span>
												D-<c:out value="${ endNum - todayNum }"/>
											</span>
											<!-- 챌린지 시작일 및 수료일 => Date 포맷으로 변경 -->
											<fmt:formatDate var="clgStart" value="${ challenge.startDate }" pattern="yyyy년 MM월 dd일"/>
											<fmt:formatDate var="clgEnd" value="${ challenge.deadline }" pattern="yyyy년 MM월 dd일"/>
											<span>
												<c:out value="${ clgStart }"/>
												부터&nbsp;
												<c:out value="${ clgEnd }"/>
												까지
											</span>
										</td>
									</tr>
									<tr>
										<td>
											<span>참여 인원</span>
										</td>
										<td>
											<span>
												<c:out value="${ challenge.currentCount }"/>명
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
										<td colspan="2">
											<c:out value="${ challenge.content }"/><br>
										</td>
									</tr>
								</table>
								
							</td>
							<td id="certCalendarArea">
								<div id="calContainer">
									<h4>나의 발자취</h4>
									
									<div class="calTable">
										<%
											// list - 챌린지 인증 날짜 리스트
											List<String> list = (List)session.getAttribute("certDateList");
										
											Calendar cal = Calendar.getInstance();
											int year = request.getParameter("y") == null ? cal.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("y"));
											int month = request.getParameter("m") == null ? cal.get(Calendar.MONTH) : (Integer.parseInt(request.getParameter("m")) - 1);
											int date = cal.get(Calendar.DATE);
											String today = ""; // 오늘 날짜
											
											//오늘날짜 저장하는 로직 0포함
											if(date < 10 && month < 10){
												today = cal.get(Calendar.YEAR)+"-0"+(cal.get(Calendar.MONTH) + 1)+"-0"+date; // 오늘 날짜
											} else if (date >= 10 && month < 10){
												today = cal.get(Calendar.YEAR)+"-0"+(cal.get(Calendar.MONTH) + 1)+"-"+date; // 오늘 날짜
											} else if (date >= 10 && month >= 10) {
												today = cal.get(Calendar.YEAR)+"-"+(cal.get(Calendar.MONTH) + 1)+"-"+date; // 오늘 날짜
											}
											
											// 시작요일 확인
											// - Calendar MONTH는 0-11까지임
											cal.set(year, month, 1);//cal객체에 설정된 년,월을 설정하고, 일은 1일로 설정/시작하는 요일을 나타내기 위함.
											
											//Calendar.DAY_OF_WEEK(요일을 나타냄(일~토(1~7)))
											int bgnWeek = cal.get(Calendar.DAY_OF_WEEK);
											
											//해당 월의 첫날을 구함
											int startDate = cal.getMinimum(Calendar.DATE);
											//해당 월의 마지막 날을 구함
											int endDate = cal.getActualMaximum(Calendar.DATE);
											// 1일의 요일을 구함
											int startDay = cal.get(Calendar.DAY_OF_WEEK);
											int count = 0;
																			
											// 다음/이전월 계산
											// - MONTH 계산시 표기월로 계산하기 때문에 +1을 한 상태에서 계산함
											int prevYear = year;
											int prevMonth = (month + 1) - 1;
											int nextYear = year;
											int nextMonth = (month  + 1) + 1;
																			
											// 1월인 경우 이전년 12월로 지정
											if (prevMonth < 1) {
												prevYear--;
												prevMonth = 12;
											}
																			
											// 12월인 경우 다음년 1월로 지정
											if (nextMonth > 12) {
												nextYear++;
												nextMonth = 1;
											}
											
											pageContext.setAttribute("year", year);
											pageContext.setAttribute("month", month);
											pageContext.setAttribute("date", date);
											pageContext.setAttribute("today", today);
											pageContext.setAttribute("startDate", startDate);
											pageContext.setAttribute("endDate", endDate);
											pageContext.setAttribute("startDay", startDay);
											pageContext.setAttribute("count", count);
										%>
										<!-- 달력 위에 버튼 부분 -->
										<div id="yyyymmArea">
											<a href="?no=${ challenge.challengeNo }&y=<%=prevYear%>&m=<%=prevMonth%>">◁</a>
												<%=year%>년 <%=month+1%>월
											<a href="?no=${ challenge.challengeNo }&y=<%=nextYear%>&m=<%=nextMonth%>">▷</a>
										</div>
										
										
										<table width="400" cellpadding="2" cellspacing="0" border="1" style='text-align:center;'>
											<tr height="30">
												<td style="color:red;"><font size="2">일</font></td>
												<td><font size="2">월</font></td>
										 		<td><font size="2">화</font></td>
										  		<td><font size="2">수</font></td>
										  		<td><font size="2">목</font></td>
										  		<td><font size="2">금</font></td>
										  		<td style="color:blue;"><font size="2">토</font></td>
										 	</tr>
										 	<tr height="30">
											<%
												// 해달 월의 1일 앞 날짜 자리에 빈 칸 삽입
												for (int i=1;i<startDay;i++){
										 			count++;//week가 바뀌면 다음 줄로 이동 시키기 위한 변수(count))
											%>
										    	<td>&nbsp;</td>
											<%
												}//for
												// 1일부터 마지막 날까지 날짜 삽입
												
												
												for (int i=startDate;i<=endDate;i++){
													//오늘의 날짜에 배경을 적용하기 위한 변수(bgcolor) 
													//	- 삼항연산자 통해 해당 날짜가 오늘의 날짜면 배경에 "CCCCCC" 그 외엔 "FFFFFF" 적용
													/*
														###################################################################
															   아래 코드 차용해서 날짜에 인증한 날짜의 상태를 표시하는 로직을 구현해보자!
														###################################################################
														([인증내역날짜의 배열 or List].equals(year+":"+(month+1)+":"+i))? "O" : "X"
																대충 위와 같이 비슷한 느낌으로 구현하면 될 듯?
														---------------------------------------------------------------------
													*/
													
													String compareDate = "";
													
													//2021-7-7 다음과 같이 월과 일 숫자가 2자리가 안되는 경우 값이 넘어올 때,
													//한 자리로만 넘어오기에 2021-07-07처럼 자리수를 맞춰주는 로직
													//오늘날짜 저장하는 로직 (0포함)
													if(i < 10 && month < 10){
														compareDate = year+"-0"+(month+1)+"-0"+i;
													} else if (i >= 10 && month < 10){
														compareDate = year+"-0"+(month+1)+"-"+i;
													} else if (i >= 10 && month >= 10) {
														compareDate = year+"-"+(month+1)+"-"+i;
													}
													
													
										 			String bgcolor = "";
										 			String selectBgcolor = "";
										 			int tempO = 0;
										 			
										 			for(String dateArr : list){
														// 날짜 String 형태는 현재 "yyyy-MM-dd HH:mm:ss.SSS"형태인데
														// "yyyy-MM-dd"만 받아오게끔 구현
														String certDateArr = dateArr.substring(0, 10);
														
														selectBgcolor = "";
														
														// 콘솔 모니터링 위함
														System.out.println("비교 : " + compareDate + " / " + certDateArr);
														
														//=================인증 따라 색 지정 하는 곳 =================
														
														//------비교할 날짜를 INT형태로 변환 시작-------
														SimpleDateFormat in = new SimpleDateFormat("yyyy-MM-dd");
														
														Date compareDateArg = in.parse(compareDate);
														int compareDateNum = Integer.parseInt(String.valueOf((compareDateArg.getTime()/(1000*60*60*24))+""));
														//------비교할 날짜를 INT형태로 변환 끝-------
														
														//------EL 형태로 받아온 todayNum과 startNum을 int형태로 변환
														int todayNum = Integer.parseInt(String.valueOf(request.getAttribute("todayNum")+""));
														int startNum = Integer.parseInt(String.valueOf(request.getAttribute("startNum")+""));
														
														//------색지정 로직------
														if(certDateArr.equals(compareDate)){//-----비교할 날짜가 인증 게시물에 저장된 날짜와 동일하면 작동
															selectBgcolor = "#CECEF6";//파란색(O)
															tempO++;
														} else if((todayNum > compareDateNum) && (startNum <= compareDateNum) 
																&& (!certDateArr.equals(compareDate))){
															//-----비교할 날짜가 인증 게시물에 없고, 오늘의 날짜보다 작고, 챌린지 시작일보다 크면 작동
															if(tempO > 0){
																selectBgcolor = "#CECEF6";//파란색(O)
															} else {
																selectBgcolor = "#F6CED8";//빨간색(X)
															}
										 				} else {
															if((tempO > 0)){
																//반복되는 과정에서 위에서 지정했던 컬러값이 사라지게 되므로 다음과 같이 조건문을 한 번 더 실행해서 값 저장
																selectBgcolor = "#CECEF6";//파란색(O)
															} else {
																// 모든 것에 해당하지 않으면 빈 문자열 리턴
																selectBgcolor = "";
															}
														}
														// 콘솔 모니터링 위함
														System.out.println("O : " + tempO + " | bg : " + selectBgcolor);
														System.out.print("startNum : " + startNum);
														System.out.print(" | todayNum : " + todayNum);
														System.out.println(" | compareDateNum : " + compareDateNum);
										 			}
										 			// 위에 로직에서 받아온 selectBgcolor값을 저장
										 			bgcolor = selectBgcolor;
										 			System.out.println("=========="+i+"========");
										 			
													String color = "";
													
													if(count%7 == 0){//일요일
														color = "red";
													} else if(count%7 == 6){//토요일
														color = "blue";
													} else {//나머지 평일
														color = "black";
													}
													//String color = (count%7 == 0 || count%7 == 6)? "red" : "black";
													
										 			count++;
										 			
										 			pageContext.setAttribute("bgcolor", bgcolor);
										 			pageContext.setAttribute("color", color);
											%>												
										  		<td style="background : ${ pageScope.bgcolor }"><font size="2" color=${ pageScope.color }><%= i %></font></td>
											<%
													// count값을 7로 나눈 나머지 값이 0일 경우
													// (한 줄이 채워졌다면) 
													// AND 그 칸의 날짜가 마지막 날보다 적을 경우
										  			if(count%7 == 0 && i < endDate){
											%>
										 	</tr>
										 	<tr height="30">
											<%
										  			}//if - 줄바꿈
												}//for - 한달의 날짜 채우기 끝
												
												
												// count값을 7로 나눈 나머지 값이 0이 아닌 경우(달력에 날짜 다채웠지만 마지막 줄이 한 줄을 다 못 채웠을 경우)
												// 한 주의 끝까지 빈 칸 삽입
												while(count%7 != 0){
											%>
										    	<td>&nbsp;</td>
											<%
													count++;
										 		}//while
											%>
											</tr> 
										</table>																					
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td id="progressBarArea">
								<div id="barContainer">
									<h4>나의 진행도</h4>
									
									<!-- 챌린지 총 일수와 내가 인증한 일수 값 받아오게끔 하기 -->
									<c:set var="totalDay" value="${ endNum - startNum }"/>
									<c:set var="successDay" value="${ successCount }"/>
									
									<!-- 챌린지 달성률 계산식 -->
									<c:set var="progPercent" value="${(successDay / totalDay) * 100}"/>
									
									<div class="barEmpty">
										<div class="barGreen" style="width:${progPercent}%"></div>
									</div>
									<div class="progStatus">
										<p>${successDay} / ${totalDay}</p>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td id="memberCertList">
								<h4>구성원들의 인증내역</h4>
								<div class="certListCont">
									<!-- 
										현재 참여중인 챌린지의 인증 내역을 보여주는 페이지 INCLUDE
										파라미터는 간단하게 참여중인 챌린지의 CHALLENGE_NO값만 보내줌
										아래 jsp:include 태그의 page속성 빨간줄(오류)은 무시가능! 정상작동함!
									 -->
									<jsp:include page="/challenge/certList">
										<jsp:param name="no" value="${ challenge.challengeNo }"/>
									</jsp:include>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</section>
	</div>
	<c:if test="${ loginMember != null }">
    <jsp:include page="../chat/chatRoom.jsp">
       <jsp:param name="loginMember" value="${ loginMember }"/>
    </jsp:include>
	</c:if>   
</body>
</html>
	
<%@ include file="../common/footer.jsp"%>