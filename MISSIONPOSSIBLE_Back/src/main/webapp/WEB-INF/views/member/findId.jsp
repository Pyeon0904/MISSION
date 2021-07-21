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
<title>아이디 찾기</title>
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
	id : <b>${ confirmMember.id }</b><br><br><br>
	<input type='BUTTON' value=" 창닫기" style="width: 380px; height: 30px;" onClick='self.close()'>
</div>
</body>
</html>