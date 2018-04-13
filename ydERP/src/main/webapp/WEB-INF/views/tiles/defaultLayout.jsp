<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html> 
  <head>
  
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>YedamERP</title>

<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link
	href="${pageContext.request.contextPath}/resources/dist/css/sb-admin-2.css" rel="stylesheet">
<!-- Morris Charts CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/morrisjs/morris.css" rel="stylesheet">
<!-- Custom Fonts -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<!--  Jquery UI CSS -->
<link
	href="${pageContext.request.contextPath}/resources/jquery/jquery-ui.min.css" rel="stylesheet">
<!-- jQuery -->
<script
	src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<!-- Bootstrap Core JavaScript -->
<script
	src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<!-- Chat -->
<link href="${pageContext.request.contextPath}/resources/chat/chat.css" rel="stylesheet">

</head>

<body>

	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/erp">YedamERP</a>
			</div>
		</nav>

		<tiles:insertAttribute name="menu" />

		<div id="page-wrapper">
			<div class="row">
				<div class="col-lg-12">
					<h1 class="page-header"></h1>
				</div>		
			</div>
			<tiles:insertAttribute name="content" />			
			
			<!-- Metis Menu Plugin JavaScript -->
			<script
				src="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.js"></script>
			<!-- Custom Theme JavaScript -->
			<script
				src="${pageContext.request.contextPath}/resources/dist/js/sb-admin-2.js"></script>
		</div>
			
	<!-- chat -->
				
	<div id="chat">		
	Live Q&A
	<div id="chatlogin">	상호명<input type="text" id="nickname">
 	<input type="button" id="enterBtn" value="입장" onclick="login()" >
 	</div>
	<div id="chat-area">	
	<textarea id="messageWindow" rows="20" cols="41" readonly="readonly"></textarea>
	<br /> <input id="inputMessage" type="text" />
	<input type="button"
	value="보내기" onclick="send()" />
	<input type="button" value="나가기" onclick="logout()" />	
	</div>		


</div>			
	</div>

</body>
<script type="text/javascript">
var textarea = document.getElementById("messageWindow");
var webSocket 
var inputMessage = document.getElementById('inputMessage');
var clientID	

	//채팅방 로그인
	function login(){
		document.getElementById("chatlogin").style.display="none";
		document.getElementById("chat-area").style.display="block";			
		clientID =document.getElementById("nickname").value; 
		webSocket = new WebSocket('ws://localhost:80/erp/websocket/broadcast.do');
		
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
			textarea.value += event.data + "\n";
		}
		function onOpen(event) {
			textarea.value += "연결 성공\n";
		} 
		function onError(event) {
			console.log(event);
			alert(event.data); 
		}
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
	function logout(){
	document.getElementById("chat-area").style.display="none";
	document.getElementById("chatlogin").style.display="block";
	};

</script>
</html>
