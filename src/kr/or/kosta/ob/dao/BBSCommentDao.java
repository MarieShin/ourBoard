package kr.or.kosta.ob.dao;

import java.util.List;

import kr.or.kosta.ob.model.BBSComment;

/** 특정 게시물에 대한 덧글 관리 기능 정의 */
public interface BBSCommentDao {

	/**
	 * 댓글 작성 
	 * @param comment - 저장할 댓글 정보
	 * @return int
	 */
	public int doWrite(BBSComment comment);
	
	/**
	 * 댓글 수정
	 * @param comment - 수정할 댓글 정보
	 * @return int
	 */
	public int doEdit(BBSComment comment);
	
	/**
	 * 댓글 삭제
	 * @param comment - 삭제할 댓글 정보(일련번호 + 비밀번호)
	 * @return int
	 */
	public int doDelete(BBSComment comment);
	
	/**
	 * 댓글 하나의 내용을 조회한다.
	 * @param id - 댓글 일련번호
	 * @return BBSComment
	 */
	public BBSComment getCommentItem(int id);

	/**
	 * 특정 게시물에 속한 댓글 목록을 조회한다.
	 * @param bbsDocumentId - 게시물 일련번호
	 * @return List<BBSComment>
	 */
	public List<BBSComment> getCommentList(int bbsDocumentId);

	/**
	 * 댓글의 비밀번호를 검사한다.
	 */
	public int checkPassword(BBSComment doument);

	/**
	 * 특정 게시물에 소속된 댓글을 일괄적으로 삭제한다.
	 * @param bbsDocumentId - 게시물 일련번호
	 * @return int
	 */
	public int doDeleteAll(int bbsDocumentId);
	
	/**
	 * 특정 회원이 작성한 댓글에 대하여 일괄적으로 회원번호를 null로 변경한다. 
	 * @param member_id - 회원 일련번호
	 * @return int
	 */
	public int outMember(int member_id);
}
