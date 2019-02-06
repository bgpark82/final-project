package kh.coupon.mvc.biz;

import java.util.List;

import kh.coupon.mvc.dto.BoardDto;

public interface BoardBiz {
	//공지사항 list
	public List<BoardDto> notice_list();
	
	//board_detail
	public BoardDto board_detail(int board_no);
	
	public int board_insert(int member_no,String board_category, String board_writer, String board_title, String board_content);
}
