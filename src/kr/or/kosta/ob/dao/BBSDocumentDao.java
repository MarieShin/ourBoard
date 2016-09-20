package kr.or.kosta.ob.dao;

import java.util.List;

import kr.or.kosta.ob.model.BBSDocument;

/** 게시판 글 관리 기능 정의 */
public interface BBSDocumentDao {

	/**
	 * 게시물을 작성한다.
	 * @param document - 게시물 작성 정보
	 * @return int
	 */
	public int doWrite(BBSDocument document);
	
	/**
	 * 게시물을 수정한다.
	 * @param document - 게시물 수정 정보
	 * @return int
	 */
	public int doEdit(BBSDocument document);
	
	/**
	 * 게시물을 삭제한다.
	 * - 게시물의 일련번호와 비밀번호를 필요로 하기 때문에
	 * 	 Beans의 객체를 파라미터로 받는다.
	 * @param document - 게시물 삭제 정보
	 * @return int
	 */
	public int doDelete(BBSDocument document);
	
	/**
	 * 게시물의 전체 수를 조회한다.
	 * @return int
	 */
	public int getCount();
	
	/**
	 * 특정 게시물의 데이터를 조회한다.
	 * @param id
	 * @return BBSDocument
	 */
	public BBSDocument getDocumentItem(int id);
	
	/**
	 * 게시물 목록을 조회한다.
	 * @return List<BBSDocument>
	 */
	public List<BBSDocument> getDocumentList();
	
	/**
	 * 이전 글을 조회한다.
	 * @param id - 현재 글 일련번호
	 * @return BBSDocument
	 */
	public BBSDocument getPrevItem(int id);
	
	/**
	 * 다음 글을 조회한다.
	 * @param id - 현재 글 일련번호
	 * @return BBSDocument
	 */
	public BBSDocument getNextItem(int id);
	
	/**
	 * 조회수를 1증가 시킨다.
	 * @param id - 현재 글 일련번호
	 * @return BBSDocument
	 */
	public int doUpdateHit(int id);
	
	/**
	 * 게시물의 비밀번호를 검사한다.
	 */
	public int checkPassword(BBSDocument document);
	
	/**
	 * 특정 회원이 작성한 댓글에 대하여 일괄적으로 회원번호를 null로 변경한다.
	 * --> 탈퇴 처리에 필요함
	 * @param member_id - 회원 일련번호
	 * @return int
	 */
	public int outMember(int member_id);
}
