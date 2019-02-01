package kh.coupon.mvc.biz;

import java.util.List;

import org.springframework.stereotype.Service;

import kh.coupon.mvc.dto.ReviewDto;

@Service
public interface ReviewBiz {
	
	public List<ReviewDto> review_list();
	public List<ReviewDto> review_list_seven(); // 7그램
	public List<ReviewDto> review_list_bear(); // 맥주창고
	public List<ReviewDto> review_list_magic(); // 요술포차
	public ReviewDto review_detail(int review_no);
	public int review_insert(ReviewDto review_dto);
	public int review_update(ReviewDto review_dto);
	public int review_delete(int review_no);
	public int updateHit(int review_no);
}
