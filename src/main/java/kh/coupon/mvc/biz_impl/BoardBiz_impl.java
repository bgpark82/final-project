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

	@Override
	public int board_update(int board_no, String board_title, String board_content) {
		return board_dao.board_update(board_no, board_title, board_content);
	}

	@Override
	public boolean board_delete(int board_no) {
		if(board_dao.board_delete(board_no) > 0) {
			return true;
		}
		return false;
	}
	
	@Override
	public List<BoardDto> review_list(String board_category) {
		return board_dao.review_list(board_category);
	}

	@Override
	public BoardDto review_detail(int board_no) {
		return board_dao.review_detail(board_no);
	}

	@Override
	public int review_insert(BoardDto review_dto) {
		return board_dao.review_insert(review_dto);
	}

	@Override
	public int review_update(BoardDto review_dto) {
		return board_dao.review_update(review_dto);
	}

	@Override
	public int review_delete(int board_no) {
		return board_dao.review_delete(board_no);
	}

	@Override
	public int updateHit(int board_no) {
		return board_dao.updateHit(board_no);
	}
}
