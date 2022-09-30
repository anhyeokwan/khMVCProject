<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<div class="page-content">
		<div class="page-title">공지사항</div>
		
		<c:if test="${not empty sessionScope.member && sessionScope.member.memberLevel eq 1 }">
			<a class="btn bc4 writenBTn" href="/noticeWriterFrm.do">글쓰기</a>
		</c:if>
		
		<table class="tbl tbl-hover notice-tbl">
			<tr class="tr-2">
				<td style="width:10%">번호</td>
				<td style="width:45%">제목</td>
				<td style="width:15%">작성자</td>
				<td style="width:20%">작성일</td>
				<td style="width:10%">조회수</td>
			</tr>
			
			<c:forEach items="${list }" var="n">
				<tr class="tr-1">
					<td>${n.notice_no }</td>
					<td>
						<a href="/noticeView.do?noticeNo=${n.notice_no }">${n.notice_title }</a> <%-- 번호를 이용해서 notice상세페이지 들어가기 --%>
					</td>
					<td>${n.notice_writer }</td>
					<td>${n.reg_date }</td>
					<td>${n.read_count }</td>
			</tr>
			</c:forEach>
			
		</table>
		<div class="pageNavi">${pageNavi }</div>
	</div>
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>