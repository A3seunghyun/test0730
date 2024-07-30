<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내부평가 -로그인</title>
    <link rel="stylesheet" href="css/login.css">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		$(function () {
			$("#signupPage").click(function () {
				location.href = "signup.jsp";
			})
		})
	</script>
</head>
<body>
    <div class="login-container">
        <form class="login-form" action="LoginServlet" method="post">
            <h2>로그인</h2>
            <div>
                <label for="id">ID :</label>
                <input type="text" id="id" name="id">
            </div>
            <div>
                <label for="pw">PW :</label>
                <input type="password" id="pw" name="pw">
            </div>
            <button type="submit">로그인</button>
            <button type="button" id="signupPage">회원가입</button>
        </form>
    </div>
</body>
</html>