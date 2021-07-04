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
		<title>챌린지 인증 팝업창</title>
		<script src="${ path }/resources/js/jquery-3.6.0.min.js"></script>
	</head>	

	<body>
		<h2>챌린지 인증하기</h2>
		<hr>
		<form id="certForm" action="${ path }/challenge/signPopup" method="POST" enctype="multipart/form-data">
		<table border="1">
			<input type="hidden" name="challengeNo" value="${ challenge.challengeNo }"/>
			<tr>
				<th>챌린지 제목</th>
				<td>${ challenge.title }</td>
			</tr>
			<tr>
				<th>인증 게시물 제목</th>
				<td><input type="text" name="title"/></td>
			</tr>
			<tr>
				<th>ID</th>
				<td><input type="text" name="id" value="${ id }" readonly/></td>
			</tr>
			<tr>
				<th>인증날짜</th>
				<td>
					<c:set var="today" value="<%= new java.util.Date() %>"/>
					<c:set var="date">
						<fmt:formatDate value="${ today }" pattern="yyyy-MM-dd"/>
					</c:set>
					<c:out value="${ date }"/>
				</td>
			</tr>
			<tr>
				<th>파일첨부</th>
				<td>
					<input type="file" name="upfile">
					<input type="button" id="deletefile" name="deletefile" value="삭제">
				</td>
			</tr>
			<tr>
				<th>인증글 작성</th>
				<td>
					<textarea name="content" rows="10" cols="40" style="resize:none" 
						placeholder="챌린지원들에게 남길 인증글을 작성해주세요."></textarea>
				</td>
			</tr>
		</table>
		
		<hr>
		<input type="submit" value="인증하기">
		<input type="reset" value="취소">
		</form>
		
	</body>
</html>