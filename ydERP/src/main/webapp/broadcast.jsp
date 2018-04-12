<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YDERP</title>
</head>
 
<body>
	<fieldset>
		<textarea id="messageWindow" rows="30" cols="30" readonly="true"></textarea>
		<br /> <input id="inputMessage" type="text" /> <input type="button"
			value="send" onclick="send()" />
	</fieldset>
</body>
<script type="text/javascript">
	var textarea = document.getElementById("messageWindow");
	var webSocket = new WebSocket('ws://localhost:80/erp/websocket/broadcast.do');
	var inputMessage = document.getElementById('inputMessage');
	var clientID = "hong";	
	webSocket.onerror = function(event) {
		onError(event)
	};
	webSocket.onopen = function(event) {
		onOpen(event)
	};
	webSocket.onmessage = function(event) {
		onMessage(event)
	};
	function onMessage(event) {
		textarea.value += "상대 : " + event.data + "\n";
	}
	function onOpen(event) {
		textarea.value += "연결 성공\n";
	} 
	function onError(event) {
		console.log(event);
		alert(event.data); 
	}
	function send(){
		// 서버로 전송할 데이터를 담을 msg 객체 생성.
		var msg ={
		cmd:"message",
		msg: document.getElementById("inputMessage").value,
		id: clientID	
		};
		// Send the msg object as a JSON-formatted string.
		webSocket.send(JSON.stringify(msg));
		// Blank the text input element, ready to receive the next line of text from the user.
		document.getElementById("inputMessage").value ="";
		}
</script>
</html>