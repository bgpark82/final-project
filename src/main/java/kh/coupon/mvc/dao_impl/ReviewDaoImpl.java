package kh.coupon.mvc.dao_impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.coupon.mvc.dao.ReviewDao;
import kh.coupon.mvc.dto.ReviewDto;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<ReviewDto> review_list() {
		List<ReviewDto> res = null;
		try {
			res = sqlSessionTemplate.selectList(namespace+"review_list");
		} catch(Exception e) {
			System.out.println("daoImpl review_list 에러");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public List<ReviewDto> review_list_seven() {
		List<ReviewDto> res = null;
		try {
			res = sqlSessionTemplate.selectList(namespace+"review_list_seven");
		} catch(Exception e) {
			System.out.println("daoImpl review_list_seven 에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<ReviewDto> review_list_bear() {
		List<ReviewDto> res = null;
		try {
			res = sqlSessionTemplate.selectList(namespace+"review_list_bear");
		} catch(Exception e) {
			System.out.println("daoImpl review_list_bear 에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<ReviewDto> review_list_magic() {
		List<ReviewDto> res = null;
		try {
			res = sqlSessionTemplate.selectList(namespace+"review_list_magic");
		} catch(Exception e) {
			System.out.println("daoImpl review_list_magic 에러");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public ReviewDto review_detail(int review_no) {
		ReviewDto review_dto = null;
		try {
			review_dto = sqlSessionTemplate.selectOne(namespace+"review_detail",review_no);
		} catch(Exception e) {
			System.out.println("daoImpl review_detail 실패");
			e.printStackTrace();
		}
		return review_dto;
	}

	@Override
	public int review_insert(ReviewDto review_dto) {
		int res = sqlSessionTemplate.insert(namespace+"review_insert",review_dto);
		if(res>0) {
			System.out.println("daoImpl review_insert 성공");
		} else {
			System.out.println("daoImpl review_insert 실패");
		}
		return res;
	}

	@Override
	public int review_update(ReviewDto review_dto) {
		int res = sqlSessionTemplate.update(namespace+"review_update",review_dto);
		if(res>0) {
			System.out.println("daoImpl review_update 성공");
		} else {
			System.out.println("daoImpl review_update 실패");
		}
		return res;
	}

	@Override
	public int review_delete(int review_no) {
		int res = sqlSessionTemplate.delete(namespace+"review_delete",review_no);
		if(res>0) {
			System.out.println("daoImpl review_delete 성공");
		} else {
			System.out.println("daoImpl review_delete 실패");
		}
		return res;
	}

	@Override
	public int updateHit(int review_no) {
		int res = sqlSessionTemplate.update(namespace+"updateHit",review_no);
		if(res>0) {
			System.out.println("조회수 증가 성공");
		} else {
			System.out.println("조회수 증가 실패");
		}
		return res;
	}

	
	
	

}
