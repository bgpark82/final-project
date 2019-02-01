package kh.coupon.mvc.dao_Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.coupon.mvc.dao.MenuDao;
import kh.coupon.mvc.dto.MenuDto;

@Repository
public class MenuDao_Impl implements MenuDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<MenuDto> selectList(int client_no) {
		return sqlSession.selectList(NAMESPACE + "menu_list", client_no);
	}



	
}
