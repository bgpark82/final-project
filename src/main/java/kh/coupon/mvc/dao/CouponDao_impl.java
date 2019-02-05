package kh.coupon.mvc.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.coupon.mvc.dto.ClientDto;
import kh.coupon.mvc.dto.CouponDto;
import kh.coupon.mvc.dto.MemberDto;

@Repository
public class CouponDao_impl implements CouponDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<CouponDto> coupon_list() {
		List<CouponDto> res = null;
		try {
			res = sqlSessionTemplate.selectList(namespace+"coupon_list");		
		} catch(Exception e) {
			System.out.println("daoImpl coupon_list 오류");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public List<CouponDto> beer_list(){
		List<CouponDto> res = null;
		try {
			res = sqlSessionTemplate.selectList(namespace+"beer_list");		
		} catch(Exception e) {
			System.out.println("daoImpl beer_list 오류");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public CouponDto coupon_detail(int menu_no) {
		CouponDto coupon_dto = null;
		try {
			coupon_dto = sqlSessionTemplate.selectOne(namespace+"coupon_detail",menu_no);
		} catch(Exception e) {
			System.out.println("daoImpl coupon_detail 오류");
			e.printStackTrace();
		}
		return coupon_dto;
	}

	// 학생이 쿠폰을 구매했을때 쿠폰 테이블을 update시키는 것이라 생각하자
	@Override
	public int coupon_buy(int member_no, int client_no, int menu_no, int coupon_count) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("member_no", member_no);
		map.put("client_no", client_no);
		map.put("menu_no", menu_no);
		map.put("coupon_count", coupon_count);
		int res = sqlSessionTemplate.update(namespace+"coupon_buy",map);
		
		if(res>0) {
			System.out.println("daoImpl coupon_buy 성공");
		} else {
			System.out.println("daoImpl coupon_buy 실패");
		}
		return res;
	}

	//내쿠폰함에서 보유쿠폰(detail 같은것이라고 보면될것같다)
	@Override
	public List<CouponDto> my_coupon_list(int member_no) {
		List<CouponDto> res = new ArrayList<CouponDto>();
		//CouponDto coupon_dto = null;
		try {
			res = sqlSessionTemplate.selectList(namespace+"my_coupon_list",member_no);
		} catch(Exception e) {
			System.out.println("daoImpl my_coupon 에러");
			e.printStackTrace();
		}
		return res;
	}

	//내쿠폰함에서 쿠폰상세보기
	@Override
	public CouponDto my_coupon_detail(int member_no, int menu_no) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("member_no", member_no);
		map.put("menu_no", menu_no);
		
		CouponDto my_coupon_detail = null;
		try {
			my_coupon_detail = sqlSessionTemplate.selectOne(namespace+"my_coupon_detail",map);
		} catch(Exception e) {
			System.out.println("daoImpl my_coupon_detail 오류");
			e.printStackTrace();
		}
		return my_coupon_detail;
	}
	
	
	//내쿠폰함에서 쿠폰사용시 제휴업체 결제코드가 맞는지 확인하는 메소드
	@Override
	public ClientDto check_paycode(int client_no, int paycode) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("client_no", client_no);
		map.put("paycode", paycode);
		ClientDto client_dto = null;
		try {
			client_dto = sqlSessionTemplate.selectOne(namespace+"check_paycode",map);
		} catch(Exception e) {
			System.out.println("daoImpl checck_paycod 오류");
		}
		
		return client_dto;
	}

	
	//제휴업체 코드가 맞다면 내가가지고있는쿠폰에서 사용한쿠폰 빼는 (update)메소드
	@Override
	public int my_coupon_use(int member_no, int client_no, int menu_no,int coupon_count) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("member_no", member_no);
		map.put("client_no", client_no);
		map.put("menu_no", menu_no);
		map.put("coupon_count",coupon_count);
		int res = sqlSessionTemplate.update(namespace+"my_coupon_use",map);
		System.out.println(res);
		if(res>0) {
			System.out.println("daoImpl my_coupon_use 성공");
		} else {
			System.out.println("daoImpl my_coupon_use 실패");
		}
		return res;
	}

	@Override
	public int coupon_gift(int member_to_no, int member_from_no, int member_no, int client_no, int menu_no, int coupon_count) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("member_to_no", member_to_no);
		map.put("member_from_no", member_from_no);
		map.put("member_no", member_no);
		map.put("client_no", client_no);
		map.put("menu_no", menu_no);
		map.put("coupon_count",coupon_count);
		int res = sqlSessionTemplate.update(namespace+"coupon_gift",map);		
		if(res>0) {
			System.out.println("daoImpl coupon_gift 성공");
		} else {
			System.out.println("daoImpl coupon_gift 실패");
		}
		return res;
	}

	@Override
	public int check_phone(String member_phone) {
		int member_no = 0;
		try {
			member_no = sqlSessionTemplate.selectOne(namespace+"check_phone",member_phone);
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("daoImpl check_phone 오류");
		}
		return member_no;
	}
	

	
	

}
