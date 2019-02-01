package kh.coupon.mvc.dao;

import java.util.List;

import kh.coupon.mvc.dto.ClientDto;

public interface ClientDao {


	String NAMESPACE = "user.";
	
	public List<ClientDto> selectList();
	public ClientDto selectOne(int client_no);
}
