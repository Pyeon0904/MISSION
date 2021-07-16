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
			color:rgba(26, 252, 26);
		}
		</style>
	</head>
	
	<body>
		<footer>
			<hr id="greenLine" style="margin-top:200px; background-color:rgba(26, 252, 26); height:2px;">
		
			<div id="footer">
				<p id="copyright">
				&lt;Copyright 2021. <strong>작전 : MISSION</strong>.All rights reserved. &gt;
				</p>
			</div>
		</footer>
	</body>
</html>