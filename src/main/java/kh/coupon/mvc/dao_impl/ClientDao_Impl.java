package kh.coupon.mvc.dao_impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.coupon.mvc.dao.ClientDao;
import kh.coupon.mvc.dto.ClientDto;

@Repository
public class ClientDao_Impl implements ClientDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public int client_insert(ClientDto dto) {
		return sqlSession.insert(namespace + "client_insert", dto);
	}


	@Override
	public ClientDto selectOne(int member_no) {
		System.out.println(member_no);
		ClientDto dto = sqlSession.selectOne(namespace + "client_selectone", member_no);
		System.out.println("error");
		System.out.println();
		return dto;
	}
	
	
	
}
