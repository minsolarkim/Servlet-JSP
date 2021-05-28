<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청</title>
</head>
<body>
	<h2>요청(응답 forward)</h2>
	<form>
		아이디 : <input type="text" name="id"><br>
		패스워드 : <input type="text" name="pwd"><br>
		<input type="button" value="포워딩(forward)"
				onclick="send_forward(this.form)">
<!-- 		submit은 자동적으로 서버쪽으로 전송 ! // button은 그냥 버튼임 -->
<!-- 		form 태그에 버튼이 하나만 있을 경우에는 자동으로 submit되기도 함 	 -->
	</form>
<script>
		function send_forward(frm) {
			//포워딩 방식으로 응답처리 --- form에 action 처리 안하고 이렇게도 해봄
			frm.action = "ex11_resp_forward.jsp";
			frm.submit(); //submit(); 괄호 꼭
		}
</script>
</body>
</html>
<%
	//포워딩 처리(위임, 전가)
// 	request.getRequestDispatcher("ex11_resp_forward-2.jsp");
	RequestDispatcher rd =  request.getRequestDispatcher("ex11_resp_forward-2.jsp");
	rd.forward(request, response);
	//request, response -- 변수 선언한 적 없지만 이미 선언이 되어있음--servlet에
	
	//요청?하면 parameter값 가지고 응답한다? ??????? 잘 모르겠숴요
			
	
	
%>






