<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- 아이콘 라이브러리 link -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

	<!-- 제이쿼리 import -->
	<script src="${ path }/js/jquery-3.6.0.min.js"></script>
	
	<!-- 채팅을 위한 SockJS import -->
	<script src="${ path }/resources/js/sockjs.min.js"></script>
<style>
	*{margin:0;padding:0;}
	.chatContainer{
		width:400px;
		height:550px;
		position:fixed;
		
		bottom:25px;
	}
	.chatTable{
		width:400px;
		height:550px;
		border:1px solid gray;
	}
	.chatTable tr.chatHeader{
		width:100%;
		height:60px;
	}
	.chatTable tr.chatHeader td.iconArea{
		width:60px;
		font-size:2.5em;
		text-align:center;
	}
	.chatTitle{
		width:150px; font-size:0.8em; float:left; margin:10px 0 0 10px;
	}
	.chatTable tr.chatHeader td.headerCont table tr td.windowController div{
		float:left;
		position:relative;
	}
	.chatTable tr.chatHeader td.headerCont table tr td.windowController div.windowSize{
		top: -10px; left: 80px; width:30px; height:30px; border: 1px solid gray; text-align:center;
	}
	.chatTable tr.chatHeader td.headerCont table tr td.windowController div.windowClose{
		top: -10px; left: 85px; width:30px; height:30px; border: 1px solid gray; text-align:center;
	}
	.chatTable tr.chatHeader td.headerCont table tr td.windowController div.chatCount{
		top: 0px; left: 50px; font-size:0.8em;
	}
	.chatTable tr.chatSection{
		width:100%;
		height:auto;
	}
	.chatTable tr.chatSection td{
		width:100%;
		max-height:430px;
		vertical-align:top;
	}
	.chatTable tr.chatSection td div.chatArea{
		width:100%;
		height:430px;
		overflow:scroll;
		overflow-x:hidden;
		-ms-overflow-style: none; /*IE , Edge */
	}
	.chatTable tr.chatSection td div.chatArea::-webkit-scrollbar {
    	display: none; /* Chrome, Safari, Opera*/
	}
	.chatTable tr.chatSection td div.msgLine{
		display:table;
		border:1px solid gray;
		min-width:50%;
	}
	.chatTable tr.chatSection td div.msgLine div.time{
		width:50px; height:15px; border:1px solid gray; font-size:0.5em;
	}
	.chatTable tr.chatSection td div.msgLine div.recvTime{
		display:table-cell;
		/*float:right;*/
	}
	.chatTable tr.chatSection td div.msgLine div.sendTime{
		display:table-cell;
		/*float:left;*/
	}
	.chatTable tr.chatFooter{
		width:100%;
		height:60px;
	}
	#textSend{
		margin-left:15px;
		width:300px; height:20px;
	}
	#btnSend{
		width:50px; height:24px;
	}
	.fixit{
		float:left;
	}
	
	/*채팅 말풍선 CSS*/
	.msg{
		font-size:0.7em;
	}
	.fleft{float:left;}
	.fright{float:right;}
	/* 보낸 메시지 */
	.sendMsg {
		min-width:100px;
		max-width:225px;
		position: relative;
		display:table;
		padding: 5px;
		background: #ccffda;
		-webkit-border-radius: 10px;
		-moz-border-radius: 10px;
		border-radius: 10px;
		
		float:right;
		margin-right:20px;
		margin-top:8px;
	}
	.sendMsg:after {
		content: '';
		position: absolute;
		border-style: solid;
		border-width: 5px 0 5px 10px;
		border-color: transparent #ccffda;
		display: block;
		width: 0;
		z-index: 1;
		right: -10px;
		top: 14px;
	}
	/* 받은 메시지 */
	.recvMsg {
		min-width:100px;
		max-width:225px;
		position: relative;
		display:table;
		padding: 5px;
		background: #f2f2f2;
		-webkit-border-radius: 10px;
		-moz-border-radius: 10px;
		border-radius: 10px;
		
		float:left;
		margin-left:20px;
		margin-top:8px;
	}
	.recvMsg:after {
		content: '';
		position: absolute;
		border-style: solid;
		border-width: 5px 10px 5px 0;
		border-color: transparent #f2f2f2;
		display: block;
		width: 0;
		z-index: 1;
		left: -10px;
		top: 14px;
	}
	
	.chatMini {
		width:240px;
		height:40px;
		border:1px solid gray;
		float:left;
		position:fixed;
		bottom:0px;
		display:none;
	}
	
	.chatMini div {
		width:30px;
		height:30px;
		border:1px solid gray;
		float:left;
		text-align:center;
		margin:5px 0 0 6px;
	}
	
</style>
</head>
<body>
	<div class="chatContainer">
		<form id="chatForm">
		<table border="1" class="chatTable">
			<tr class="chatHeader">
				<td class="iconArea">
					<div>
						<i class="fa fa-comments" aria-hidden="true"></i>					
					</div>
				</td>
				<td class="headerCont">
					<table cellspacing="10" cellpadding="0">
						<tr>
							<td class="chatTitle">
								[챌린지 채팅방 제목]
							</td>
							<td class="windowController">
								<div class="windowSize">
									<i class="fa fa-window-minimize" aria-hidden="true"></i>
								<!--  
									<i class="fa fa-window-maximize" aria-hidden="true"></i>
								-->	
								</div>
								<div class="windowClose">
									<i class="fa fa-times" aria-hidden="true"></i>
								</div>
								<div class="chatCount">
									현재 인원 : 00명
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr class="chatSection">
				<td colspan="2">
					<div class="chatArea">
					<!-- 
					###############################
						  !! 채팅이 표시될 자리 !!
					###############################
					 -->
					</div>
				</td>
			</tr>
			<tr class="chatFooter">
				<td colspan="2">
					<!-- <form id="chatForm"> -->
						<input type="hidden" id="chatId" name="chatId" value="${ loginMember.id }"/>
						<div class="fixit">
							<input type="text" name="inputMessage" placeholder="send message..." id="textSend"/>
						</div>
						<div class="fixit">
							<input type="submit" value="전송" id="btnSend"/>
						</div>
					<!-- </form> -->
				</td>
			</tr>
		</table>
		</form>
	</div>
	
	<!-- 최소화 -->
	<div class="chatMini">
		<p class="chatTitle">[챌린지 채팅방 제목]</p>
			<div>
				<i class="fa fa-window-maximize" aria-hidden="true"></i>
			</div>
			<div>
				<i class="fa fa-times" aria-hidden="true"></i>
			</div>
	</div>
	
	<script type="text/javascript">
		// 전역 변수 선언 - 모든 홈페이지에서 사용할 수 있게 index에 저장
		var socket = null;
		var id = "<c:out value='${ loginMember.id }'/>";
		// #session_id 이거 지정해줘야함 어'떻'하지...? -해결 : ChatController에서 chatRoom()메소드에서 loginMember의 id 값 받아옴
		$(document).ready(function(){
			//if(!isEmpty($("#chatId").val())) connectWS();
			connectWS();
		});
		
		function connectWS(){
			var sock = new SockJS("${ path }/echo");
			
			socket = sock;
			
			sock.onopen = function() { console.log('info : connection opened.'); };
			
			sock.onmessage = function(e){
				// 메시지를 ":"를 기준으로 나눠서 
				// 0번째 배열은 아이디 확인 가능
				// 1번째 배열은 메시지 내용
				var msgArr = e.data.split(" : ");
				
				// 0번째 배열값(아이디)가 접속한 id(var id="<c:out value='${loginMember.id}'/>")의 값과 다를 경우
				// = 내 아이디값과 다른 아이디가 메시지를 보냈을 경우
				// = 메시지를 받을 경우
				console.log("msgArr[0] : "+msgArr[0]);
				
				if(msgArr[0] != id){
					recvMsg(e.data);
				} else {
				// 0번째 배열값(아이디)가 접속한 id(var id="<c:out value='${loginMember.id}'/>")의 값과 같은 경우
				// = 내 아이디가 메시지를 보냈을 경우
				// = 메시지를 보낼 경우
					sendMsg(e.data);
				}
			};
			
			sock.onclose = function(){
				$(".chatArea").append("<p>연결이 종료되었습니다.</p>");
			};
			
			sock.onerror = function(error) {console.log('Error : ', errs);};
			
			$("#chatForm").submit(function(event){
				event.preventDefault();
				
				sock.send($("#chatId").val() + " : " + $("#textSend").val());
				
				$("#textSend").val('').focus();
			});
		}
		
		function getTime(){
			var now = new Date();
			
			var hours = now.getHours(); //시
			var minutes = now.getMinutes(); //분
			
			return hours+":"+minutes;
		}
		
		// 보낸 메시지
		function sendMsg(msg){
			$(".chatArea").append("<div class='msgLine fright'><div class='time sendTime'>"+getTime()+"</div><div class='msg sendMsg'><p>"+msg+"</p></div></div>");
		}
		
		// 받은 메시지
		function recvMsg(msg){
			$(".chatArea").append("<div class='msgLine fleft'><div class='msg recvMsg'><p>"+msg+"</p></div><div class='time recvTime'>"+getTime()+"</div></div>");
		}
	
		
	</script>
</body>
</html>