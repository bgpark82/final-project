package kh.coupon.mvc.biz;

import java.util.List;

import kh.coupon.mvc.dto.MenuDto;

public interface MenuBiz {

	public List<MenuDto> selectList(int client_no);
}
