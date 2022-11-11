package kr.smhrd.repository;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.smhrd.entity.Board;
import kr.smhrd.entity.Criteria;
import kr.smhrd.entity.Member;

// JDBC API(CRUD)->생산성이 떨어진다, 유지보수하기가 어렵다(Java+SQL) 
// MyBatis Framework : Java<--분리개발(mapping)--->SQL(xml)
// http://mybatis.org
public interface BoardMapper {
	// 전체리스트를 가져오는 메서드 => 전체리스트x 해당페이지의 10개만 가져오기
	public List<Board> getList(Criteria cri); // select SQL~
	// 등록 메서드
	public void register(Board vo); // insert SQL~
	//상세보기(idx=3)
	public Board get(int idx); // select SQL~ 
	//삭제
	public void remove(int idx); // delete SQL~
	//수정
	public void update(Board vo);// update SQL~
	//조회수 누적
	public void countUpdate(int idx);// update SQL~
	//로그인 처리
	public Member login(Member member); // select SQL~
	
	// bseq를 1씩 증가시키는 메서드
	public void replySeqUpdate(Board parent);	
	// 답글 insert
	public void replyInsert(Board vo);	// insert SQL~
	// 전체 게시물의 개수
	public int totalCount(Criteria cri);
	
	@Select("select * from reply where title like concat('%',#{keyword},'%')")
	public List<Board> getJsonList(String keyword); // select * from reply
}
