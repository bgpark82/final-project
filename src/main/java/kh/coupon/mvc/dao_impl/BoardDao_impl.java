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

	@Override
	public int board_update(int board_no, String board_title, String board_content) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_no", board_no);
		map.put("board_title", board_title);
		map.put("board_content", board_content);
		return sqlSession.update(NAMESPACE+"board_update",map);
	}

	@Override
	public int board_delete(int board_no) {
		return sqlSession.delete(NAMESPACE+"board_delete",board_no);
	}
	
	
	//review
	@Override
	public List<BoardDto> review_list(String board_category) {
		List<BoardDto> res = null;
		try {
			res = sqlSession.selectList(NAMESPACE+"review_list",board_category);
		} catch(Exception e) {
			System.out.println("daoImpl review_list 에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public BoardDto review_detail(int board_no) {
		BoardDto review_dto = null;
		try {
			review_dto = sqlSession.selectOne(NAMESPACE+"review_detail",board_no);
		} catch(Exception e) {
			System.out.println("daoImpl review_detail 실패");
			e.printStackTrace();
		}
		return review_dto;
	}

	@Override
	public int review_insert(BoardDto review_dto) {
		int res = sqlSession.insert(NAMESPACE+"review_insert",review_dto);
		if(res>0) {
			System.out.println("daoImpl review_insert 성공");
		} else {
			System.out.println("daoImpl review_insert 실패");
		}
		return res;
	}

	@Override
	public int review_update(BoardDto review_dto) {
		int res = sqlSession.update(NAMESPACE+"review_update",review_dto);
		if(res>0) {
			System.out.println("daoImpl review_update 성공");
		} else {
			System.out.println("daoImpl review_update 실패");
		}
		return res;
	}

	@Override
	public int review_delete(int board_no) {
		int res = sqlSession.delete(NAMESPACE+"review_delete",board_no);
		if(res>0) {
			System.out.println("daoImpl review_delete 성공");
		} else {
			System.out.println("daoImpl review_delete 실패");
		}
		return res;
	}

	@Override
	public int updateHit(int board_no) {
		int res = sqlSession.update(NAMESPACE+"updateHit",board_no);
		if(res>0) {
			System.out.println("조회수 증가 성공");
		} else {
			System.out.println("조회수 증가 실패");
		}
		return res;
	}
	

}
