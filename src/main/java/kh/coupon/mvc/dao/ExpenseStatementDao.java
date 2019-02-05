package kh.coupon.mvc.dao;

import java.util.List;

import kh.coupon.mvc.dto.CouponHistoryDto;

public interface ExpenseStatementDao {

	String namespace= "expense.";
	
	//해당  년,월에 맞는 월 총 지출내역 보기
	public List<CouponHistoryDto> monthlyExpenseStatement(int member_no , String year, String month);
	
	

}
