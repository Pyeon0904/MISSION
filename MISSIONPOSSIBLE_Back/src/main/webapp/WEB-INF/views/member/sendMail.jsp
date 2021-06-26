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
<title>이메일 발송 완료</title>
<style> 
div { position:relative; 	
	width: 370px;
	margin-top: 70px;
	margin-left: 30px;
	margin-right: 30px;
	margin-bottom: 10px;} 
</style> 

</head>
<body>
<div>
	회원님의 이메일(test@test.org)로 비밀번호 변경을 위한 임시 비밀번호를 발송하였습니다.<br>
	로그인 후 반드시 비밀번호를 재설정 해주십시오.<br><br><br>
	<input type='BUTTON' value=" 창닫기" style="width: 380px; height: 30px;" onClick='self.close()'>
</div>
</body>
</html>