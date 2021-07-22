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
	<div class="certListDisplay">
		<ul>
			<c:if test="${ list == null or pageInfo.listCount == 0}">
				<li>
					<h3>조회된 챌린지 인증 내역이 없습니다.</h3>
				</li>
			</c:if>
			<c:if test="${ list != null }">
				<c:forEach var="certify" items="${ list }">
					<li>
						<div class="certItemCont">
							<div class="certItemPhotoBox">
								<c:if test="${ certify.renamedFilename == null }">
									<img src="${path}/resources/images/c_img/chall00.png" 
									alt="챌린지 썸네일" width="70px" height="70px">
								</c:if>
								<c:if test="${ certify.renamedFilename != null }">
									<img src="${path}/resources/upload/challenge/certify/${ certify.renamedFilename }" 
									alt="챌린지 썸네일" width="70px" height="70px" onerror="this.src='${path}/resources/images/c_img/chall00.png'">
								</c:if>
							</div>
					
							<div class="certItemInfoCont">
								<div class="certItemTitle">
									<fmt:formatDate var="certifyDate" value="${ certify.createDate }" pattern="MM월 dd일"/>
									<c:out value="${ certify.id }"/>님&nbsp;
									<c:out value="${ certifyDate }"/>&nbsp;인증완료!
								</div>
								<div class="certItemSubCont">	
									<c:out value="${ certify.title }"/>					
								</div>
							</div>
						</div>
					</li>
				</c:forEach>
					
			</c:if>
		</ul>
	</div>
</body>
</html>