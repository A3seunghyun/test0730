<%@page import="dto.UserDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDao0730"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
		String id = (String) session.getAttribute("loginId");
    	MemberDao0730 dao = new MemberDao0730();
		ArrayList<UserDto> uDto = dao.users(id);
    
    %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>내부평가 -메인페이지</title>
	<link rel="stylesheet" href="css/main.css">
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
	$(function () {
		$("#logout").click(function () {
			location.href = 'LogoutServlet';
		})
		
		$(".course-card").click(function () {
			let title = $(this).attr("id");
			let price = $(this).find(".price").text().replace(",","").replace("포인트","");
			let myPoint = $("#my-point").text().replace(",","").replace("포인트 : ","").replace("점","");
			let id = "<%=id%>";
			
			if(price > myPoint){
				alert("포인트가 부족합니다. 광고를 클릭하세요.");
			} else if(price <= myPoint){
				let point = myPoint - price;
				$("#my-point").html("포인트 : "+point+"점");
				$.ajax({
					type: "post",
					data: {id: id, title: title, price: price, myPoint: myPoint},
					url: "PoductBuyServlet",
					success: function (res) {
						alert("컨텐츠("+title+")를 구입하였습니다.");
					},
					error: function (r, s, e) {
						alert("[에러] code:" + r.status + ", message:" + r.responseText + ", error:"+e)
					}
					
				});
			}

		})
		
		$(".ad-image").click(function () {
			let id = "<%=id%>";
			let myPoint = $("#my-point").text().replace(",","").replace("포인트 : ","").replace("점","");
			let ranNum = Math.random();
			let num = Math.floor(ranNum*1000+1);
			
			$.ajax({
				type: "post",
				data: {id: id, point: num, myPoint: myPoint},
				url: "AccumulateServlet",
				success: function (res) {
					alert(num+"점이 적립되었습니다.");
// 					location.href = "koreaisacademy.com";
				},
				error: function (r, s, e) {
					alert("[에러] code:" + r.status + ", message:" + r.responseText + ", error:"+e)
				}
				
			});
			
		})
	})
	</script>
</head>
<body>
   <header>
        <h1 style="margin-left : 10px;">메인페이지</h1>
        <div class="user-info">
        	<%for(UserDto dto : uDto){ %>
            <span><%=dto.getName() %>(<%=dto.getId() %>)님 안녕하세요.</span>
            <span id="my-point">포인트 : <%=dto.getPoint() %>점</span>
            <%} %>
            <button id="logout">로그아웃</button>
        </div>
    </header>
    <main>
        <h2 style="text-align:left;">구입할 컨텐츠를 선택하세요.</h2>
        <div class="courses">
            <div class="course-card" id="intro">
                <img src="img/Intro_350_408.png">
                <p class="price">100,000포인트</p>
            </div>
            <div class="course-card" id="java">
                <img src="img/Java_350_408.png">
                <p class="price">500,000포인트</p>
            </div>
            <div class="course-card" id="C++">
                <img src="img/Cpp_350_408.png">
                <p class="price">300,000포인트</p>
            </div>
        </div>
        <div class="ad">
            <div class="ad-image" style="border:1px solid #eee;">
               <p style="color:black; text-align: left;"> &lt;광고&gt; </p>
               <img src="img/korea_it.png">
            </div>
        </div>
    </main>
</body>
</html>