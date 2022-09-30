<%@page import="nbd.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% 
    	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%if(list.isEmpty()){ %>
		<h2>회원정보가 없습니다.</h2>
	<%}else{ %>
		<table border="1">
        <tr>
            <th>회원번호</th>
            <th>아이디</th>
            <th>비밀번호</th>
            <th>이름</th>
            <th>전화번호</th>
            <th>주소</th>
            <th>등급</th>
            <th>가입날짜</th>
        </tr>
    <%for(int i = 0; i < list.size(); i++){ %>
    <% Member member = list.get(i); %>
    <tr>
    	<td><%=member.getMember_no() %></td>
    	<td><%=member.getMember_id() %></td>
    	<td><%=member.getMember_pw() %></td>
    	<td><%=member.getMember_name() %></td>
    	<td><%=member.getMember_phone() %></td>
    	<td><%=member.getMember_addr() %></td>
    	<td><%=member.getMember_level() %></td>
    	<td><%=member.getEnroll_date() %></td>
    </tr>
    
    <%} %>
    </table>
	<%} %>
</body>
</html>




















