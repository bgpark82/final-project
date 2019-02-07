package kh.coupon.mvc.biz;

import java.util.List;

import kh.coupon.mvc.dto.BoardDto;

public interface BoardBiz {
	//공지사항 list
	public List<BoardDto> notice_list();
	
	//공지사항 글보기
	public BoardDto board_detail(int board_no);
	
	//공지사항 입력
	public int board_insert(int member_no,String board_category, String board_writer, String board_title, String board_content);
	
	//공지사항 수정
	public int board_update(int board_no,String board_title, String board_content);
	
	//공지사항 삭제
	public boolean board_delete(int board_no);
	
	
	public List<BoardDto> review_list(String board_category);
	public BoardDto review_detail(int board_no);
	public int review_insert(BoardDto review_dto);
	public int review_update(BoardDto review_dto);
	public int review_delete(int board_no);
	public int updateHit(int board_no);
}
