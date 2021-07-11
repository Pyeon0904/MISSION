<%@page import="com.missionpossibleback.mvc.challenge.model.service.ChallengeService"%>
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
<title>Insert title here</title>

</head>
<body>
											<%@ include file="date.jsp" %>
											
											<li style="width:25%;">
												<div class="itemCont">
													<div class="itemPhotoBox">
														<c:if test="${ challenge.thumbnailFile == null }">
															<img src="${path}/resources/images/file.png" alt="기본 이미지" width="180px" height="180px"/>
														</c:if>
														<c:if test="${ challenge.thumbnailFile != null }">
															<img src="${path}/resources/upload/challenge/${ challenge.thumbnailFile }" alt="챌린지 썸네일" 
																width="180px" height="180px" onerror="this.src='${path}/resources/images/file.png'"/>
														</c:if>
														<div class="itemShowMenu" onclick="window.parent.location.href='${ path }/challenge/setViewIO.do?no=${ challenge.challengeNo }'">
															<span class="details">상세보기</span>
														</div>
													</div>
													<div class="itemInfoCont">
														<p>
															<span class="itemTitle">
																<c:out value="${ challenge.title }"/>
															</span>
															<br>
															<span class="itemSubCont">챌린지 종료까지</span>
															<br>
															<!-- D-Day 로직 구현한 파일 include -->
															<%@ include file="date.jsp" %>
															
															<!-- 
																챌린지 시작일에서 오늘 날짜를 뺌 D-Day 완성! 
															-->
															<span class="itemProgressStatus">
																D-<c:out value="${ endNum - todayNum }"></c:out>
															</span>
														</p>
														 
														<div id="barContainer">
															<p>나의 진행도</p>
															<c:set var="totalDay" value="${ endNum - startNum }"/>
															
															<c:set var="successDay" value="${ successCount[tempNum] }"/>
															
															<c:set var="progPercent" value="${(successDay / totalDay) * 100}"/>
																
															<div class="barEmpty">
																<div class="barGreen" style="width:${progPercent}%"></div>
															</div>
															<div class="progStatus" style="float:right">
																<p>${successDay} / ${totalDay}</p>
															</div>
														</div>
														
													</div>
												</div>
											</li>
</body>

