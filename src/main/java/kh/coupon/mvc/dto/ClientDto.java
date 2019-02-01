package kh.coupon.mvc.dto;

public class ClientDto {

	private int client_no;
	private int member_no;
	private String client_name_store;
	private String client_phone_store;
	private String client_address;
	private String client_registration;
	private String client_max_client;
	private String client_reservation;
	
	public ClientDto() {
		
	}

	public ClientDto(int client_no, int member_no, String client_name_store, String client_phone_store,
			String client_address, String client_registration, String client_max_client, String client_reservation) {
		super();
		this.client_no = client_no;
		this.member_no = member_no;
		this.client_name_store = client_name_store;
		this.client_phone_store = client_phone_store;
		this.client_address = client_address;
		this.client_registration = client_registration;
		this.client_max_client = client_max_client;
		this.client_reservation = client_reservation;
	}

	public int getClient_no() {
		return client_no;
	}

	public void setClient_no(int client_no) {
		this.client_no = client_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getClient_name_store() {
		return client_name_store;
	}

	public void setClient_name_store(String client_name_store) {
		this.client_name_store = client_name_store;
	}

	public String getClient_phone_store() {
		return client_phone_store;
	}

	public void setClient_phone_store(String client_phone_store) {
		this.client_phone_store = client_phone_store;
	}

	public String getClient_address() {
		return client_address;
	}

	public void setClient_address(String client_address) {
		this.client_address = client_address;
	}

	public String getClient_registration() {
		return client_registration;
	}

	public void setClient_registration(String client_registration) {
		this.client_registration = client_registration;
	}

	public String getClient_max_client() {
		return client_max_client;
	}

	public void setClient_max_client(String client_max_client) {
		this.client_max_client = client_max_client;
	}

	public String getClient_reservation() {
		return client_reservation;
	}

	public void setClient_reservation(String client_reservation) {
		this.client_reservation = client_reservation;
	}
	
	
}
