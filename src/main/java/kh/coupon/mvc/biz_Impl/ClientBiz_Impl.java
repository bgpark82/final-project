package kh.coupon.mvc.biz_Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.coupon.mvc.biz.ClientBiz;
import kh.coupon.mvc.dao.ClientDao;
import kh.coupon.mvc.dto.ClientDto;

@Service
public class ClientBiz_Impl implements ClientBiz{

	@Autowired
	private ClientDao client_dao;
	
	@Override
	public List<ClientDto> selectList() {
		
		return client_dao.selectList();
	}

	@Override
	public ClientDto selectOne(int client_no) {
		// TODO Auto-generated method stub
		return client_dao.selectOne(client_no);
	}

}
