<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

 <%@ include file="/WEB-INF/views/common/header.jsp" %>

<style>
/* 전체 틀 ------------------------------------------------- */
	#box{ 
        background-color:none;
        width:100%;
        height:600px; 
        margin-top:auto;
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
/* -------------------------------------------------------- */

	section #login-container {
		text-align:center;
	}
	section #login-container table {
		margin:0 auto;
	}

	section #login-container table th {
		padding:0 10px;
		text-align:right;
	}

	section #login-container table td {
		padding:0 10px;
	}
	h3{
		font-weight:bold;
		text-align:center;
		font-size:50px;
	}
	label{
		float:right;
	}
	#enrollSubmit, #btnEnroll{
		width: 300px;
		height: 50px;
		float:none;
		margin:0 auto;
		background-color:#F7F8E0;
	}
	#inputId, #inputPass{
		width: 300px;
		height: 50px;
	}
	
	/* 아이디찾기, 비밀번호 찾기 버튼 */
    .btn {
    	color: black;
    	background-color:#F7F8E0;
    }
    .btn:hover{
  		color:#1AAB8A; /*연두색*/
	}
/* ------------------------------------------- */
  
.button{
  color:black;
  border:1px solid;
  position:relative;
  height:60px;
  font-size:1.0em;
  padding:0 2em;
  cursor:pointer;
  transition:800ms ease all;
  outline:none;
}
.button:hover{
  background-color:rgba(26, 252, 26);
  color:#1AAB8A; /*연두색*/
}
.button:before, .button:after {
  content:'';
  position:absolute;
  top:0;
  right:0;
  height:2px;
  width:0;
  background: #1AAB8A;
  transition:200ms ease all;
}

.button:after{
  right:inherit;
  top:inherit;
  left:0;
  bottom:0;
}
.button:hover:before, .button:hover:after{
  width:100%;
  transition:200ms ease all;
}
</style>



<script type="text/javascript">
	$(document).ready(()=>{
		$("#findPw").on("click", (e)=>{
			
			const url = "${path}/member/findPassword";
			const status="left=500px, top=200px, width=450px; height=300px";
			
			open(url, "", status);
		});
		
		$("#finId").on("click", (e)=>{
			
			const url = "${path}/member/checkNickEm";
			const status="left=500px, top=200px, width=450px; height=300px";
			
			open(url, "", status);
		});	
	});
</script>
<div id="box">
      <section id="section">
         <div id="conbox">
		
		<h3>로그인</h3>
		<br><br>
		<div id="login-container">
			<form action="login" method="POST">
				<table>
					<tr>
						<td>
							<div class="input-group">
							  <input type="text" class="form-control" id="inputId" name="userId" placeholder="아이디" aria-describedby="basic-addon1" value="${cookie.saveId.value}" required>
							</div>
						</td>
					</tr>
					<tr height="10"></tr>
					<tr>
						<td>
							<div class="input-group">
							  <input type="password" class="form-control" id="inputPass" name="userPwd" placeholder="비밀번호" aria-describedby="basic-addon1" required>
							</div>
							
						</td>
					</tr>
					<tr>
						<td>
							<label><input type="checkbox" name="saveId" ${ cookie.saveId.value != null ? "checked" : ""}  />아이디 저장</label>
						</td>
					</tr>
				</table>
				<br>
				<input type="submit" class="button" id="enrollSubmit" value="로그인"/><br><br>
				<input type="button" value="회원가입" id="btnEnroll" class="button" onclick="location.href='<%= request.getContextPath()%>/member/enrollCheck'"/><br>
				<br>
				<button type="button"  class="btn" id="finId" >아이디 찾기</button>&nbsp &nbsp &nbsp &nbsp
				<button type="button"  class="btn" id="findPw" >비밀번호 찾기</button>
			</form>
		</div>
	</div>
</section>
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
