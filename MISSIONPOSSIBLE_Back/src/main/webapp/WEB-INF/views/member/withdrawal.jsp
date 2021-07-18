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
			<h4>회원탈퇴</h4>
			<br><br>
			<hr>
			<br><br>
			<div id="withdrawal-container">
				<form action="withdrawal" method="POST">
					<table class="table table-bordered table-hover" style="width:1000px; height:500px; margin:auto; background-color: white">
						<tr>
							<td colspan="2" style="text-align:left;">
								<h8>
									그 동안 많은 성취감을 느끼셨나요? 자아를 실현하면서 나를 되돌아 보는 좋은 시간을 가지셨나요?<br>
									아니면 어떠한 불만이 있으셨나요? 마지막으로 피드백을 남겨주시면 앞으로 더 좋은 서비스로 다시 한 번 찾아 뵙도록 노력하겠습니다.<br> 
									'작전'은 당신과 함께할 수 있어서 매우 행복했습니다. <br>
									훗날 당신이 하시는 모든 일들이 잘 풀리고, 꼭 행복한 삶을 영위하도록 운영진 일동은 묵묵히 응원하겠습니다.<br>
									감사합니다.<br>
								</h8>
							</td>
						</tr>
						<tr>
							<td style="width:50%;">
								<h4><b>탈퇴사유</b></h4>
							</td>
							<td>
								<div class="input-group">
									<select name="reasonWithdrawal" class="form-control" id="selbox">
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
								<input type="password" class="form-control" name="userPW" id="userPW" placeholder="입력하세요" required>
							</td>
						</tr>
						<tr>
							<td>
								<h4><b>비밀번호 확인</b></h4>
							</td>
							<td>
								<input type="password" class="form-control" name="checkPW" id="checkPW" placeholder="입력하세요" required>	
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