package kh.coupon.mvc.dto;

import java.util.Date;

public class MemberReservationDto {

	private int reservation_no;
	private int member_no;
	private int client_no;
	private String member_phone;
	private Date reservation_date_request;
	private String reservation_date;
	private int reservation_people;
	private int reservation_time;
	private String reservation_confirm;
	private String reservation_memo;
	private String reservation_reject;
	
	public MemberReservationDto() {
		
	}

	public MemberReservationDto(int reservation_no, int member_no, int client_no, String member_phone,
			Date reservation_date_request, String reservation_date, int reservation_people, int reservation_time,
			String reservation_confirm, String reservation_memo, String reservation_reject) {
		super();
		this.reservation_no = reservation_no;
		this.member_no = member_no;
		this.client_no = client_no;
		this.member_phone = member_phone;
		this.reservation_date_request = reservation_date_request;
		this.reservation_date = reservation_date;
		this.reservation_people = reservation_people;
		this.reservation_time = reservation_time;
		this.reservation_confirm = reservation_confirm;
		this.reservation_memo = reservation_memo;
		this.reservation_reject = reservation_reject;
	}

	public int getReservation_no() {
		return reservation_no;
	}

	public void setReservation_no(int reservation_no) {
		this.reservation_no = reservation_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getClient_no() {
		return client_no;
	}

	public void setClient_no(int client_no) {
		this.client_no = client_no;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public Date getReservation_date_request() {
		return reservation_date_request;
	}

	public void setReservation_date_request(Date reservation_date_request) {
		this.reservation_date_request = reservation_date_request;
	}

	public String getReservation_date() {
		return reservation_date;
	}

	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
	}

	public int getReservation_people() {
		return reservation_people;
	}

	public void setReservation_people(int reservation_people) {
		this.reservation_people = reservation_people;
	}

	public int getReservation_time() {
		return reservation_time;
	}

	public void setReservation_time(int reservation_time) {
		this.reservation_time = reservation_time;
	}

	public String getReservation_confirm() {
		return reservation_confirm;
	}

	public void setReservation_confirm(String reservation_confirm) {
		this.reservation_confirm = reservation_confirm;
	}

	public String getReservation_memo() {
		return reservation_memo;
	}

	public void setReservation_memo(String reservation_memo) {
		this.reservation_memo = reservation_memo;
	}

	public String getReservation_reject() {
		return reservation_reject;
	}

	public void setReservation_reject(String reservation_reject) {
		this.reservation_reject = reservation_reject;
	}
	
	
	
	
	
	
}
