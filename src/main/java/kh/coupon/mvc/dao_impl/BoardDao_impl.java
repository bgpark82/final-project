package kh.coupon.mvc.dao_impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.coupon.mvc.dao.BoardDao;
import kh.coupon.mvc.dto.BoardDto;

@Repository
public class BoardDao_impl implements BoardDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<BoardDto> notice_list() {
		return sqlSession.selectList(NAMESPACE+"notice_list");
	}

	@Override
	public BoardDto board_detail(int board_no) {
		return sqlSession.selectOne(NAMESPACE+"board_detail",board_no);
	}

	@Override
	public int board_insert(BoardDto boardDto) {
		sqlSession.insert(NAMESPACE+"board_insert",boardDto);
		int board_no = boardDto.getBoard_no();
		return board_no;
	}
	
	

}
