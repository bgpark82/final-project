package kh.coupon.mvc.dao_impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.coupon.mvc.dao.AcademyDao;
import kh.coupon.mvc.dto.ClientDto;
import kh.coupon.mvc.dto.CouponDto;
import kh.coupon.mvc.dto.Coupon_historyDto;
import kh.coupon.mvc.dto.MenuDto;

@Repository
public class AcademyDao_impl implements AcademyDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<CouponDto> coupon_stock() {
		
		return sqlSession.selectList(NAMESPACE+"coupon_stock");
	}

	@Override
	public List<Coupon_historyDto> purchase_history() {
		return sqlSession.selectList(NAMESPACE+"purchase_history");
	}

	@Override
	public List<Coupon_historyDto> sales_history() {
		return sqlSession.selectList(NAMESPACE+"sales_history");
	}

	@Override
	public List<MenuDto> menu_list(int client_no) {
		return sqlSession.selectList(NAMESPACE+"menu_list", client_no);
	}

	@Override
	public MenuDto menu_detail(int client_no, int menu_no) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("client_no", client_no);
		map.put("menu_no", menu_no);
		return sqlSession.selectOne(NAMESPACE+"menu_detail",map);
	}

	@Override
	public List<ClientDto> client_list() {
		return sqlSession.selectList(NAMESPACE+"client_list");
	}

	@Override
	public List<ClientDto> client_registration_list() {
		return sqlSession.selectList(NAMESPACE+"client_registration_list");
	}

	@Override
	public int client_update_registration(int client_no) {
		return sqlSession.update(NAMESPACE+"client_update_registration", client_no);
	}

	@Override
	public int coupon_purchase_order(Map<String, Object> map) {
		return sqlSession.insert(NAMESPACE+"coupon_purchase_order",map);
	}

	@Override
	public List<CouponDto> coupon_purchase_order_list() {
		return sqlSession.selectList(NAMESPACE+"coupon_purchase_order_list");
	}
	
	/*
	@Override
	public List<CouponDto> client_coupon_purchase_order_list() {
		return sqlSession.selectList(NAMESPACE+"client_coupon_purchase_order_list");
	}
	*/
	

	@Override
	public List<Integer> purchase_statistics(int year, int client_no) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("year", year);
		map.put("client_no", client_no);
		return sqlSession.selectList(NAMESPACE+"purchase_statistics", map);
	}

	@Override
	public List<Integer> sale_statistics(int year, int client_no) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("year", year);
		map.put("client_no", client_no);
		return sqlSession.selectList(NAMESPACE+"sale_statistics", map);
	}

	

}
