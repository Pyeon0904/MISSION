<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!-- 
	######## 사용설명 ########
	
	이 파일은 D-Day만을 구하기 위해 작성된 파일입니다.
	
	-------------------------------------------------------------
	|		변수명		|		의미하는 수			|		포맷		|
	-------------------------------------------------------------
	|todayDate			|오늘날짜					|yyyyMMdd		|
	|startstartDate		|챌린지 시작일				|yyyyMMdd		|
	|endDate			|챌린지 끝나는 날			|yyyyMMdd		|
	|tDate				|오늘날짜 parseDate		|yyyyMMdd		|
	|sDate				|챌린지 시작일 parseDate	|yyyyMMdd		|
	|eDate				|챌린지 끝날 parseDate		|yyyyMMdd		|
	|todayNum			|오늘날짜 숫자 표현			|Integer		|
	|startNum			|챌린지 시작일 숫자 표현		|Integer		|
	|endNum				|챌린지 끝날 숫자 표현		|Integer		|
	-------------------------------------------------------------
 -->

<!-- 챌린지 모집기간 마감 D-Day 구하기 위해 오늘 날짜 구하기 시작 -->
	
	<c:set var="today" value="<%= new java.util.Date()%>"/>
	
	<fmt:formatDate var="todayDate" value="${ today }" pattern="yyyyMMdd"/>

<!-- 챌린지 모집기간 마감 D-Day 구하기 위해 오늘 날짜 구하기 끝 -->
														
<!-- D-Day 구하기 시작(Date객체를 숫자로 형변환) -->
	<!-- 챌린지 시작일을 날짜로 형변환 -->
		<fmt:formatDate var="startstartDate" value="${ challenge.startDate }" pattern="yyyyMMdd"/>
	<!-- 챌린지 수료일을 날짜로 형변환 -->
		<fmt:formatDate var="endDate" value="${ challenge.deadline }" pattern="yyyyMMdd"/>
	<!-- 
		오늘 날짜 및 데이터베이스에 저장된 날짜를 숫자로 형변환 
	-->
		<fmt:parseDate value="${ todayDate }" var="tDate" pattern = "yyyyMMdd"/>
		<fmt:parseDate value="${ startstartDate }" var="sDate" pattern = "yyyyMMdd"/>
		<fmt:parseDate value="${ endDate }" var="eDate" pattern = "yyyyMMdd"/>
		<fmt:parseNumber value="${tDate.time / (1000*60*60*24)}" integerOnly="true" var="todayNum" scope="request" />
		<fmt:parseNumber value="${sDate.time / (1000*60*60*24)}" integerOnly="true" var="startNum" scope="request" />
		<fmt:parseNumber value="${eDate.time / (1000*60*60*24)}" integerOnly="true" var="endNum" scope="request" />
