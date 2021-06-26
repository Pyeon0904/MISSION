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
<title>비밀번호 찾기</title>
<style> 
div { position:relative; 	
	height: 220px;
	margin-top: 75px;
	margin-left: 90px;
	margin-right: 60px;} 
</style> 
</head>
<body>
<div>
	<form action="sendMail" method="POST">
		<table>
			<tr>
				<th>아이디</th>
				<td></td>
				<td><input type="text" name="userId" id="id" placeholder="user00"
					required /></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td></td>
				<td><input type="email" name="userEmail" id="email"
					placeholder="test@test.org" required /></td>
			</tr>
		</table>
		<br>
		<button type="submit" id="mailSubmit" style="width: 250px; height: 30px;">인증 메일 보내기</button>
	</form>
</div>
</body>
</html>