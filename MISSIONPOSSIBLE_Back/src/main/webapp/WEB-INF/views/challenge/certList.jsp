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
			<% 
				for(int i = 0; i < 12; i++) {
			%>	
			<li>
				<div class="certItemCont">
					<div class="certItemPhotoBox">
						<img src="${path}/resources/images/file.png" alt="챌린지 썸네일" width="70px" height="70px">
					</div>
			
					<div class="certItemInfoCont">
						<div class="certItemTitle"><%-- product.getProductName() --%>
							00월 00일 챌린지인증합니다.
						</div>
						<div class="certItemSubCont"><%-- product.getPrice() --%>										
							챌린지 인증합니다! 챌린지 인증합니다! 챌린지 인증합니다! 
							챌린지 인증합니다! 챌린지 인증합니다! 챌린지 인증합니다! 
							챌린지 인증합니다! 챌린지 인증합니다! 챌린지 인증합니다! 							
						</div>
					</div>
				</div>
			</li>
		<%
			}
		%>
		</ul>
	</div>
</body>
</html>