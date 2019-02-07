package kh.coupon.mvc.biz;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.coupon.mvc.dto.ReviewDto;

@Service
public interface ReviewBiz {

	public List<ReviewDto> review_list(String board_category);
	public ReviewDto review_detail(int board_no);
	public int review_insert(ReviewDto review_dto);
	public int review_update(ReviewDto review_dto);
	public int review_delete(int board_no);
	public int updateHit(int board_no);
}
