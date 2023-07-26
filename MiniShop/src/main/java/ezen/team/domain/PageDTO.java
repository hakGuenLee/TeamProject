package ezen.team.domain;

import lombok.Getter;
import lombok.Setter;

//페이지네이션

@Getter
@Setter
public class PageDTO {
	private int viewPage = 1; //currentPage 현재 페이지
	// 2가 될 경우
	private int blockSize = 5;
	private int blockNum; //블럭의 위치 // 0
	private int blockStart; //블럭의 시작값 // 0   //1
	private int blockEnd; //블럭 마지막값 // 0   // 5
	private int prevPage; //이전 페이지 // 0
	private int nextPage; //다음 페이지  // 6
	private int totalPage;
	private int totalCnt;
	private int startRowNum;
	

	
	private int startIndex; // 각 페이지별 시작 옵셋(시작값) // 0
	private int cntPerPage = 10; // 페이지별 게시글 수 == limit

	private String searchType;
	private String keyWord;
	
	public void setValue(int totalCnt, int cntPerPage) {// 처음에는 113, 10이 넘어옴
		this.totalCnt = totalCnt;
		//전체 페이지 수 구하기
		
		this.totalPage = (int)Math.ceil((double)totalCnt/cntPerPage);  // 전체 게시글 수 (113) / 10     
										
		//페이지별 시작값
		this.startIndex = (viewPage-1)*cntPerPage;   // 2일경우 (2-1)*10 > 
			//10
		// 현재 페이지의 블럭 위치 : 0부터 시작
		
		this.blockNum = (viewPage-1)/blockSize; // 2일 경우 (2-1)/5 > 5
	  	//5
		//블럭의 시작값 : 1, 6, 11, 
		this.blockStart = (blockSize*blockNum)+1;
		//1 
		this.blockEnd = blockStart+(blockSize - 1); 
		if(blockEnd > totalPage) blockEnd = totalPage;
		//5
		//이전 페이지
		this.prevPage = blockStart - 1;
		//1 > 0
		//다음 페이지
		this.nextPage = blockEnd + 1;
		// 6
		// nextPage는 전체 페이지를 초과할 수 없다
		if(nextPage > totalPage) nextPage = totalPage;
		
		//행번호 구하기
		// totalCnt(전체게시글 수) : 116, cntPerPage : 10, totalPage : 12   내림차순정렬

		// 1페이지 > 116 ~ 106
		// 2페이지 > 105

		//startRowNum : 페이지 시작 번호
		//1페이지 시작 번호 : totalCnt - 0
		//2페이지 시작 번호 : totalCnt - 10
		//3페이지 시작 번호 : totalCnt - 20

		startRowNum = totalCnt - (viewPage - 1)*cntPerPage;
		
		
	}

}
