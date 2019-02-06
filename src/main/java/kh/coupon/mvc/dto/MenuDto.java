package kh.coupon.mvc.dto;

import java.util.Date;

public class MenuDto {
/*
 * menu_no NUMBER NOT NULL,
	client_no NUMBER NOT NULL,
	client_name varchar2(500) NOT NULL,
	
	menu_title	VARCHAR2(500)	NOT NULL,			--메뉴 이름	
	menu_price	NUMBER	NOT NULL,					--메뉴 가격 		
	menu_image	VARCHAR2(500)	NULL,				--메뉴 이미지 				
	menu_detail	VARCHAR2(500)	NULL,				--메뉴 상세정보 	
	menu_create_date DATE NOT NULL					--메뉴 등록날짜
 */
	private int menu_no;
	private int client_no;
	private String client_name;
	
	private String menu_title;
	private int menu_price;
	private String menu_image;
	private String menu_detail;
	private Date menu_create_date;
	
	public MenuDto() {
		
	}
	
	public MenuDto(int menu_no, int client_no, String client_name, String menu_title, int menu_price, String menu_image, String menu_detail, Date menu_create_date) {
		this.menu_no = menu_no;
		this.client_no = client_no;
		this.client_name = client_name;
		this.menu_title = menu_title;
		this.menu_price = menu_price;
		this.menu_image = menu_image;
		this.menu_detail = menu_detail;
		this.menu_create_date = menu_create_date;
	}

	public int getMenu_no() {
		return menu_no;
	}

	public void setMenu_no(int menu_no) {
		this.menu_no = menu_no;
	}

	public int getClient_no() {
		return client_no;
	}

	public void setClient_no(int client_no) {
		this.client_no = client_no;
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

	public Date getMenu_create_date() {
		return menu_create_date;
	}

	public void setMenu_create_date(Date menu_create_date) {
		this.menu_create_date = menu_create_date;
	}
	
	
}
