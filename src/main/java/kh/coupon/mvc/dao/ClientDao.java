package kh.coupon.mvc.dao;

import kh.coupon.mvc.dto.ClientDto;

public interface ClientDao {
	
	String namespace = "client.";
	
	public int client_insert(ClientDto dto);
	public ClientDto selectOne(int member_no);
}
