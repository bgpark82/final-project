package kh.coupon.mvc.biz_impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.coupon.mvc.biz.ClientBiz;
import kh.coupon.mvc.dao.ClientDao;
import kh.coupon.mvc.dto.ClientDto;

@Service
public class ClientBiz_impl implements ClientBiz {
	
	@Autowired
	private ClientDao client_dao;

	@Override
	public List<ClientDto> client_list() {
		return client_dao.client_list();
	}

	@Override
	public ClientDto client_detail(int client_no) {
		return client_dao.client_detail(client_no);
	}

}
