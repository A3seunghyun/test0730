<%@page import="dto.MemberDto0730"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDao0730"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
		String id = (String) session.getAttribute("loginId");
    	if (id == null || !id.equals("admin")) {
	%>
    <script>
        location.href = "main.jsp";
    </script>
	<%
    	}
	%>
    
    <%
    
    	MemberDao0730 dao = new MemberDao0730();
    	ArrayList<MemberDto0730> mDto = dao.memberList();
    %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내부평가 -관리자페이지</title>
    <link rel="stylesheet" href="css/adminPage.css">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script type="text/javascript">
		$(function () {
			$(document).on("click", "#edit-btn", function () {
				let id = $(this).parent().parent().find("#id").text();
				let pw = $(this).parent().parent().find("#pw").text();
				let name = $(this).parent().parent().find("#name").text();
				let point = $(this).parent().parent().find("#point").text();
				location.href = "AdminEditServlet?id="+id+"&pw="+pw+"&name="+name+"&point="+point
			})
			
			$(document).on("click", "#delete-btn", function () {
				let id = $(this).parent().parent().find("#id").text();
				
				location.href = "UserInfoDeleteServlet?id="+id
			})
		})
	</script>
</head>
<body>
    <div class="container">
        <div class="login-button">
            <button type="button">로그인</button>
        </div>
        <div class="content">
            <h2>회원관리</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>PW</th>
                        <th>Name</th>
                        <th>Point</th>
                        <th>수정</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody>
                	<% for(MemberDto0730 dto : mDto){ %>
                    <tr>
                        <td id="id"><%=dto.getId() %></td>
                        <td id="pw"><%=dto.getPw() %></td>
                        <td id="name"><%=dto.getName() %></td>
                        <td id="point"><%=dto.getPoint() %></td>
                        <td><button type="button" id="edit-btn">수정</button></td>
                        <td><button type="button" id="delete-btn">삭제</button></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <h2>스케줄러관리</h2>
            <div class="scheduler-buttons">
                <button type="button">스케줄러(20초마다 포인트 1 증가) 실행 시작</button>
                <button type="button">스케줄러 실행 종료</button>
            </div>
        </div>
    </div>
</body>
</html>