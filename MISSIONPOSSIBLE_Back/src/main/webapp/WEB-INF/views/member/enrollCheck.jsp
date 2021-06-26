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
<title>이용약관</title>
<style>
/*회원가입 부분*/
.section_agree {
  height: auto;
  margin-top: 25px;
  margin-bottom: 25px;
}
.agreeout {
  width: 1100px;
  height: auto;
  margin: 0 auto;
}
.agreeout > p {
  text-align: center;
  font-family: "Open Sans", sans-serif;
  font-size: 20px;
  font-weight: 700;
}
.agree_ulcss {
  width: 100%;
  height: auto;
  margin-top: 50px;
  font-family: "Nanum Gothic", sans-serif;
}
.agree_ulcss > li:nth-of-type(1) {
  width: 100%;
  height: 30px;
  line-height: 30px;
  border-bottom: 1px solid #959595;
  font-size: 16;
  font-weight: 700;
  font-family: 'Nanum Gothic', sans-serif;
}
.agree_ulcss > li:nth-of-type(2) {
  height: 80px;
  line-height: 80px;
}
.agree_ulcss > li:nth-of-type(2) > span {
  float: left;
}
.agree_ulcss > li:nth-of-type(3) {
  height: 40px;
  display: flex;
  flex-direction: row;
  align-items: center;

}
.agree_ulcss > li:nth-of-type(4) {
  width: 100%;
  height: 120px;
  border-top: 0;
}
.agree_ulcss > li:nth-of-type(5) {
  height: 40px;
  display: flex;
  flex-direction: row;
  align-items: center;
  margin-top: 30px;
}
.agree_ulcss > li:nth-of-type(6) {
  width: 100%;
  height: 120px;
  border-top: 0;
}
.agree_ulcss > li:nth-of-type(7) {
  width: 100%;
  height: 100px;
  text-align: center;
  line-height: 100px;

}
.agree_text1,
.agree_text2{
  width: 1100px;
  height: 120px;
  overflow:auto;
  border-top: 2px solid #959595;
  font-family: 'Noto Sans KR', sans-serif;
  padding-top:5px;
  padding-left:10px;
  font-size: 14px;
  background-color: rgba(250, 250, 250, 0.4);
  line-height: 1.5em;
}
.next_btn {
  width: 220px;
  height: 40px;
  border: 0;
  background-color: black;
  color: white;
  cursor: pointer;
  font-family: "Nanum Gothic", sans-serif;
}
ol,
ul {
  list-style: none;
  margin: 0;
  padding: 0;
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
</head>
<body>
<script>
    function all_check() {
        var checkuse = document.getElementById("allagree").checked;
        if (checkuse == true) {
            document.getElementById("agree1").checked = true;
            document.getElementById("agree2").checked = true;
        }
        else {
            document.getElementById("agree1").checked = false;
            document.getElementById("agree2").checked = false;
        }
    }
    function nece() {
        var cks1 = document.getElementById("agree1").checked;
        var cks2 = document.getElementById("agree2").checked;

        if (csk1 == false || csk2 == false) {
            document.getElementById("allagree").checked = false;
        }
    }
    function agree_btn() {
        var cks1 = document.getElementById("agree1").checked;
        var cks2 = document.getElementById("agree2").checked;
        if (cks1 == false || cks2 == false) {
            alert("약관에 모두 동의 하셔야만 회원가입이 진행 됩니다.");
        }
        else {
            member_agree.method = "get";
            member_agree.action = "${path}/member/enroll";
            member_agree.submit();
        }
    }
</script>

<div id="box">
      <section id="section">
         <div id="conbox">
			<div class="agreeout">
			    <p>JOIN US</p>
			    <form name="member_agree" id="member_agree">
			        <ul class="agree_ulcss">
			            <li>약관동의</li>
			            <li>
			                <span><input type="checkbox" name="allck" id="allagree" onclick="all_check();"></span>
			                <label style="float: left;" for="allagree" >
			                    <b>모든 약관을 확인하고 전체 동의합니다.</b>
			                </label>
			                (전체동의, 선택항목도 포함됩니다.)
			            </li>
			            <li style="width: 100%;">
			                <input type="checkbox" name="agree1" id="agree1" onclick="nece();">
			                <label for="agree1" style="margin:0 5px 0 5px"><b>(필수)</b>이용약관</label>
			            </li>
			            <li>
			                <textarea readonly="readonly" style="resize:none" class="agree_text1" id="agree_text1">
			제1조(목적)
			
			표준약관 제10023호
			
			이 약관은 회사(전자거래 사업자)가 운영하는 사이버 작전(이하 "작전"이라 한다)에서 제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 사이버몰과 이용자의 권리·의무 및 책임사항을 규정함을 목적으로 합니다.
			※ 「PC통신등을 이용하는 전자거래에 대해서도 그 성질에 반하지 않는한 이 약관을 준용합니다」
			
			
			제2조(정의)
			
			① "작전"이란 회사가 재화 또는 용역을 이용자에게 제공하기 위하여 컴퓨터등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.
			② "이용자"란 "작전"에 접속하여 이 약관에 따라 "작전"이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.
			③ ‘회원’이라 함은 "작전"에 개인정보를 제공하여 회원등록을 한 자로서, "작전"의 정보를 지속적으로 제공받으며, "작전"이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
			④ ‘비회원’이라 함은 회원에 가입하지 않고 "작전"이 제공하는 서비스를 이용하는 자를 말합니다.
			
			
			제3조(약관등의 명시와 설명 및 개정)
			
			① "작전"은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호·모사전송번호·전자우편주소, 사업자등록번호, 통신판매업신고번호, 개인정보 보호책임자등을 이용자가 쉽게 알 수 있도록 "작전"의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
			② "작전"은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회·배송책임·환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
			③ "작전"은 전자상거래등에서의소비자보호에관한법률, 약관의규제에관한법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진등에관한법률, 방문판매등에관한법률, 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
			④ "작전"이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일이전부터 적용일자 전일까지 공지합니다.
			다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "작전“는 개정전 내용과 개정후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
			⑤ "작전"이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간내에 "작전"에 송신하여 "작전"의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
			⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자보호지침 및 관계법령 또는 상관례에 따릅니다.
			                </textarea>
			            </li>
			            <li>
			                <input type="checkbox" name="agree2" id="agree2" onclick="nece();">
			                <label for="agree2" style="margin:0 5px 0 5px"><b>(필수)</b>개인정보 수집 및 이용</label> 
			            </li>
			            <li>
			                <textarea readonly="readonly" style="resize:none" class=agree_text2 id="agree_text2">
			1. - 목적 : 이용자 식별 및 본인여부 확인
			- 항목 : 이름, 아이디, 비밀번호
			- 보유 및 이용기간 : 회원탈퇴 후 5일까지
			
			2. - 목적 : 민원 등 고객 고충처리
			- 항목 : 이메일, 휴대전화번호
			- 보유 및 이용기간 : 회원탈퇴 후 5일까지
			
			3. - 목적 : 만 14세 미만 아동 확인
			- 항목 : 법정 생년월일
			- 보유 및 이용기간 : 회원탈퇴 후 5일까지
			
			                </textarea>
			            </li>
			            <li style="width: 100%;">
			                <button type="button" class="btn btn-outline-success btn-lg" onclick="agree_btn();">다음단계</button>
			            </li>
			        </ul>
			    </form>
			 </div>
		</div>
	</section>
</div>
</body>
</html>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>