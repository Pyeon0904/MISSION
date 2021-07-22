<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="../common/header.jsp"%> 


<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<style>
#box{background-color:none;width:100%;height:1000px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
     margin-top:auto;margin-bottom:100px;margin-left:-10px;padding:10px;}

#conbox{width:1600px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/position:relative; top:20px;margin:auto;}

.form-box {
   background: #fff;
   margin: 30px auto;
   padding:30px;
   margin-top:150px;
   width:500px;
   height:300px;
   border: 1px solid #dfdfdf;
}
table {
margin:auto;
}
input[type=password]{
margin:30px;
height:20px;
}
/* button */
.btn {font-family:'malgunbd';align:center;display:inline;padding:10px 20px 10px 20px;margin:0;border:1px solid #aaa;cursor:pointer;color:white;border-radius:2px;vertical-align:middle;font-size:13px;letter-spacing:-1px;line-height:normal;background-color:#555;text-decoration:none;}

.button_base:hover {cursor: pointer;}
.b01_simple_rollover {color: #ffffff; border: #AFE525 solid 1px; background-color:#AFE525; padding:10px 20px 10px 20px;}
.b01_simple_rollover:hover {color: #000000;background-color: #ffffff;}
</style>



<meta charset="UTF-8">
<title>비밀번호 확인</title>
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<div id="box">
<section id="section">
<div id="conbox">
 <div class="form-box">
	<section id="section">
		<p style="text-align:center"><br><br><br>이 글은 비밀글입니다.<b>비밀번호를 입력하여 주세요.</b></p>

			<div id="updatePassword">
				<form action="${ path }/board/password" method="POST">
					<input type="hidden" name="qna_no" value="${ board.qna_no }" />
					<table>
						<tr>
							<th>비밀번호</th>
							<td><input type="password" name="pass" id="pass1"></td>
						</tr>
					</table>
						
					<button type="button" class="button_base b01_simple_rollover" onclick="location.href='${path}/board/boardList'" style="margin-left:150px;">목록으로</button>
					<input type="submit" class="button_base b01_simple_rollover" value="확인하기">
				</form>
			</div>
	</section>
</div>
</div>
</section>
</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>