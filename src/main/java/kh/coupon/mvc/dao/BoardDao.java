package kh.coupon.mvc.dao;

import java.util.List;

import kh.coupon.mvc.dto.BoardDto;

public interface BoardDao {
	String NAMESPACE = "board.";
	
	public List<BoardDto> notice_list();
	
	public BoardDto board_detail(int board_no);
	
	public int board_insert(BoardDto boardDto);
	
	public int board_update(int board_no, String board_title, String board_content);
	
	public int board_delete(int board_no);
	
	public List<BoardDto> review_list(String board_category); 
	public BoardDto review_detail(int board_no); //공지사항 게시판하고 같이쓰자
	public int review_insert(BoardDto review_dto);
	public int review_update(BoardDto review_dto);
	public int review_delete(int board_no);
	public int updateHit(int board_no);
}
