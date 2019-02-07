package kh.coupon.mvc.biz;


import java.util.List;

import org.springframework.stereotype.Service;

import kh.coupon.mvc.dto.Coupon_historyDto;

@Service
public interface ExpenseStatementBiz {

			
	//해당  년,월에 맞는 월 총 지출내역 보기
	public List<Coupon_historyDto> monthlyExpenseStatement(int member_no , String year, String month);
			

}
