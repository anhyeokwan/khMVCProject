<%@page import="kr.or.iei.notice.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	Notice n = (Notice)request.getAttribute("n");
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#noticeUpdateFrm td, #noticeUpdateFrm th{
		border : 1px solid #eee;
	}
	
	.file-box{
		display : flex;
		align-items : center;
		justfy-content : center;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	
	<div class="page-content">
		<div class="page-title">공지사항 수정</div>
	</div>
	
	<form action="/noticeUpdate.do" method="post" enctype="multipart/form-data">
		
		<table class="tbl" id="noticeUpdateFrm">
			<tr class="tr-1">
				<th class="td-3">제목</th>
				<td>
					<input type="hidden" name="noticeNo" value="<%=n.getNotice_no()%>">
					<%-- 기존파일을 지웠는지 체크용도 --%>
					<input type="hidden" name="status" value="stay">
					<input type="text" name="noticeTitle" class="input-form" value="<%=n.getNotice_title()%>">
				</td>
			</tr>
				
			<tr class="tr-1">
				<th class="td-3">첨부파일</th>
				<td>
				<%if(n.getFilepath() != null){ %>
					<img src="img/file.png" width="16px" class="delFile">
					<span class="delFile"><%=n.getFilename() %></span>
					<button type="button" class="btn bc1 delFile">삭제</button>
					<input type="file" name="upfile" style="display : none;"> <!-- type:file은 value를 사용할 수 없음 -->
					<input type="hidden" name="oldFilepath" value="<%=n.getFilepath() %>">
					<input type="hidden" name="oldFilename" value="<%=n.getFilename() %>">
				<%}else{ %>
					<input type="file" name="upfile">
				<%} %>
				<td>
			</tr>
				
			<tr class="tr-1">
				<th class="td-3">내용</th>
				<td>
					<textarea type="text" name="noticeContent" class="input-form" value="<%=n.getNoticeContentBr()%>"></textarea>
				</td>
			</tr>
			
			<tr class="tr-1">
				<th colspan="2">
					<button type="submit" class="btn bc4 bs4">수정완료</button>
				</th>
			</tr>
			
		</table>
		
	</form>
	
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	<script>
		$("button.delFile").on("click", function(){
			$(".delFile").hide();
			$(this).next().show();
			$("[name=status]").val("delete");
		})
	</script>
</body>
</html>
















