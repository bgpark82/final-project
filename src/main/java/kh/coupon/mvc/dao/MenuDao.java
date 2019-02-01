package kh.coupon.mvc.dao;

import java.util.List;

import kh.coupon.mvc.dto.MenuDto;

public interface MenuDao {

	String NAMESPACE = "user.";
	
	public List<MenuDto> selectList(int client_no);
	
}
