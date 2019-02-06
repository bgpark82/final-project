package kh.coupon.mvc.biz_impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.coupon.mvc.biz.BoardBiz;
import kh.coupon.mvc.dao.BoardDao;
import kh.coupon.mvc.dto.BoardDto;

@Service
public class BoardBiz_impl implements BoardBiz{

	@Autowired
	private BoardDao board_dao;
	
	@Override
	public List<BoardDto> notice_list() {
		return board_dao.notice_list();
	}

	@Override
	public BoardDto board_detail(int board_no) {
		return board_dao.board_detail(board_no);
	}

	@Override
	public int board_insert(int member_no,String board_category, String board_writer, String board_title, String board_content) {
		BoardDto boardDto = new BoardDto(member_no, board_category, board_title,board_content, board_writer);
		return board_dao.board_insert(boardDto);
	}

}
