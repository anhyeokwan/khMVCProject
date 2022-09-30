<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#noticeView th, #noticeView td{
		border : 1px solid #eee
	}
	
	#noticeContent{
		min-width : 300px;
		text-align : left;
		font-family : ns-light;
	}
	
	.inputCommentBox{
		margin: 50px;
	}
	
	.inputCommentBox>form>ul{
		list-style-type: none;
		display : flex;
	}
	
	.inputCommentBox>form>ul>li:first-child{
		width : 15%;
		display : flex;
		justify-content: center;
		align-items: center;
	}
	
	.inputCommentBox>form>ul>li:first-child>span{
		font-size : 80px;
		color : #ccc;
	}
	
	.inputCommentBox>form>ul>li:nth-child(2){
		width : 75%;
	}
	
	.inputCommentBox>form>ul>li:nth-child(2)>textarea.input-form{
		height: 96px;
		min-height: 96px;
	}
	
	.inputCommentBox>form>ul>li:last-child{
		width:10%;
	}
	
	.inputRecommentBox{
		margin : 30px 0px;
		display : none;
	}
	
	.inputRecommentBox>form>ul{
		list-style-type: none;
		display : flex;
	}
	
	.inputRecommentBox>form>ul>li:first-child{
		width : 15%;
		display : flex;
		justify-content: center;
		align-items: center;
	}
	
	.inputRecommentBox>form>ul>li:first-child:span{
		font-size : 50px;
		color : #ccc;
	}
	
	.inputRecommentBox>form>ul>li:nth-child(2){
		width : 80%;
	}
	
	.inputRecommentBox>form>ul>li:nth-child(2)>textarea.input-form{
		height: 96px;
		min-height: 96px;
	}
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	
	<div class="page-content">
		<div class="page-title">공지사항</div>

	
	<table class="tbl" id="noticeView">
		<tr class="tr-3">
			<th colspan="6">${n.notice_title }</th>
		</tr>
		
		<tr class="tr-1">
			<th class="td-3">작성자</th>
			<td>${n.notice_writer }</td>
			
			<th class="td-3">조회수</th>
			<td>${n.read_count }</td>
			
			<th class="td-3">작성일</th>
			<td>${n.reg_date }</td>
		</tr>
		
		<tr class="tr-1">
			<th class="td-3">첨부파일</th>
			<td colspan="5">
				<c:if test="${not empty n.filename }">
					<img src="/img/file.png" width="16px">
					<a href="/noticeFileDown.do?noticeNo=${n.notice_no }">${n.filename }</a>
				</c:if>
			</td>
		</tr>
		
		<tr>
			<td colspan="6">
				<div id="noticeContent">${n.notice_content }</div>
			</td>
		</tr>
		
		<c:if test="${not empty sessionScope.m && sessionScope.m.member_id eq n.notice_writer }">
			<tr class="tr-1">
			<th colspan="6">
				<a class="btn bc44" href="/noticeUpdateFrm.do?noticeNo=${n.notice_no }">수정</a>
				<button class="btn bc44" onclick="noticeDelete(${n.notice_no });">삭제</button>
			</th>
		</tr>
		</c:if>
		
	</table>
	
	<c:if test="${not empty m }">
		<div class="inputCommentBox">
			<form action="/insertComment.do" method="post">
				<ul>
					<li>
						<span class="material-icons">account_box</span>
					</li>
					
					<li>
						<input type="hidden" name="ncWriter" value="${sessionScope.m.member_id }">
						<input type="hidden" name="noticeRef" value="${n.notice_no }">
						<input type="hidden" name="ncRef" value="0">
						<textarea class="input-form" name="ncContent"></textarea>
					</li>
					
					<li>
						<button type="submit" class="btn bc1 bs4">등록</button>
					</li>
				</ul>
			</form>
		</div>
	</c:if>
	
	
	<div class="commentBox">
	<c:forEach items="${commentList }" var="nc">
		<ul class="posting-comment">
				<li>
					<span class="material-icons">account_box</span>
				</li>
				
				<li>
					<p class="comment-info">
						<span>${nc.nc_writer }</span> 
						<span>${nc.nc_date }</span> 
					</p>
					
					<p class="comment-content">
						${nc.nc_comment }
						<textarea name="ncContent" class="input-form" style="min-height: 96px; display:none;">${nc.nc_comment }</textarea>
					</p>
					
					<p class="comment-link">
					<c:if test="${not empty sessionScope.m }">
						<c:if test="${sessionScope.m.member_id eq nc.nc_writer }">
							<!-- 댓글번호와 내용 게시물 번호가 필요하다-->
							<a href="javascript:void(0)" onclick="modifyComment(this, ${nc.nc_no }, ${n.notice_no });">수정</a> 
							<a href="javascript:void(0)" onclick="deleteComment(this, ${nc.nc_no }, ${n.notice_no });">삭제</a>
						</c:if>
						<a href="javascript:void(0)" class="recShow">답글달기</a> <!-- javascript:void(0) a태그 통제 -->
					</c:if>
					</p>
				</li>
			</ul>
			
			<c:forEach items="${recommentList }" var="ncc">
				<c:if test="${ncc.nc_ref eq nc.nc_no }">
					<ul class="posting-comment reply">
						<li>
							<span class="material-icons">subdirectory_arrow_right</span>
							<span class="material-icons">account_box</span>
						</li>
						
						<li>
							<p class="comment-info">
								<span>${ncc.nc_writer }</span> 
								<span>${ncc.nc_date }</span>
							</p>
							<p class="comment-content">${ncc.nc_comment }</p>
							<textarea name="ncContent" class="input-form" style="min-height: 96px; display:none;">${ncc.nc_comment }</textarea>
							<p class="comment-link">
								<c:if test="${not empty sessionScope.m }">
									<c:if test="${sessionScope.m.member_id eq ncc.nc_writer }"> 대댓글번호, 공지사항번호
										<a href="javascript:void(0)" onclick="modifyComment(this, ${ncc.nc_no }, ${n.notice_no });">수정</a>
										<a href="javascript:void(0)" onclick="deleteComment(this, ${ncc.nc_no }, ${n.notice_no });">삭제</a>
									</c:if>
									<!-- 댓글번호와 내용 게시물 번호가 필요하다-->
									<a href="javascript:void(0)" class="recShow">답글달기</a> <!-- javascript:void(0) a태그 통제 -->
								</c:if>
								
							</p>
						</li>
					</ul>
				</c:if> <!-- 해당 댓글의 대댓글인지 체크하는 if문 종료 -->
			</c:forEach> <!-- 대댓글 출력 for문 종료 -->
			
			<c:if test="${not empty sessionScope.m }">
				<div class="inputRecommentBox">
					<form action="/insertComment.do" method="post">
						<ul>
							<li>
								<span class="material-icons">
									subdirectory_arrow_right
								</span>
							</li>
							
							<li>
								<input type="hidden" name="ncWriter" value="${sessionScope.m.member_id }"> 멤버 아이디
								<input type="hidden" name="noticeRef" value="${n.notice_no }"> 공지사항 번호
								<input type="hidden" name="ncRef" value="${nc.nc_no }"> 댓글 번호
								<textarea class="input-form" name="ncContent"></textarea>
							</li>
							
							<li>
							<button type="submit" class="btn bc1 bs4">등록</button>
							</li>
						</ul>
					</form>
				</div>
			</c:if> <!-- 대댓글달기 form 조건문 -->
			
	</c:forEach> <!-- // 댓글 반복문 종료 답글달기 조건(if문)로그인 체크 -->
		
	</div>
	
	</div>
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	<script>
		function noticeDelete(noticeNo){
			if(confirm("공지사항을 삭제하시겠습니까?")){
				location.href = "/noticeDelete.do?noticeNo=" + noticeNo;
			}
		}
		
		$(".recShow").on("click", function(){
			const idx = $(".recShow").index(this);
			
			if($(this).text() == "답글달기"){
				$(this).text("취소");
			} else{
				$(this).text("답글달기");
			}
			$(".inputRecommentBox").eq(idx).toggle();
			$(".inputRecommentBox").eq(idx).find("textarea").focus();
		});
		
		function modifyComment(obj, ncNo, noticeNo){
			$(obj).parent().prev().show(); // textarea를 화면에 보여줌
			$(obj).parent().prev().prev().hide(); // textarea를 화면에 숨겨줌
			// 수정 -> 수정완료
			$(obj).text("수정완료");
			$(obj).attr("onclick", "modifyComplete(this," + ncNo + "," + noticeNo + ")")
			
			// 삭제 -> 수정취소
			$(obj).next().text("수정취소");
			$(obj).next().attr("onclick", "modifyCancel(this," + ncNo + "," + noticeNo + ")")
			
			// 답글달기버튼 숨김
			$(obj).next().next().hide();
		};
		
		function modifyCancel(obj, ncNo, noticeNo){
			$(obj).parent().prev().hide(); // textarea 숨김
			$(obj).parent().prev().prev().show(); // textarea 기존댓글 보여줌
			
			// 수정완료->수정
			$(obj).prev().text("수정");
			$(obj).prev().attr("onclick", "modifyComment(this," + ncNo + "," + noticeNo + ")");
			
			// 수정 취소
			$(obj).text("삭제");
			$(obj).attr("onclick", "deleteComment(this," + ncNo + "," + noticeNo + ")");
			// 답글달기버튼 보여줌
			$(obj).next().show();
		}
		
		function modifyComplete(obj, ncNo, noticeNo){
			// form태그를 생성해서 전송
			// 1. form태그 생성
			const form = $("<form action='/noticeCommentUpdate.do' method='post'></form>");
			// 2. input태그 생성(ncNo)
			const ncInput = $("<input type='text' name='ncNo'>");
			ncInput.val(ncNo);
			// form태그에 추가
			form.append(ncInput);
			
			// 3. input태그 생성(noticeNo)
			const noticeInput = $("<input type='text' name='noticeNo'>");
			noticeInput.val(noticeNo);
			form.append(noticeInput);
			
			// 4. textarea
			const ncContent = $(obj).parent().prev();
			form.append(ncContent);
			
			// body태그에 form태그를 추가
			$("body").append(form);
			
			// form태그 전송
			form.submit();
		}
		
		function deleteComment(obj, ncNo, noticeNo){
			if(confirm("댓글을 삭제하시겠습니까?")){
				location.href = "/deleteNoticeComment.do?ncNo=" + ncNo + "&noticeNo=" + noticeNo;
			}
		}
	</script>
</body>
</html>





















