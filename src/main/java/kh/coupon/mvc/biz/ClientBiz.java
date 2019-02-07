package kh.coupon.mvc.biz;

import java.util.List;

import kh.coupon.mvc.dto.ClientDto;

public interface ClientBiz {

	public List<ClientDto> client_list();
	public ClientDto client_detail(int client_no);
	//public int client_insert();
}
