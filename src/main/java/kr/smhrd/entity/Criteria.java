package kr.smhrd.entity;

import lombok.Data;

@Data
public class Criteria {
	private int page; //현재 페이지 번호
	private int perPageNum; // 한 페이지 당 몇개의 게시물을 보여줄건지
	// 검색기능에 필요한 변수
	private String type;
	private String keyword;
	public Criteria() {
		this.page=1;
		this.perPageNum=10;
	}
	
	// 현재 페이지의 게시글 시작 번호
	public int getPageStart() {
		return (page-1)*perPageNum; //1->0
	}	
	
}
