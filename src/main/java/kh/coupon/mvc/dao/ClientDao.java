package kh.coupon.mvc.dao;

import java.util.List;

import kh.coupon.mvc.dto.ClientDto;

public interface ClientDao {
	
	String namespace="client.";

	public List<ClientDto> client_list();
	public ClientDto client_detail(int client_no);
}
