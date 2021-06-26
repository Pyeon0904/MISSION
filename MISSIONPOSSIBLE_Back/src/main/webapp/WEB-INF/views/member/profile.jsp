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
<title>프로필 등록</title>
<style> 
	div{ 
		position:relative; 	
		height: 220px;
		margin-top: 75px;
		margin-left: 90px;
		margin-right: 60px;
	} 
</style> 
</head>
<body>
<div>
	<form action="profile" method="POST">
		<table>
			<tr>
			    <th>첨부파일</th>
				<td><input type="file" name="upfile"></td>
			</tr>
		</table>
		<br>
		<button type="submit" style="width: 250px; height: 30px;" onClick='self.close()'>등록하기</button>
	</form>
</div>
</body>
</html>