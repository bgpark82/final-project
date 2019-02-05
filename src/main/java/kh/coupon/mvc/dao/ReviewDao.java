package kh.coupon.mvc.dao;

import java.util.List;

import kh.coupon.mvc.dto.ReviewDto;


public interface ReviewDao {

	String namespace = "review.";
	
	public List<ReviewDto> review_list(); 
	public List<ReviewDto> board_list();
	public List<ReviewDto> review_list_seven(); // 7그램
	public List<ReviewDto> review_list_bear(); // 맥주창고
	public List<ReviewDto> review_list_magic(); // 요술포차
	public ReviewDto review_detail(int board_no); //공지사항 게시판하고 같이쓰자
	public int review_insert(ReviewDto review_dto);
	public int review_update(ReviewDto review_dto);
	public int review_delete(int board_no);
	public int updateHit(int board_no);
}
