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
	public List<ReviewDto> review_list(String board_category) {
		return review_dao.review_list(board_category);
	}

	@Override
	public ReviewDto review_detail(int board_no) {
		return review_dao.review_detail(board_no);
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
	public int review_delete(int board_no) {
		return review_dao.review_delete(board_no);
	}

	@Override
	public int updateHit(int board_no) {
		return review_dao.updateHit(board_no);
	}


}
