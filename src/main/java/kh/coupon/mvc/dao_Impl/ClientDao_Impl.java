package kh.coupon.mvc.dao_Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.coupon.mvc.dao.ClientDao;
import kh.coupon.mvc.dto.ClientDto;

@Repository
public class ClientDao_Impl implements ClientDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	@Override
	public List<ClientDto> selectList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"client_list");
	}

	@Override
	public ClientDto selectOne(int client_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"client_detail", client_no);
	}
	

	

}
