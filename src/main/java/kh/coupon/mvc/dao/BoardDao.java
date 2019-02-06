package kh.coupon.mvc.dao;

import java.util.List;

import kh.coupon.mvc.dto.BoardDto;

public interface BoardDao {
	String NAMESPACE = "board.";
	
	public List<BoardDto> notice_list();
	
	public BoardDto board_detail(int board_no);
	
	public int board_insert(BoardDto boardDto);
}
