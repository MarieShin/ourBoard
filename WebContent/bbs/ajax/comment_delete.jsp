<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%@ page import="study.java.helper.WebHelper"%>
<%@ page import="study.java.helper.RegexHelper"%>
<%@ page import="study.jsp.mysite.model.BBSComment"%>
<%@ page import="study.jsp.mysite.model.Member"%>
<%@ page import="study.jsp.mysite.model.BBSComment"%>
<%@ page import="study.jsp.mysite.MyBatisConnectionFactory"%>
<%@ page import="org.apache.ibatis.session.SqlSession"%>
<%@ page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page import="org.apache.logging.log4j.LogManager"%>
<%@ page import="org.apache.logging.log4j.Logger"%>

<%
	/** 파라미터 받기 */
	WebHelper helper = WebHelper.getInstance(request, response, out);
	int comment_id = helper.getInt("comment_id");

	/** 로그 기록하기 */
	Logger logger = LogManager.getLogger(request.getRequestURI());
	logger.debug("comment_id=" + comment_id);

	if (comment_id < 1) {
		helper.printJsonRt("댓글 일련번호가 없습니다.");
		return;
	}

	boolean my_comment = false;

	Member myinfo = (Member) session.getAttribute("member");

	if (myinfo != null) {
		int my_member_id = myinfo.getId();

		SqlSessionFactory sqlSessionFactory = MyBatisConnectionFactory.getSqlSessionFactory();
		SqlSession sqlSession = sqlSessionFactory.openSession();

		BBSComment comment = null;

		try {
			comment = sqlSession.selectOne("BBSCommentMapper.getCommentItem", comment_id);
		} catch (Exception e) {
			logger.error(e.getMessage());
		} finally {
			sqlSession.close();
		}

		if (comment != null) {
			if (comment.getMemberId() == my_member_id) {
				my_comment = true; // 내가 작성한 글
			}
		}

	}
%>

<form class="delete_comment" method="post"
	action="ajax/delete_comment.jsp">
	<input type="hidden" name="comment_id" value='<%=comment_id%>' />

	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
		<h4 class="comment_delete_title">댓글 삭제 확인</h4>
	</div>

	<div class="modal-body">

		<%
			if (my_comment == false) {
		%>
		<p>댓글 작성시 설정한 비밀번호를 입력하세요.</p>
		<div class="form-group">
			<input type="password" class="form-control" name="pwd" />
		</div>

		<%
			} else {
		%>

		<p>정말 댓글을 삭제하시겠습니까?</p>
		<input type="hidden" name="is_mine" value="Y" />

		<%
			}
		%>

	</div>
	<div class="modal-footer">
		<button type="button" class="btn btn-defalut" data-dismiss="modal">닫기</button>
		<button type="submit" class="btn btn-danger">삭제</button>
	</div>
</form>
