<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	String name = (String)request.getAttribute("name");
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%if(name != null){ %>
	
		<!-- <script type="text/javascript">
			location.href="/forward.do";
		</script> -->
	
		<jsp:forward page="/WEB-INF/views/forward2.jsp"/> <!-- 다른 페이지가 처리하게 만드는 것이다. --> 
	<%} %>
	
	<h1>forward1</h1>
	<h2><%=name %></h2>
	
	
</body>
</html>