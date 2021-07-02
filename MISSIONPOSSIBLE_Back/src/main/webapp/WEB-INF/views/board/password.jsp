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

#box{ 
            background-color:rgb(224, 239, 132);
            width:100%;
            height:1000px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
            margin-top:330px;
            margin-bottom:100px;
            margin-left:-10px;
            padding:10px;
         }

         #conbox{
            width:1600px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/
            position:relative; 
            top:20px;
            margin:auto;
         }

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
.btn {font-family:'malgunbd';align:center;display:flex;padding:10px 20px 10px 20px;margin:0;border:1px solid #aaa;cursor:pointer;color:white;border-radius:2px;vertical-align:middle;font-size:13px;letter-spacing:-1px;line-height:normal;background-color:#555;text-decoration:none;}

</style>



<meta charset="UTF-8">
<title>비밀번호 확인</title>
<script src="${ path }/js/jquery-3.6.0.min.js"></script>
</head>
<body>
 <div class="form-box">
	<section id="section">
				<p style="text-align:center">이 글은 비밀글입니다.<b>비밀번호를 입력하여 주세요.</b></p>

      	
				<div id="updatePassword">
					<form action="${ path }/board/password" method="POST">
						<table>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" name="pass" id="pass1" required></td>
							
							</tr>
							<tr>
								<td><button type="button" class="btn black mr5" onclick="location.href='${path}/board/boardList'">목록으로</button></td>
								<td><input type="submit" class="btn black mr5" value="확인하기"></td>
							</tr>
						</table>
					</form>
				</div>
	</section>
</div>
</body>
</html>
<%@ include file="../common/footer.jsp"%>