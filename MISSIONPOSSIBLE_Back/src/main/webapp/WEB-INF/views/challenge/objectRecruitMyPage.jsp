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
											
									<li class="test">
										<div class="itemCont">
											<div class="itemPhotoBox">
												<c:if test="${ challenge.thumbnailFile == null }">
													<img src="${path}/resources/images/c_img/chall02.png" alt="기본 이미지" width="180px" height="180px"/>
												</c:if>
												<c:if test="${ challenge.thumbnailFile != null }">
													<img src="${path}/resources/upload/challenge/${ challenge.thumbnailFile }" alt="챌린지 썸네일" 
														width="180px" height="180px" onerror="this.src='${path}/resources/images/c_img/chall02.png'"/>
												</c:if>
												<div class="viewPoint" style="width:100px;height:50px;position:relative;top:-170px;left:10px">
													<img src="${path}/resources/images/point/${challenge.minusPoint}p.png" width="50px" height="25px"/>
												</div>
												<div class="itemOpacCont">
													<div class="itemShowMenu" onclick="location.href='${ path }/challenge/recruit?no=${ challenge.challengeNo }'" style="z-index:2">
														<span class="details">상세보기</span>
													</div>
													<div class="itemDelete" onclick="zzimDelete(${ challenge.challengeNo });" style="z-index:3">
														<p class="details">X</p>
													</div>
												</div>
											</div>
											<div class="itemInfoCont">
												<p>
													<span class="itemTitle">
														<c:out value="${ challenge.title }"/>
													</span>
													<br>
													<span class="itemSubCont">챌린지 모집기간</span>
													<br>
													
													<!-- D-Day 로직 구현한 파일 include -->
													<%@ include file="date.jsp" %>															
																							
													<!-- 
														챌린지 시작일에서 오늘 날짜를 뺌 D-Day 완성! 
													-->
													<span class="itemProgressStatus">
														D-<c:out value="${ startNum - todayNum }"></c:out>
													</span>
												</p>
											</div>
										</div>
									</li>
</body>

