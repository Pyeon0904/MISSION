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
														<div class="itemShowMenu" onclick="location.href='${ path }/challenge/recruit?no=${ challenge.challengeNo }'">
															<span class="details">상세보기</span>
														</div>
													</div>
													<div class="itemInfoCont">
														<p>
															<span class="itemTitle">
																<c:out value="${ challenge.title }"/>
															</span>
															<br>
															[종료된 챌린지]
															
														</p>
													</div>
												</div>
											</li>
</body>

