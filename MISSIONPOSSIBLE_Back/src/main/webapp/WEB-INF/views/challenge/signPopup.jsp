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
		<style>
			td,th,caption{font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;font-size:15px;color:#333;letter-spacing:0px}
	    	
			/* table */
			table.table01 {border-collapse:separate;border-spacing:0;line-height:1.5;border-top:1px solid #ccc;border-left:1px solid #ccc;margin:auto;}
			table.table01 th {padding: 10px;font-weight: bold;vertical-align: middle;text-align:center;border-right:1px solid #ccc;border-bottom:1px solid #ccc;border-top:1px solid #fff;border-left:1px solid #fff;background:#eee;}
			table.table01 td {padding:10px;vertical-align:middle;border-right:1px solid #ccc;border-bottom:1px solid #ccc;}
			input[type="text"]{font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;font-size:12px;color:#666;padding-left:3px;border:1px solid #ABADB3}
			input[type="file"]{font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;font-size:12px;height:22px;color:#666;background:#fff;border:1px solid #cdcdcd}		
			.btnbtnbtn{border:1px solid lightgray;}
		</style>
	</head>	

	<body>
		<form id="certForm" action="${ path }/challenge/signPopup" method="POST" enctype="multipart/form-data">
		<table class="table01">
			<input type="hidden" name="challengeNo" value="${ challenge.challengeNo }"/>
			<tr>
				<td colspan="2" style="font-size:1.2em; font-weight:bolder;text-align:center">챌린지 인증</td>
			</tr>
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
					<input type="file" name="upfile" id="upfile">
					<input type="button" id="deletefile" name="deletefile" class="btnbtnbtn" value="삭제">
				</td>
			</tr>
			<script>
			$(document).ready(()=>{
				$('#deletefile').on('click', ()=> {
				    $("#upfile").val("");
				});
			});
			</script>
			<tr>
				<th>인증글 작성</th>
				<td>
					<textarea name="content" rows="10" cols="40" style="resize:none" 
						placeholder="챌린지원들에게 남길 인증글을 작성해주세요."></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="text-align:center">
					<input type="submit" value="인증하기" class="btnbtnbtn">
					<input type="reset" value="취소" class="btnbtnbtn">
				</td>
			</tr>
		</table>
		</form>
		
	</body>
</html>