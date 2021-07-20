<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<style>

/* 전체 페이지 틀 */
	#box{ 
    	background-color:none;
    	width:100%;
    	height:600px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
    	margin-top:auto;
    	margin-bottom:150px;
    	margin-left:-10px;
    	padding:10px;
	}       
	#conbox{
	     width:1600px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/
	     position:relative; 
	     top:20px;
	     margin:auto;
}
/* -------------------------------------------------------------- */
	h3{
		font-weight:bold;
		text-align:center;
		font-size:50px;
	}

.section_join{
    height: auto;
    /* border: 1px solid red; */
    margin-top: 25px;
    margin-bottom: 25px;
}

.join_out{
    width: 1000px;
    height: auto;
    margin: 0 auto;
}
.join_title{
    text-align: center;
    font-family: "Open Sans", sans-serif;
    font-size: 20px;
    font-weight: 700;
}
.join_ulcss{
    width: 1000px;
    height: auto;
}
.join_ulcss>li>span{
    float: left;
    width: 150px;
    border-right: 1px solid #dfdfdf;
    border-bottom: 1px solid #ccc;
}
.join_ulcss>li:nth-child(1){
    font-size: 16;
    font-weight: 700;
    font-family: 'Nanum Gothic', sans-serif;
}
.join_ulcss>li>div{
    float: left;
}
.join_li_title{
    height: 60px;
    line-height: 60px;
    font-family: "Nanum Gothic", sans-serif;
    font-size: 14px;
    text-indent: 20px;
}
.join_li_title2{
    height: 80px;
    line-height: 80px;
    font-family: "Nanum Gothic", sans-serif;
    font-size: 14px;
    text-indent: 25px;

}
.join_li_title3{
    height: 150px;
    line-height: 150px;
    font-family: "Nanum Gothic", sans-serif;
    font-size: 14px;
    border-bottom: 1px solid black;
    text-indent: 25px;

}

.join_li_input{
    width: 850px;
    height: 60px;
    padding-left: 10px;
    display: flex;
    align-items: center;
}
.join_li_input>input{
    width: 400px;
    height: 40px;
    border: 1px solid #ccc;
    text-indent: 10px;
}

.member_id{
    width: 200px;
}
.idcheck_msg { 
    font-family: 'Noto Sans KR', sans-serif;
    font-size:12px; 
    color: red;
    margin-left: 10px;
    display: none;
}

.join_li_input2{
    width: 850px;
    height: 80px;
    display: flex;
    flex-direction: column;
  
}
.join_li_input_out{
    width: 840px;
    height: 50px;
    padding-left: 10px;
    display: flex;
    align-items: center;
}
.join_li_input_out_1{
    width: 840px;
    height: 30px;
    padding-left: 10px;
    display: flex;
    align-items: center;
    font-size: 13px;
    font-family: "Nanum Gothic", sans-serif;

}

.member_email{
    width: 250px;
    height: 40px;
    border: 1px solid #ccc;
    text-indent: 10px;
    margin-right: 10px;
}
.member_email_select{
    width: 140px;
    height: 40px;
    border: 1px solid #ccc;

}
.member_event{
    width: 20px;
    height: 20px;
    border: 1px solid #ccc;
    margin-right: 5px;
}
.member_hp{
    width: 400px;
    height: 40px;
    text-indent:10px;
    border: 1px solid #ccc;
}

.join_li_input3{
    width: 850px;
    height: 150px;
    padding-left: 10px;
    display: flex;
    flex-direction: column;
    justify-content: center;
}
.join_li_input_out2{
    width: 840px;
    height: 50px;
    display: flex;
    align-items: center;
}

.memeber_post{
    width: 200px;
    height: 40px;
    margin-right: 10px;
    text-indent: 10px;
    border: 1px solid #ccc;

}
.addr_btn{
    width: 110px;
    height: 40px;
    border: none;
    background-color: #F7F8E0;
    color: black;
    cursor: pointer;
}

.memeber_addr{
    width: 400px;
    height: 40px;
    text-indent: 10px;
    border: 1px solid #ccc;

}

.join_ulcss>li:nth-child(1){
    width: 1000px;
    height: 40px;
    line-height: 40px;
    border-bottom: 1px solid black;
    font-family: "Nanum Gothic", sans-serif;
    font-size: 16px;

}
.join_ulcss>li:nth-child(1)>label{
    float: right;
    font-family: "Nanum Gothic", sans-serif;
    font-size: 13px;
}

.join_ulcss>li:nth-child(2){
    width: 1000px;
    height: 60px;
    border-bottom: 1px solid #ccc;
}

.join_ulcss>li:nth-child(3){
    width: 1000px;
    height: 60px;
    border-bottom: 1px solid #ccc;
}

.join_ulcss>li:nth-child(4){
    width: 1000px;
    height: 60px;
    border-bottom: 1px solid #ccc;
}

.join_ulcss>li:nth-child(5){
    width: 1000px;
    height: 60px;
    border-bottom: 1px solid #ccc;
}

.join_ulcss>li:nth-child(6){
    width: 1000px;
    height: 80px;
    border-bottom: 1px solid #ccc;
}

.join_ulcss>li:nth-child(7){
    width: 1000px;
    height: 80px;
    border-bottom: 1px solid #ccc;
}

.join_ulcss>li:nth-child(8){
    width: 1000px;
    height: 150px;
    border-bottom: 1px solid #ccc;
}

/* 하단 버튼 */
.join_btns{
    width: 1000px;
    height: 40px;
    margin: 0 auto;
    margin-top: 25px;
}
.join_btns_out{
   display: flex;
   justify-content: center;
}
.cancel_btn{
    width: 250px;
    height: 40px;
    border: 1px solid #ccc;
    text-align: center;
    line-height: 40px;
    margin-right: 10px;
    float: left;
    cursor: pointer;
}
.join_all_btn{
    width: 250px;
    height: 40px;
    background-color: #F7F8E0;
    color: black;
    text-align: center;
    line-height: 40px;
    float: left;
    cursor: pointer;
}

/* 폰트 */
@import url("https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap");
/* font-family: 'Noto Sans KR', sans-serif; (100,300,400,500,700,900) */

@import url("https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap");
/* font-family: 'Nanum Gothic', sans-serif;  (400,700,800)*/

@import url("https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&display=swap");
/* font-family: 'Nanum Pen Script', cursive; (400) */

@import url("https://fonts.googleapis.com/css2?family=Big+Shoulders+Stencil+Display:wght@100;300;400;500;600;700;800;900&display=swap");
/* font-family: 'Big Shoulders Stencil Display', cursive; (100,300,400,500,600,700,800,900) */

@import url("https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,600;0,700;0,800;1,400;1,600;1,700;1,800&display=swap");
/* font-family: 'Open Sans', sans-serif; */

@import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100;0,200;0,400;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap');
/* font-family: 'Montserrat', sans-serif; */ 

/* 기본 setting 사항 */

html,
div,
label,
section,
aside,
footer,
header,
nav,
video,
tr,
td,
th {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
}


span, label {
  display: block;
}

a:link,
a:visited,
a:hover,
a:focus,
a:active {
  color: black;
  text-decoration: none;
}

body {
  line-height: 1;
  /*
   폰트 사용시 여러단락 (<br> 사용시) 높이가 맞지 않을 경우 
    해당 부분으로 정확하게 수치를 맞춰서 높이를 잡을 수 있음
  */
  -webkit-text-size-adjust: none;
  /* 크롬, 사파리 기준 */
  -moz-text-size-adjust: none;
  /* 모질라 파이어폭스 기준 */
  -ms-text-size-adjust: none;
  /* 익스플로러 기준 */
  text-size-adjust: none;
  /*edge 기준 */
}

ol,
ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

* {
  box-sizing: border-box;
}

.regex{
     font-size: 15px;
     margin-left : 10px;
     color: red;
}
 
.input-file-button{

	  padding: 10px 20px;
	  background-color:#F7F8E0;
	  border-radius: 4px;
	  color: black;
	  cursor: pointer;
}

</style>
<script type="text/javascript">
	$(document).ready(() => {	
		$("#profile").on("click", (e)=>{
			
			const url = "${path}/member/profile";
			const status="left=500px, top=200px, width=450px; height=300px";
			
			open(url, "", status);
		});	
		
	   $("#member_pw1").blur((event) => {
	      let pass1 = $("#member_pw").val();         
	      let pass2 = $(event.target).val();
	      
	      if(pass1.trim() != pass2.trim()) {
	         alert("비밀번호가 일치하지 않습니다.");
	         
	         $("#member_pw").val("");
	         $(event.target).val("");
	         $("#member_pw").focus();
	      }
	   });
	   
	 //아이디 유효성검사
       $("#member_id").on("input",function(){
    	   let id = $("#member_id").val().trim();
    	   valiId(id);
       });
	 
	 //비밀번호 유효성검사
       $("#member_pw").on("input",function(){
    	   let pw = $("#member_pw").val().trim();
    	   valiPw(pw);
       });
	   
	   // 닉네임 유효성 검사
	   $("#member_nickname").on("input",function(){
		  let nickname = $("#member_nickname").val().trim();
		  valiNick(nickname);
       });
	 
     //email유효성 검사
       $("#member_email").on("input",function(){
    	  valiEmail();
       });
	 
	    
    // 아이디 중복을 확인 처리 콜백함수
	   $("#checkIdDuplicate").on("click",function(){
	      // 중복확인전에 아이디 값이 4글자 이상인지 확인
	      var id = $("#member_id").val().trim();
	      
	      if (id.length < 4) {
	         alert("아이디는 최소 4글자 이상 입력하세요.")
	         return;
	      }
  
	      $.ajax({
				type: "get",
				url: "${path}/member/idCheck",
				dataType: "json",
				data: {
					id // 속성의 키값과 변수명이 동일할 경우
				},
				success: function(data) {
					console.log(data);
					
					if(data.validate === true) {
						alert("이미 사용중인 아이디 입니다.");
						$("#member_id").val('');
					} else {
						alert("사용 가능한 아이디 입니다.");		
						$("#checkid").val('통과');
					}
				},
				error: function(e) {
					console.log(e);
				}
			});
	   });
    
	// 닉네임 중복을 확인 처리 콜백함수
	   $("#checkNicknameDuplicate").on("click",function(){
	      // 중복확인전에 닉네임 값이 2글자 이상인지 확인
	      var nickname = $("#member_nickname").val().trim();
	      
	      if (nickname.length < 1) {
	         alert("닉네임은 최소 2글자 이상 입력하세요.")
	         return;
	      }

	      $.ajax({
				type: "get",
				url: "${path}/member/nicknameCheck",
				dataType: "json",
				data: {
					nickname // 속성의 키값과 변수명이 동일할 경우
				},
				success: function(data) {
					console.log(data);
					
					if(data.validate === true) {
						alert("이미 사용중인 닉네임 입니다.");
						$("#member_nickname").val('');
					} else {
						alert("사용 가능한 닉네임 입니다.");
						$("#checkNickname").val('통과');
					}
				},
				error: function(e) {
					console.log(e);
				}
			});
	   });
	
	   //회원가입 버튼 눌렀을 때, 빈칸 있으면 다시 유효성 검사진행     
	   $("#enrollSubmit").on("click",function(){
    	   var id = $("#member_id").val().trim();
    	   var pw = $("#member_pw").val().trim();
    	   var nickname = $("#member_nickname").val().trim();
    	   var email = $("#member_email").val().trim();
    	   
    	   if(!valiId(id)){
    		   alert("아이디 양식을 다시 확인해주세요");
    		   return;
    	   }
    	   
    	   if(!valiPw(pw)){
    		   alert("비밀번호 양식을 다시 확인해주세요");
    		   retrun;
    	   }
    	  
    	   if(!valiNick(nickname)){
    		   alert("닉네임 양식을 다시 확인해주세요");
    		   retrun;
    	   }
    	   
    	   if(!valiEmail(email)){
    		   alert("이메일 양식을 다시 확인해주세요");
    		   retrun;
    	   }
    	   
    	 //아이디 중복체크를 하지 않았으면 전송되지 않도록
    	   if($("#checkid").val()!="통과"){
    	        alert('아이디 중복확인 해주세요.');
    	        return;
    	    }
    	 
    	   if($("#checkNickname").val()!="통과"){
	   	        alert('닉네임 중복확인 해주세요.');
	   	        return;
   	    	}
    	 
    	 // 빈칸 없을 때 제출
    	   ${"join_content"}.submit();

       })
	});
	
	// 이메일 선택부분
    function email_select() {
        var m = document.getElementById("member_email");
        if (m.value != "") {
            m.value = m.value + document.getElementById("member_email_select").value;
            var n = m.value.split("@")[0];
            m.value = n + document.getElementById("member_email_select").value;
            
            if(document.getElementById("member_email_select").value != ""){
            	$(".email.regex").html("");
            }else{
            	$(".email.regex").html("올바른 이메일이 아닙니다");
            }
        }
    }
	
 	// 취소버튼
    function join_cn() {
        location.href = "${ path }";
    }
 	
 	//프로필 썸네일 띄우기
    function setThumbnail(event) { 
    	var reader = new FileReader(); 
    	reader.onload = function(event) { 
    		var img = document.getElementById("profile");
    		img.setAttribute("src", event.target.result);
    };
    	reader.readAsDataURL(event.target.files[0]); 	
   }
 	
 	function valiPw(pw){
 	   var checkNumber = /[^0-9]/;
 	   var checkEnglish =  /[^a-zA-Z]/;
 	   var checkBlank = /[\s]/;
 	   var checkKorean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
 	   var checkspe = /[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/;
 	   
        if(pw.length < 8 || pw.length > 12){
            $(".pw.regex").html("영문,숫자,특수문자 혼합 8-12자리");
        }else if(checkKorean.test(pw)){
     	   $(".pw.regex").html("한글을 포함할 수 없습니다.");
        }else if(!checkEnglish.test(pw)||!checkNumber.test(pw)||!checkspe.test(pw)){
     	   $(".pw.regex").html("영문,숫자,특수문자를 혼합하여 입력해주세요.");
        }else if(checkBlank.test(pw)){
            $(".pw.regex").html("공백을 포함할 수 없습니다.");
        }else{
     	   $(".pw.regex").html("");
     	   return true;
        }
 	}
 	
 	function valiId(id){
 	   var checkNumber = /[^0-9]/;
 	   var checkEnglish =  /[^a-zA-Z]/;
 	   var checkBlank = /[\s]/;
 	   var checkKorean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
 	   var checkspe = /[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/;
 	   
        if(id.length < 4 || id.length > 12){
            $(".id.regex").html("영문,숫자를 혼합 4-12자리");
        }else if(checkKorean.test(id)){
     	   $(".id.regex").html("한글을 포함할 수 없습니다.");
        }else if(!checkEnglish.test(id)||!checkNumber.test(id)){
     	   $(".id.regex").html("영문,숫자를 혼합하여 입력해주세요.");
        }else if(checkBlank.test(id)){
            $(".id.regex").html("공백을 포함할 수 없습니다.");
        }else if(checkspe.test(id)){
        	 $(".id.regex").html("특수문자를 포함할 수 없습니다.");
        }else{
     	   $(".id.regex").html("");
     	  return true;
        }
 	}
 	function valiNick(nickname){
 		var checkspe = /[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/;
		var checkBlank = /[\s]/;
		  
		  if(nickname.length < 2 || nickname.length > 10){
			  $(".name.regex").html("영문,숫자를 혼합 2-10자리");
		  }else if(checkBlank.test(nickname)){
			  $(".name.regex").html("공백을 포함할 수 없습니다.");
		  }else if(checkspe.test(nickname)){
			  $(".name.regex").html("특수문자를 포함할 수 없습니다.");
		  }else{
			  $(".name.regex").html("");
			  return true;
		  }
 	}
 	function valiEmail(){
 		var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        var result = regex.exec($("#member_email").val());
       
       if(result != null){
          $(".email.regex").html("");  
          return true;
       }else{
           $(".email.regex").html("올바른 이메일이 아닙니다");
       }
 	}
</script>

</head>
<body>

<div id="box">
      <section id="section">
         <div id="conbox">
	<h3>회원가입</h3>
	<hr>
	<br><br>
	<div id="enroll-container">
		<form name ="memberEnrollFrm" id="join_content" action="enroll" method="post" enctype="multipart/form-data">
			<table  border="1" style="margin:0 auto;">
				<tr>
					<td style="width:300px; height:300px;">
						<img src="${path}/resources/images/기본프로필.png" name="profile" id="profile" alt="My Image" style="width:300px; height:300px;"/>
					</td>
					<td>
						<ul class="join_ulcss">
				            <li>기본정보
				                <label><b style="color:red;">·</b>표시는 반드시 입력하세요 하는 항목입니다.</label>
				            </li>
				
				            <li>
				                <span class="join_li_title"><b style="color:red;">·</b>아이디</span>
				                <div class="join_li_input">
				                    <input type="text" class="member_id" name="id" id="member_id"
				                        style="width: 280px; margin-right: 10px;">
				                    <button type="button" class="addr_btn" onclick="" id="checkIdDuplicate">중복확인</button>
				                    <div class="id regex"></div>
				                </div>
				            </li>
				
				            <li>
				                <span class="join_li_title">
				                    <b style="color:red;">·</b>비밀번호</span>
				                <div class="join_li_input">
				                    <input type="password" class="member_pw" id="member_pw" name="password"
				                        placeholder="영문대/소문자, 숫자 4-12자리">
				                    <div class="pw regex"></div>
				                       
				                </div>
				            </li>
				
				            <li>
				                <span class="join_li_title"><b style="color:red;">·</b>비밀번호 확인</span>
				                <div class="join_li_input">
				                    <input type="password" class="member_pw" id="member_pw1">
				                    <div class="repw regex"></div>
				                </div>
				            </li>
				
				            <li>
				                <span class="join_li_title"><b style="color:red;">·</b>닉네임</span>
				                <div class="join_li_input">
				                <input type="text" class="member_nickname" id="member_nickname" name="nickname"
				                	style="width: 280px; margin-right: 10px;">
				                <button type="button" class="addr_btn" onclick="" id="checkNicknameDuplicate">중복확인</button>
				                <div class="name regex"></div>
				                </div>
				            </li>
				
				            <li>
				                <span class="join_li_title2"><b style="color:red;">·</b>이메일</span>
				                <div class="join_li_input2">
				                    <div class="join_li_input_out">
				                        <input type="text" class="member_email" id="member_email" name="email">
				                        <select class="member_email_select" id="member_email_select" onchange="email_select();">
				                            <option value="" selected>직접입력</option>
				                            <option value="@naver.com">naver.com</option>
				                            <option value="@daum.net">daum.net</option>
				                            <option value="@nate.com">nate.com</option>
				                            <option value="@gmail.com">gmail.com</option>
				                        </select>
				                        <div class="email regex"></div>
				                        
				                    </div>
				                    <div class="join_li_input_out_1">
				                        <input type="checkbox" class="member_event" name="member_event" id="member_event" value="Y">
				                        <label for="member_event">정보/이벤트 메일 수신에 동의합니다.</label>
				                    </div>
				                </div>
				            </li>
			          </ul> 
					</td>
				</tr>
				<tr>
					<td style="text-align: center">
						<label class="input-file-button" for="input-file">
						  프로필 사진 등록
						</label>
						<input type="file" id="input-file"  name="upfile" style="display:none" accept="image/*" onchange="setThumbnail(event);"/> 
						<br>
					</td>
				</tr>
			</table>
			<br>
			<label class="join_btns">
            	<div class="join_btns_out">
               	 	<span class="cancel_btn" onclick="join_cn();">취소</span>
                	<span class="join_all_btn" id="enrollSubmit">회원가입</span>
            	</div>
        	</label>
		</form>
	</div>
</div>
</section>
</div>
<form name="checkIdForm">
         <input type="hidden" name="userId" id="checkid">
</form>
<form name="checkNicknameForm">
         <input type="hidden" name="userNickname" id="checkNickname">
</form>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>