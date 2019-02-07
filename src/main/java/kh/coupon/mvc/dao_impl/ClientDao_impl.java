package kh.coupon.mvc.dao_impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.coupon.mvc.dao.ClientDao;
import kh.coupon.mvc.dto.ClientDto;

@Repository
public class ClientDao_impl implements ClientDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<ClientDto> client_list() {
		List<ClientDto> res = null;
		try {
			res = sqlSessionTemplate.selectList(namespace+"client_list");		
		} catch(Exception e) {
			System.out.println("daoImpl client_list 오류");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public ClientDto client_detail(int client_no) {
		ClientDto client_dto = null;
		try {
			client_dto = sqlSessionTemplate.selectOne(namespace+"client_detail",client_no);
		} catch(Exception e) {
			System.out.println("daoImpl client_detail 오류");
			e.printStackTrace();
		}
		return client_dto;
	}

}
