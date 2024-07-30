<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String id = (String)request.getAttribute("id");
    	String pw = (String)request.getAttribute("pw");
    	String name = (String)request.getAttribute("name");
    	int point = (Integer)request.getAttribute("point");
    %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>내부평가 -회원관리-수정관리자</title>
	<link rel="stylesheet" href="css/signup.css">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<div class="signup-container">
        <form class="signup-form" action="UserInfoEditServlet"  method="post">
            <h2>회원관리-수정관리자</h2>
            <div>
                <label for="id">ID :</label>
                <input type="text" id="id" name="id" value="<%=id %>" readonly>
            </div>
            <div>
                <label for="pw">PW :</label>
                <input type="password" id="pw" name="pw" value="<%=pw%>">
            </div>
            <div>
                <label for="name">Name :</label>
                <input type="text" id="name" name="name" value="<%=name%>">
            </div>
            <div>
                <label for="point">point :</label>
                <input type="text" id="point" name="point" value="<%=point%>">
            </div>
            <button type="submit" id="complete">제출</button>
        </form>
    </div>
</body>
</html>