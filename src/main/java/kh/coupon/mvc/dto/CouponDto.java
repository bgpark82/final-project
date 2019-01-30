package kh.coupon.mvc.dto;

import java.util.Date;

public class CouponDto {
	private int coupon_no;
	private int client_no;
	private int member_no;
	private int menu_no;
	private String client_name;
	private String menu_title;
	private int menu_price;
	private String menu_image;
	private String menu_detail;
	private Date coupon_date_create;
	private String coupon_used;
	private Date cooupon_buy_date;
	private String coupon_used_send;
	private Date coupon_send_date;
	private String coupon_from;
	private String coupon_state;
	
	private int coupon_count;
	private int total_amount;
	
	public CouponDto() {}

	public CouponDto(int coupon_no, int client_no, int member_no, int menu_no, String client_name, String menu_title,
			int menu_price, String menu_image, String menu_detail, Date coupon_date_create, String coupon_used,
			Date cooupon_buy_date, String coupon_used_send, Date coupon_send_date, String coupon_from, String coupon_state,int coupon_count,int total_amount) {
		super();
		this.coupon_no = coupon_no;
		this.client_no = client_no;
		this.member_no = member_no;
		this.menu_no = menu_no;
		this.client_name = client_name;
		this.menu_title = menu_title;
		this.menu_price = menu_price;
		this.menu_image = menu_image;
		this.menu_detail = menu_detail;
		this.coupon_date_create = coupon_date_create;
		this.coupon_used = coupon_used;
		this.cooupon_buy_date = cooupon_buy_date;
		this.coupon_used_send = coupon_used_send;
		this.coupon_send_date = coupon_send_date;
		this.coupon_from = coupon_from;
		this.coupon_state = coupon_state;
		this.coupon_count = coupon_count;
		this.total_amount = total_amount;
	}

	public int getCoupon_no() {
		return coupon_no;
	}

	public void setCoupon_no(int coupon_no) {
		this.coupon_no = coupon_no;
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

	public Date getCooupon_buy_date() {
		return cooupon_buy_date;
	}

	public void setCooupon_buy_date(Date cooupon_buy_date) {
		this.cooupon_buy_date = cooupon_buy_date;
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
