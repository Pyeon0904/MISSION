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
	<!-- <script src="../resources/js/sockjs.min.js"></script> -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script>
<style>
	*{margin:0;padding:0;}
	.chatContainer{
		width:400px;
		height:570px;
		position:fixed;
		bottom:-18px;
		display:none;
	}
	.chatTable{
		width:400px;
		height:550px;
		border:1px solid lightgray;
		border-radius:10px 10px 0 0;
		background:rgba(255,255,255,0.7);
	}
	.chatTable tr.chatHeader{
		width:100%;
		height:60px;
		background-color:#F6F6F6;
		border-radius:10px;
	}
	.chatTable tr.chatFooter{
		width:100%;
		height:60px;
		background-color:#022039;
	}
	.chatTable tr.chatHeader td.iconArea{
		width:50px;
		font-size:2.5em;
		text-align:center;
		border-radius:10px 0 0 0;
		color:#380f0f;
	}
	.chatTitle{
		width:180px; font-size:0.9em; float:left; margin:10px 0 0 5px;
		overflow:hidden; text-overflow:ellipsis; white-space:nowrap;
	}
	.chatTable tr.chatHeader .chatTitle{
		width:250px;font-size:0.9em; float:left; margin:10px 0 0 5px;
		overflow:hidden; text-overflow:ellipsis; white-space:nowrap;
	}
	.chatTable tr.chatHeader td.headerCont{border-radius:0 10px 0 0;}
	.chatTable tr.chatFooter td{}
	.chatTable tr.chatHeader td.headerCont table tr td.windowController{
		width:65px;height:35px;
		float:left;
		position:relative;
		top:-13px;
		left:20px;
	}
	.chatTable tr.chatHeader td.headerCont table tr td.windowController div{
		float:left;
	}
	.chatTable tr.chatHeader td.headerCont table tr td.windowController div.windowMin{
		width:30px; height:30px; border-radius:7px; text-align:center;line-height:2.5; 
	}
	.chatTable tr.chatHeader td.headerCont table tr td.windowController div.windowClose{
		width:30px; height:30px;  
		border-radius:7px; text-align:center; line-height:1; 
		font-size:2em;color:#b5645b;
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
		/*border:1px solid gray;*/
		min-width:51%;
	}
	.chatTable tr.chatSection td div.msgLine div.time{
		width:50px; height:10px;/* border:1px solid gray; */font-size:0.5em;
	}
	.chatTable tr.chatSection td div.msgLine div.recvTime{
		display:table-cell;
		text-align:left;
	}
	.chatTable tr.chatSection td div.msgLine div.sendTime{
		display:table-cell;
		text-align:right;
	}
	#textSend{
		margin-left:15px;
		width:300px; height:22px;
		border:1px solid #022039;
		padding:0 5px 0 5px;
		background:#ebffeb;
	}
	#btnSend{
		width:50px; height:22px; border:none; background:#065291; color:#ebffeb; font-weight:bold;margin-top:1px;
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
		background: #97fd97;
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
		border-color: transparent #97fd97;
		display: block;
		width: 0;
		z-index: 1;
		right: -7px;
		top: 10px;
	}
	/* 받은 메시지 */
	.recvMsg {
		min-width:100px;
		max-width:225px;
		position: relative;
		display:table;
		padding: 5px;
		background: #f0f0f0;
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
		border-color: transparent #f0f0f0;
		display: block;
		width: 0;
		z-index: 1;
		left: -7px;
		top: 12px;
	}
	
	.chatMini {
		width:300px;
		height:35px;
		border:1px solid lightgray;
		border-radius:10px 10px 0 0;
		float:left;
		position:fixed;
		bottom:0px;
		display:none;
		background-color:#F6F6F6;
	}
	
	.chatMini .winCont {
		width:30px;
		height:30px;
		float:left;
		text-align:center;
		margin:5px 0 0 2px;
		position:relative;
		left:20px;
	}
	.chatMini .mini_icon{font-size:1.5em; margin-left:5px;}
	.chatMini .windowClose{font-size:1.5em; top:-7px; color:#b5645b;}
	
td,th,caption{font-family:'맑은 고딕', 'malgun', Dotum, sans-serif;font-size:15px;color:#333;letter-spacing:0px}
    	
/* table */
table.table01 {border-collapse:separate;border-spacing:0;line-height:1.5;border-top:1px solid #ccc;border-left:1px solid #ccc;margin:auto;}
table.table01 th {padding: 10px;font-weight: bold;vertical-align: middle;text-align:center;border-right:1px solid #ccc;border-bottom:1px solid #ccc;border-top:1px solid #fff;border-left:1px solid #fff;background:#eee;}
table.table01 td {padding:10px;vertical-align:middle;border-right:1px solid #ccc;border-bottom:1px solid #ccc;}
</style>
 <script type="text/javascript">
		var id = "<c:out value='${ loginMember.id }'/>";
		
		var webSocket = {
			init: function(param) {
				this._url = param.url;
				this._initSocket();
			},
			sendChat: function(e) {
				this._sendMessage('${param.bang_id}', '${param.user_id}', 'CMD_MSG_SEND', $("#chatId").val() +' : '+ $('#textSend').val());
				$('#textSend').val('').focus();
				//e.preventDefault();
			},
			sendEnter: function(e) {
				this._sendMessage('${param.bang_id}', '${param.user_id}', 'CMD_ENTER', $("#chatId").val() +' : '+ $('#textSend').val());
				$('#textSend').val('').focus();
			},
			/////////////////////////////////////////////////////
			receiveMessage: function(msgData) {
				// 정의된 CMD 코드에 따라서 분기 처리
				if(msgData.cmd == 'CMD_MSG_SEND') {					
					// 메시지를 ":"를 기준으로 나눠서 
					// 0번째 배열은 아이디 확인 가능
					// 1번째 배열은 메시지 내용
					var msgArr0 = msgData.msg.split(" : ");
					
					// 0번째 배열값(아이디)가 접속한 id(var id="<c:out value='${loginMember.id}'/>")의 값과 다를 경우
					// = 내 아이디값과 다른 아이디가 메시지를 보냈을 경우
					// = 메시지를 받을 경우
					console.log("msgArr[0] : "+msgArr0[0]);
					
					if(msgArr0[0] != id){
						recvMsg(msgData.msg);
					} else {
					// 0번째 배열값(아이디)가 접속한 id(var id="<c:out value='${loginMember.id}'/>")의 값과 같은 경우
					// = 내 아이디가 메시지를 보냈을 경우
					// = 메시지를 보낼 경우
						sendMsg(msgData.msg);
					}
				}
				// 입장
				else if(msgData.cmd == 'CMD_ENTER') {
					
					$(".chatArea").append('<div class="msgLine" style="width:100%; text-align:center;">'+ msgData.msg + '</div>');
					$(".chatArea").scrollTop($(".chatArea")[0].scrollHeight);
				}
				// 퇴장
				else if(msgData.cmd == 'CMD_EXIT') {
					
					$(".chatArea").append('<div class="msgLine" style="width:100%; text-align:center;">'+ msgData.msg + '</div>');
					$(".chatArea").scrollTop($(".chatArea")[0].scrollHeight);
				}
			},
			closeMessage: function(str) {
				$(".chatArea").append('<div>' + '연결 끊김 : ' + str + '</div>');
			},
			disconnect: function() {
				this._socket.close();
			},
			_initSocket: function() {
				this._socket = new SockJS(this._url);
				this._socket.onopen = function(evt) {
					webSocket.sendEnter();
				};
				this._socket.onmessage = function(evt) {
					webSocket.receiveMessage(JSON.parse(evt.data));
				};
				this._socket.onclose = function(evt) {
					webSocket.closeMessage(JSON.parse(evt.data));
				}
			},
			_sendMessage: function(bang_id, user_id, cmd, msg) {
				var msgData = {
						bang_id : bang_id,
						user_id : user_id,
						cmd : cmd,
						msg : msg
				};
				var jsonData = JSON.stringify(msgData);
				this._socket.send(jsonData);
			}
		};
		
		function getTime(){
			var now = new Date();
			
			var hours = now.getHours(); //시
			var minutes = now.getMinutes(); //분
			
			if(hours < 10) {
				hours = "0" + hours;
			} 
			if(minutes < 10) {
				minutes = "0" + minutes;
			}
			
			return hours+":"+minutes;
		}
		
		// 보낸 메시지
		function sendMsg(msg){
			$(".chatArea").append("<div class='msgLine fright'><div class='time sendTime'>"+getTime()+"</div><div class='msg sendMsg'><p>"+msg+"</p></div></div>");
			$(".chatArea").scrollTop($(".chatArea")[0].scrollHeight);
		}
		
		// 받은 메시지
		function recvMsg(msg){
			$(".chatArea").append("<div class='msgLine fleft'><div class='msg recvMsg'><p>"+msg+"</p></div><div class='time recvTime'>"+getTime()+"</div></div>");
			$(".chatArea").scrollTop($(".chatArea")[0].scrollHeight);
		}
	</script>
	<script type="text/javascript">
        $(window).on('load', function () {
			webSocket.init({ url: '<c:url value="/echo" />' });	
		});
	</script>
</head>
<body>
	<div class="chatContainer">
		<!-- <form id="chatForm"> -->
		<table class="chatTable" cellspacing="0" cellpadding="0">
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
								<c:out value="${ cTitle }"/>
							</td>
							<td class="windowController">
								<div class="windowMin">
									<i class="fa fa-window-minimize" aria-hidden="true"></i>
								</div>
								<div class="windowClose">
									<i class="fa fa-times" aria-hidden="true"></i>
								</div>
								<div class="chatCount">
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
						<input type="hidden" id="chatId" name="chatId" value="${ loginMember.id }"/>
						<div class="fixit">
							<input type="text" name="inputMessage" placeholder="send message..." id="textSend" 
								onkeypress="if(event.keyCode==13){webSocket.sendChat();}"/>
						</div>
						<div class="fixit">
							<input type="button" value="전송" id="btnSend" onclick="webSocket.sendChat()"/>
						</div>
				</td>
			</tr>
		</table>
		<!-- </form>-->
	</div>
	
	<!-- 최소화 -->
	<div class="chatMini">
		<div class="mini_icon fixit"><i class="fa fa-comments" aria-hidden="true"></i></div>
		<div class="chatTitle fixit">${ cTitle }</div>
			<div class="windowMax winCont">
				<i class="fa fa-window-maximize" aria-hidden="true"></i>
			</div>
			<div class="windowClose winCont">
				<i class="fa fa-times" aria-hidden="true"></i>
			</div>
	</div>
	<script>	
		$(document).ready(() => {
			$(".windowMin").on("click", () => {
				$(".chatContainer").animate({height:'toggle'}, 500);
				$(".chatMini").fadeIn(300);
			});
			$(".windowMax").on("click", () => {
				$(".chatMini").fadeOut(300);
				$(".chatContainer").animate({height:'toggle'}, 500);
			});
			$(".windowClose").on("click", () => {
				$(".chatContainer").fadeOut(300);
				$(".chatMini").fadeOut(300);
			});
			$(".btnChat").on("click", () => {
				$(".chatContainer").animate({height:'toggle'}, 500);
			});
		});
	</script>
</body>
</html>