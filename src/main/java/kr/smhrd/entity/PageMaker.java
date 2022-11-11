package kr.smhrd.entity;

import lombok.Data;

@Data
public class PageMaker {
	private Criteria cri; // page, perPageNum
	private int totalCount; // 총 게시물의 수
	private int displayPageNum=10; // 하단에 출력되는 페이지 개수
	private int startPage; // 시작페이지 번호
	private int endPage; // 끝페이지 번호
	private boolean prev; // 이전 버튼(true, False)
	private boolean next; // 다음 버튼(true, False)
	
	//전체 게시글의 수를 저장하는 메서드
	public void setTotalCount(int totalCount) {
		this.totalCount=totalCount;
		pageMaker();
	}
	
	// 페이징 처리에 필요한 계산하는 메서드(*가장 중요*)
	private void pageMaker() {
		// 1. 화면에 보여질 마지막 페이지 번호 구하기 (계산수식)
		endPage=(int)(Math.ceil(cri.getPage()/(double)displayPageNum)*displayPageNum);
		// 2. 화면에 보여질 시작 페이지 번호
		startPage=endPage-displayPageNum+1;
		if(startPage<=0) startPage=1;
		// 3. 전체 마지막 페이지 계산
		int tempEndPage=(int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
		// 4. 화면에 보여질 마지막 페이지의 유효성 검사
		if(tempEndPage<endPage) {
			endPage=tempEndPage;
		}
		// 5. 이전페이지 버튼 존재 여부
		prev=(startPage==1) ? false : true;
		// 6. 다음페이지 버튼 존재 여부
		next=(endPage<tempEndPage) ? true : false;
	}
	
}
