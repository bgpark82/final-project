package kh.coupon.mvc.dao_impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.coupon.mvc.dao.Academy_dao;
import kh.coupon.mvc.dto.Client;
import kh.coupon.mvc.dto.Coupon;
import kh.coupon.mvc.dto.Coupon_history;
import kh.coupon.mvc.dto.Menu;

@Repository
public class Academy_dao_impl implements Academy_dao{
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<Coupon> coupon_stock() {
		
		return sqlSession.selectList(NAMESPACE+"coupon_stock");
	}

	@Override
	public List<Coupon_history> purchase_history() {
		return sqlSession.selectList(NAMESPACE+"purchase_history");
	}

	@Override
	public List<Coupon_history> sales_history() {
		return sqlSession.selectList(NAMESPACE+"sales_history");
	}

	@Override
	public List<Menu> menu_list(int client_no) {
		return sqlSession.selectList(NAMESPACE+"menu_list", client_no);
	}

	@Override
	public Menu menu_detail(int client_no, int menu_no) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("client_no", client_no);
		map.put("menu_no", menu_no);
		return sqlSession.selectOne(NAMESPACE+"menu_detail",map);
	}

	@Override
	public List<Client> client_list() {
		return sqlSession.selectList(NAMESPACE+"client_list");
	}

	@Override
	public List<Client> client_registration_list() {
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
	public List<Coupon> coupon_purchase_order_list() {
		return sqlSession.selectList(NAMESPACE+"coupon_purchase_order_list");
	}

	

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
