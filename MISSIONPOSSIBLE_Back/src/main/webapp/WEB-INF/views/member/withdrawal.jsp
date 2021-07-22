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
        background-color:none;
        width:100%;
        height:auto; 
        margin-top:50px;
        margin-bottom:100px;
        margin-left:-10px;
        padding:10px;
        font-size: 20px;
     }
     #conbox{
        width:1600px; 
        position:relative; 
        top:20px;
        margin:auto;
     }
     
     .pageTitle{
     	margin-left : -1500px;
     }
     
     .pageTitle2{
     	margin-left : 100px;
     }
     
</style>
<script type="text/javascript">
	$(document).ready(() => {
		$("#selboxDirect").hide();

		$("#selbox").change(function() {
				if($("#selbox").val() == "direct") {
					$("#selboxDirect").show();
				}else {
					$("#selboxDirect").hide();
				}
		}); 
	});
</script>
<div id="box">
      <section id="section">
         <div id="conbox">
			<br><br><br><br><br><br>
			<br><br>
         	<a><img class="pageTitle" src="${path}/resources/images/pageTitle/회원탈퇴.png" /></a>
			<hr>
			<br><br>
			<div id="withdrawal-container">
				<form action="withdrawal" method="POST">
					<table class="table table-bordered table-hover" style="width:1000px; height:500px; margin:auto; background-color: white">
						<tr>
							<td colspan="2" style="text-align:left;">
								<a><img class="pageTitle2" src="${path}/resources/images/탈퇴문구.png" /></a>
							</td>
						</tr>
						<tr>
							<td style="width:50%;">
								<h4><b>탈퇴사유</b></h4>
							</td>
							<td>
								<div class="input-group">
									<select name="reasonWithdrawal" class="form-control" id="selbox" style="height: 30px">
										<option value="other">다른사이트가 더 좋아서 탈퇴합니다.</option>
										<option value="personal">개인적인 사정으로 인해 탈퇴합니다.</option>
										<option value="direct">직접입력</option>
									</select>
									<input type="text" id="selboxDirect" name="selboxDirect" style="width:300px;"/>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<h4><b>비밀번호</b></h4>
							</td>
							<td>
								<input type="password" class="form-control" name="userPW" id="userPW" placeholder="입력하세요" required style="height: 30px; width: 240px">
							</td>
						</tr>
						<tr>
							<td>
								<h4><b>비밀번호 확인</b></h4>
							</td>
							<td>
								<input type="password" class="form-control" name="checkPW" id="checkPW" placeholder="입력하세요" required style="height: 30px; width: 240px">	
							</td>
						</tr>
					</table>
					<br>
					<input type="submit" class="btn btn-primary" value="더 큰 행복을 찾으러 가기" />
				</form>
				<br>
			</div>
		</div>
	</section>
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>