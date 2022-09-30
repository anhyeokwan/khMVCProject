<%@page import="nbd.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	Member member = (Member)request.getAttribute("member");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% if(member == null){ %>)
		<h3>회원을 조회할 수 없습니다.</h3>
	<%} else{ %>
		<ul>
        <li>아이디 : <%=member.getMember_id() %></li>
        <li>이름 : <%=member.getMember_name() %></li>
        <li>전화번호 : <%=member.getMember_phone() %></li>
        <li>주소 : <%=member.getMember_addr() %></li>
    </ul>
	<%} %>
</body>
</html>