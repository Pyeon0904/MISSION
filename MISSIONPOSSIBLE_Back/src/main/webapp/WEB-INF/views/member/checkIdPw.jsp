<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 인증</title>
<style> 
div{ 
		position:relative; 	
		height: auto;
		margin-top: auto;
		margin-left: 150px;
		margin-right: 60px;
		font-size: 25px;
	} 
</style> 
</head>
<body>
<div>
	<h2>회원 본인인증</h2>
	<form action="checkIdPw" method="POST">
		<table>
			<tr>
				<th>아이디</th>
				<td></td>
				<td><input type="text" name="userId" id="id" value="${ loginMember.id }" required style="height: 30px"/></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td></td>
				<td><input type="password" name="userPwd" id="password" placeholder="입력하세요" required style="height: 30px"/></td>
			</tr>
		</table>
		<br>
		<button type="submit" style="width: 300px; height: 30px;">인증하기</button>
	</form>
</div>
</body>
</html>