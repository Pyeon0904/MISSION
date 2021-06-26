<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
	section{
		text-align:center;
	}
	#box{ 
        background-color:rgb(224, 239, 132);
        width:100%;
        height:1000px; 
        margin-top:330px;
        margin-bottom:100px;
        margin-left:-10px;
        padding:10px;
     }
     #conbox{
        width:1600px; 
        position:relative; 
        top:20px;
        margin:auto;
     }
</style>
<script type="text/javascript">
	$(document).ready(()=>{
		$("#check").on("click", (e)=>{
			
			const url = "${path}/member/checkIdPw";
			const status="left=500px, top=200px, width=450px; height=300px";
			
			open(url, "", status);
		});	
	});
</script>

<div id="box">
      <section id="section">
         <div id="conbox">
		<br><br><br><br><br><br>
		<h4>마이페이지</h4>
		<hr>
		<div id="myPage-container">
			<table class="table table-bordered table-hover" border="1" style="width:900px; height:200px; margin:auto; background-color: white;">
				<tr>
					<td rowspan="4" style="width:250px; height:200px;">
						<!-- 사용자 프로필 사진  --> 
					</td>
					<td>
						<h4><b>닉네임</b></h4>
					</td>
					<td>
						<h4>${ loginMember.nickname }</h4>
					</td>
				</tr>
				<tr>
					<td>
						<h4><b>이메일</b></h4>
					</td>
					<td>
						<h4>${ loginMember.email }</h4>
					</td>
				</tr>
				<tr>
					<td>
						<h4><b>등급</b></h4>
					</td>
					<td>
						<h4>${ loginMember.gradeName }</h4>
					</td>
				</tr>
				<tr>
					<td>
						<h4><b>보유 포인트</b></h4>
					</td>
					<td>
						<h4>${ loginMember.point }</h4>
					</td>
				</tr>
			</table>
			<br>
			<button class="btn btn-outline-success btn-lg" id="check">회원정보수정</button>
		 </div>
		</div>
	</section>
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>