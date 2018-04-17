<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>login form</title>

    <!-- Bootstrap -->
   <link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- font awesome -->
    <link
	href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- Custom Style -->
    <link href="css/style.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
    $(document).ready(function(){
        $("#btnLogin").click(function(){
            // 태크.val() : 태그에 입력된 값
            // 태크.val("값") : 태그의 값을 변경 
            var CustomerId = $("#CustomerId").val();
            var CustomerPw = $("#CustomerPw").val();
            if(userId == ""){
                alert("아이디(사업자등록번호)를 입력하세요.");
                $("#CustomerId").focus(); // 입력포커스 이동
                return; // 함수 종료
            }
            if(CustomerPw == ""){
                alert("비밀번호를 입력하세요.");
                $("#CustomerPw").focus();
                return;
            }
            // 폼 내부의 데이터를 전송할 주소
            document.form1.action="${path}/items/loginCheck"
            // 제출
            document.form1.submit();
        });
    });
</script>
</head>
<body>
<h2>로그인</h2>
    <form name="form1" method="post">
        <table border="1" width="400px">
            <tr>
                <td>아이디</td>
                <td><input name="CustomerId" id="CustomerId"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="CustomerPw" id="CustomerPw"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <a href="loginCheck"><button type="button" id="btnLogin">로그인</button></a>
                <c:if test="${msg == 'failure'}">
                    <div style="color: red">
                        아이디 또는 비밀번호가 일치하지 않습니다.
                    </div>
                </c:if>
                <c:if test="${msg == 'logout'}">
                    <div style="color: red">
                        로그아웃되었습니다.
                    </div>
                </c:if>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>




