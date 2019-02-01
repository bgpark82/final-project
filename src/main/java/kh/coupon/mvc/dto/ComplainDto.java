package kh.coupon.mvc.dto;

import java.util.Date;

public class ComplainDto {

	private int complain_no;
	private String complain_category;
	private String complain_title;
	private String complain_content;
	private String complain_writer;
	private Date complain_date_create;
	private Date complain_date_update;
	private int complain_count;
	private int complain_like;


	public ComplainDto() {
	}

	public ComplainDto(int complain_no, String complain_category, String complain_title, String complain_content,
			String complain_writer, Date complain_date_create, Date complain_date_update, int complain_count,
			int complain_like) {
		super();
		this.complain_no = complain_no;
		this.complain_category = complain_category;
		this.complain_title = complain_title;
		this.complain_content = complain_content;
		this.complain_writer = complain_writer;
		this.complain_date_create = complain_date_create;
		this.complain_date_update = complain_date_update;
		this.complain_count = complain_count;
		this.complain_like = complain_like;
	}

	public int getComplain_no() {
		return complain_no;
	}

	public void setComplain_no(int complain_no) {
		this.complain_no = complain_no;
	}

	public String getComplain_category() {
		return complain_category;
	}

	public void setComplain_category(String complain_category) {
		this.complain_category = complain_category;
	}

	public String getComplain_title() {
		return complain_title;
	}

	public void setComplain_title(String complain_title) {
		this.complain_title = complain_title;
	}

	public String getComplain_content() {
		return complain_content;
	}

	public void setComplain_content(String complain_content) {
		this.complain_content = complain_content;
	}

	public String getComplain_writer() {
		return complain_writer;
	}

	public void setComplain_writer(String complain_writer) {
		this.complain_writer = complain_writer;
	}

	public Date getComplain_date_create() {
		return complain_date_create;
	}

	public void setComplain_date_create(Date complain_date_create) {
		this.complain_date_create = complain_date_create;
	}

	public Date getComplain_date_update() {
		return complain_date_update;
	}

	public void setComplain_date_update(Date complain_date_update) {
		this.complain_date_update = complain_date_update;
	}

	public int getComplain_count() {
		return complain_count;
	}

	public void setComplain_count(int complain_count) {
		this.complain_count = complain_count;
	}
 
	public int getComplain_like() {
		return complain_like;
	}

	public void setComplain_like(int complain_like) {
		this.complain_like = complain_like;
	}

}
