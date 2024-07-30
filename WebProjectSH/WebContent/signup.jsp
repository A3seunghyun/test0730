<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내부평가 -회원가입</title>
    <link rel="stylesheet" href="css/signup.css">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
    <div class="signup-container">
        <form class="signup-form" action="SignupServlet"  method="post">
            <h2>회원가입</h2>
            <div>
                <label for="id">ID :</label>
                <input type="text" id="id" name="id" required>
            </div>
            <div>
                <label for="pw">PW :</label>
                <input type="password" id="pw" name="pw" required>
            </div>
            <div>
                <label for="name">Name :</label>
                <input type="text" id="name" name="name" required>
            </div>
            <button type="submit" id="complete">작성완료</button>
        </form>
    </div>
</body>
</html>