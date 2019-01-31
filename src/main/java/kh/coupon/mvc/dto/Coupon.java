package kh.coupon.mvc.dto;

import java.util.Date;

public class Coupon {
	/*
	--해당 쿠폰의 기본정보
	coupon_no	NUMBER	NOT NULL,					--쿠폰 고유번호		
	member_no	NUMBER	NOT NULL,					--구매한 멤버의 고유번호			 
	client_no	NUMBER	NOT NULL,					--제휴업체 고유번호
	menu_no 	NUMBER NOT NULL,					--메뉴 고유번호								
	
	--해당 쿠폰의 정보
	client_name	VARCHAR2(500)	NOT NULL,			--제휴업체명
	menu_title	VARCHAR2(500)	NOT NULL,			--쿠폰 이름(메뉴명)	
	menu_price	NUMBER	NOT NULL,					--쿠폰 가격 		
	menu_image	VARCHAR2(500)	NULL,				--쿠폰 이미지 				
	menu_detail	VARCHAR2(500)	NULL,				--쿠폰 상세정보 				
	coupon_date_create	DATE	NOT NULL,			--쿠폰 생성일(즉, 학원이 제휴업체에게 구매한 날짜가 됨)
	coupon_used		VARCHAR2(2) 	NOT NULL,		--쿠폰 사용여부
	
	--선물 기능을 위한 컬럼 
	coupon_used_send	VARCHAR2(2) NOT NULL,		--쿠폰 선물여부
	coupon_send_date	DATE	NULL,				--쿠폰 선물날짜(유저가 유저에게 선물한 날짜)
	coupon_from	VARCHAR2(500)	NULL				--쿠폰 선물 보낸 사람(조인을 피해기 위해 컬럼을 가지고있음)
	*/
	
	private int coupon_no;
	private int member_no;
	private int client_no;
	private int menu_no;
	
	private String client_name;
	private String menu_title;
	private int menu_price;
	private String menu_image;
	private String menu_detail;
	private Date coupon_date_create;
	private String coupon_used;
	
	private String coupon_used_send;
	private Date coupon_send_date;
	private String coupon_from;
	
	private String coupon_state; 
	
	private int coupon_count;
	private int total_amount;
	//기본 생성자
	public Coupon() {
		
	}
	
	public Coupon(int member_no, int client_no, int menu_no, String client_name, String menu_title, int menu_price, String menu_image,
			String menu_detail) {
		this.member_no = member_no;
		this.client_no = client_no;
		this.menu_no = menu_no;
		
		this.client_name = client_name;
		this.menu_title = menu_title;
		this.menu_price = menu_price;
		this.menu_image = menu_image;
		this.menu_detail = menu_detail;
	}
	
	//쿠폰의 모든 정보를 가진 생성자
	public Coupon(int coupon_no,int member_no, int client_no, int menu_no, String client_name, String menu_title, int menu_price, String menu_image,
			String menu_detail, Date coupon_date_create, String coupon_used, String coupon_used_send, Date coupon_send_date, String coupon_from, String coupon_state,
			int coupon_count, int total_amount) {
		this.coupon_no = coupon_no;
		this.member_no = member_no;
		this.client_no = client_no;
		this.menu_no = menu_no;
		
		this.client_name = client_name;
		this.menu_title = menu_title;
		this.menu_price = menu_price;
		this.menu_image = menu_image;
		this.menu_detail = menu_detail;
		this.coupon_date_create = coupon_date_create;
		this.coupon_used = coupon_used;
		
		this.coupon_used_send = coupon_used_send;
		this.coupon_send_date = coupon_send_date;
		this.coupon_from = coupon_from;
		
		this.coupon_state = coupon_state;
		this.coupon_count = coupon_count;
		this.total_amount = total_amount;
	}
	
	//학원의 쿠폰 재고내역
	public Coupon(int client_no, String client_name, int menu_no, String menu_title, int menu_price, int coupon_count) {
		this.client_no = client_no;
		this.client_name = client_name;
		this.menu_no = menu_no;
		this.menu_title = menu_title;
		this.menu_price = menu_price;
		this.coupon_count = coupon_count;
	}


	public int getCoupon_no() {
		return coupon_no;
	}


	public void setCoupon_no(int coupon_no) {
		this.coupon_no = coupon_no;
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


	public int getMenu_no() {
		return menu_no;
	}


	public void setMenu_no(int menu_no) {
		this.menu_no = menu_no;
	}


	public String getClient_name() {
		return client_name;
	}


	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}


	public String getMenu_title() {
		return menu_title;
	}


	public void setMenu_title(String menu_title) {
		this.menu_title = menu_title;
	}


	public int getMenu_price() {
		return menu_price;
	}


	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}


	public String getMenu_image() {
		return menu_image;
	}


	public void setMenu_image(String menu_image) {
		this.menu_image = menu_image;
	}


	public String getMenu_detail() {
		return menu_detail;
	}


	public void setMenu_detail(String menu_detail) {
		this.menu_detail = menu_detail;
	}


	public Date getCoupon_date_create() {
		return coupon_date_create;
	}


	public void setCoupon_date_create(Date coupon_date_create) {
		this.coupon_date_create = coupon_date_create;
	}


	public String getCoupon_used() {
		return coupon_used;
	}


	public void setCoupon_used(String coupon_used) {
		this.coupon_used = coupon_used;
	}


	public String getCoupon_used_send() {
		return coupon_used_send;
	}


	public void setCoupon_used_send(String coupon_used_send) {
		this.coupon_used_send = coupon_used_send;
	}


	public Date getCoupon_send_date() {
		return coupon_send_date;
	}


	public void setCoupon_send_date(Date coupon_send_date) {
		this.coupon_send_date = coupon_send_date;
	}


	public String getCoupon_from() {
		return coupon_from;
	}


	public void setCoupon_from(String coupon_from) {
		this.coupon_from = coupon_from;
	}
	
	public String getCoupon_state() {
		return coupon_state;
	}
	
	public void setCoupon_state(String coupon_state) {
		this.coupon_state = coupon_state;
	}
	
	public int getCoupon_count() {
		return coupon_count;
	}
	
	public void setCoupon_count(int coupon_count) {
		this.coupon_count = coupon_count;
	}
	
	public int getTotal_amount() {
		return total_amount;
	}
	
	public void setTotal_amount(int total_amount) {
		this.total_amount = total_amount;
	}
	
}
