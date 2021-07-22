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
div{ 
		position:relative; 	
		height: auto;
		margin-top: auto;
		margin-left: 190px;
		margin-right: 60px;
		font-size: 25px;
	} 
</style> 

</head>
<body>
<div>
	<h3>id : ${ confirmMember.id }</h3>
	<input type='BUTTON' value=" 창닫기" style="width: 200px; height: 30px;" onClick='self.close()'>
</div>
</body>
</html>