package kh.coupon.mvc.dto;

import java.util.Date;

public class ReviewDto {

	private int review_no;
	private String review_category;
	private String review_title;
	private String review_content;
	private String review_writer;
	private Date review_date_create;
	private Date review_date_update;
	private int review_count;
	private int review_like;
	
	public ReviewDto() {}

	public ReviewDto(int review_no, String review_category, String review_title, String review_content,
			String review_writer, Date review_date_create, Date review_date_update, int review_count, int review_like) {
	
		this.review_no = review_no;
		this.review_category = review_category;
		this.review_title = review_title;
		this.review_content = review_content;
		this.review_writer = review_writer;
		this.review_date_create = review_date_create;
		this.review_date_update = review_date_update;
		this.review_count = review_count;
		this.review_like = review_like;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public String getReview_category() {
		return review_category;
	}

	public void setReview_category(String review_category) {
		this.review_category = review_category;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_content() {
		return review_content;
	}

	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}

	public String getReview_writer() {
		return review_writer;
	}

	public void setReview_writer(String review_writer) {
		this.review_writer = review_writer;
	}

	public Date getReview_date_create() {
		return review_date_create;
	}

	public void setReview_date_create(Date review_date_create) {
		this.review_date_create = review_date_create;
	}

	public Date getReview_date_update() {
		return review_date_update;
	}

	public void setReview_date_update(Date review_date_update) {
		this.review_date_update = review_date_update;
	}

	public int getReview_count() {
		return review_count;
	}

	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}

	public int getReview_like() {
		return review_like;
	}

	public void setReview_like(int review_like) {
		this.review_like = review_like;
	}
	
	
}
