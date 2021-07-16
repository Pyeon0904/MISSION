<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 전체 footer 페이지</title>
		
		<style>
		#footer {
			background-color:#2a1b0a;
			width:100%;
			height:50px;
			padding:10px;
			margin-left:-10px;
			margin-bottom:-10px;
		}
		/*텍스트 설정*/
		#copyright{
			text-align: center;
			font-family:
			font-size:12pt;
			color:rgb(224, 239, 132);
		}
		</style>
	</head>
	
	<body>
		<footer>
			<div id="footer">
				<p id="copyright">
				&lt;Copyright 2021. <strong>작전 : 404 에러</strong>.All rights reserved. &gt;
				</p>
			</div>
		</footer>
	</body>
</html>