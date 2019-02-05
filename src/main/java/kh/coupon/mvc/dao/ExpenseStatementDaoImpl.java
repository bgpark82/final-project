package kh.coupon.mvc.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.coupon.mvc.dao.ExpenseStatementDao;
import kh.coupon.mvc.dto.CouponHistoryDto;

@Repository
public class ExpenseStatementDaoImpl implements ExpenseStatementDao {

	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public List<CouponHistoryDto> monthlyExpenseStatement(int member_no, String year, String month) {
		
		System.out.println("***Dao에 있는 member_no: " + member_no + " year : "+ year + " month : " + month );
		List<CouponHistoryDto> res = null;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_no",member_no);
		map.put("year", year);
		map.put("month", month);
		
		res = sqlsession.selectList(namespace + "accountCalDetail" , map);
		System.out.println("***Dao map에 있는 member_no: " + member_no + " year : "+ year + " month : " + month );
		return res;
	}
}
