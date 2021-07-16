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
<style>
	.certListDisplay ul{list-style-type : none; margin-left:25px;}
	.certListDisplay ul li .certItemCont {
		width:380px; height:75px; margin-bottom:10px;
	}
	.certListDisplay ul li .certItemCont .certItemPhotoBox{
		width:70px; height:70px; float:left;
	}
	.certListDisplay ul li .certItemCont .certItemInfoCont{
		width:300px; height:70px; float:left;
	}
	.certListDisplay ul li .certItemCont .certItemInfoCont .certItemTitle{
		width:100%; height:20px; font-weight:bold; margin-left:5px;
		overflow:hidden; text-overflow: ellipsis;white-space:nowrap;
	}
	.certListDisplay ul li .certItemCont .certItemInfoCont .certItemSubCont{
		width:100%; height:50px; margin-left:5px;
		line-height:1.7;
		overflow:hidden; 
		display: -webkit-box;
	    -webkit-line-clamp: 2;
	    -webkit-box-orient: vertical;
	}
</style>
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
								<img src="${path}/resources/upload/challenge/certify/${ certify.renamedFilename }" 
									alt="챌린지 썸네일" width="70px" height="70px" onerror="this.src='${path}/resources/images/file.png'">
							</div>
					
							<div class="certItemInfoCont">
								<div class="certItemTitle">
									<fmt:formatDate var="certifyDate" value="${ certify.createDate }" pattern="MM월 dd일"/>
									<c:out value="${ certifyDate }"/>
									<c:out value="${ certify.id }"/>
									<c:out value="${ certify.title }"/>
								</div>
								<div class="certItemSubCont">									
									<c:out value="${ certify.content }"/> 							
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