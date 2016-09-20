<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="study.jsp.mysite.MyBatisConnectionFactory"%>
<%@page import="study.jsp.mysite.model.Member"%>
<%@page import="org.apache.logging.log4j.LogManager"%>
<%@page import="org.apache.logging.log4j.Logger"%>
<%@page import="study.java.helper.WebHelper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<%
	/** WebHelper + Log4j */
	WebHelper helper = WebHelper.getInstance(request, response, out);
	Logger logger = LogManager.getLogger(request.getRequestURI());

	// 세션정보 얻어오기
	Member loginInfo = (Member) session.getAttribute("member");

	/** 데이터베이스 접속하기 */
	SqlSessionFactory sqlSessionFactory = MyBatisConnectionFactory.getSqlSessionFactory();
	SqlSession sqlSession = sqlSessionFactory.openSession();

	/** 현재 회원이 작성한 댓글과의 참조를 해제한다. */
	try {
		sqlSession.update("BBSCommentMapper.outMember", loginInfo.getId());
	} catch (Exception e) {
		logger.error(e.getMessage());
	}
	
	/** 현재 회원이 작성한 게시물과의 참조를 해제한다. */
	try {
		sqlSession.update("BBSDocumentMapper.outMember", loginInfo.getId());
	} catch (Exception e) {
		logger.error(e.getMessage());
	}
	
	/** 탈퇴 수행 */
	int result = 0;

	try {
		// 회원 탈퇴를 위한 delete 기능 호출
		result = sqlSession.delete("MemberMapper.doOut", loginInfo.getId());
	} catch (Exception e) {
		// 에러가 난 경우 처리할 내용이 있다면 구현한다.
		logger.error(e.getMessage());
	} finally {
		if (result > 0) {
			sqlSession.commit();
		}
		// 데이터베이스 접속 해제하기
		sqlSession.close();
	}
	
	// 예외처리
	if (result < 1) {
		helper.redirect(null, "탈퇴에 실패했습니다. 관리자에게 문의바랍니다.");
		return;
	}
	
	/** 탈퇴되었으므로 강제 로그아웃 처리 */
	session.invalidate();
	String url = "../index.jsp";
	helper.redirect(url, "탈퇴되었습니다.");
%>