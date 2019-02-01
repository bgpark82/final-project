package kh.coupon.mvc.biz_impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.coupon.mvc.biz.ReviewBiz;
import kh.coupon.mvc.dao.ReviewDao;
import kh.coupon.mvc.dto.ReviewDto;

@Service
public class ReviewBizImpl implements ReviewBiz {
	
	@Autowired
	private ReviewDao review_dao;

	@Override
	public List<ReviewDto> review_list() {
		return review_dao.review_list();
	}
	
	@Override
	public List<ReviewDto> review_list_seven() {
		return review_dao.review_list_seven();
	}

	@Override
	public List<ReviewDto> review_list_bear() {
		return review_dao.review_list_bear();
	}

	@Override
	public List<ReviewDto> review_list_magic() {
		return review_dao.review_list_magic();
	}

	@Override
	public ReviewDto review_detail(int review_no) {
		return review_dao.review_detail(review_no);
	}

	@Override
	public int review_insert(ReviewDto review_dto) {
		return review_dao.review_insert(review_dto);
	}

	@Override
	public int review_update(ReviewDto review_dto) {
		return review_dao.review_update(review_dto);
	}

	@Override
	public int review_delete(int review_no) {
		return review_dao.review_delete(review_no);
	}

	@Override
	public int updateHit(int review_no) {
		return review_dao.updateHit(review_no);
	}

	
}
