package kh.coupon.mvc.dto;

import java.util.Date;

import javax.validation.constraints.Size;

public class MemberDto {

	private int member_no;
	private String member_name;
	private String member_id;
	@Size(max=10,message="10자리 이하의 숫자로 입력해세요")
	private String member_password;
	private String member_profile;
	private String member_phone;
	private Date member_date_create;
	private Date member_date_update;
	private String member_nickname;
	private String member_class;
	private String member_email;
	private String member_role;
	private String member_withdraw;
	private Date member_date_withdraw;
	private String member_enabled;
	
	
	public MemberDto() {
		super();
	}


	public MemberDto(String member_id, String member_role) {
		super();
		this.member_id = member_id;
		this.member_role = member_role;
	}


	public MemberDto(int member_no, String member_name, String member_id,
			@Size(max = 10, message = "10자리 이하의 숫자로 입력해세요") String member_password, String member_profile,
			String member_phone, Date member_date_create, Date member_date_update, String member_nickname,
			String member_class, String member_email, String member_role, String member_withdraw,
			Date member_date_withdraw, String member_enabled) {
		super();
		this.member_no = member_no;
		this.member_name = member_name;
		this.member_id = member_id;
		this.member_password = member_password;
		this.member_profile = member_profile;
		this.member_phone = member_phone;
		this.member_date_create = member_date_create;
		this.member_date_update = member_date_update;
		this.member_nickname = member_nickname;
		this.member_class = member_class;
		this.member_email = member_email;
		this.member_role = member_role;
		this.member_withdraw = member_withdraw;
		this.member_date_withdraw = member_date_withdraw;
		this.member_enabled = member_enabled;
	}


	public int getMember_no() {
		return member_no;
	}


	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}


	public String getMember_name() {
		return member_name;
	}


	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public String getMember_password() {
		return member_password;
	}


	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}


	public String getMember_profile() {
		return member_profile;
	}


	public void setMember_profile(String member_profile) {
		this.member_profile = member_profile;
	}


	public String getMember_phone() {
		return member_phone;
	}


	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}


	public Date getMember_date_create() {
		return member_date_create;
	}


	public void setMember_date_create(Date member_date_create) {
		this.member_date_create = member_date_create;
	}


	public Date getMember_date_update() {
		return member_date_update;
	}


	public void setMember_date_update(Date member_date_update) {
		this.member_date_update = member_date_update;
	}


	public String getMember_nickname() {
		return member_nickname;
	}


	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}


	public String getMember_class() {
		return member_class;
	}


	public void setMember_class(String member_class) {
		this.member_class = member_class;
	}


	public String getMember_email() {
		return member_email;
	}


	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}


	public String getMember_role() {
		return member_role;
	}


	public void setMember_role(String member_role) {
		this.member_role = member_role;
	}


	public String getMember_withdraw() {
		return member_withdraw;
	}


	public void setMember_withdraw(String member_withdraw) {
		this.member_withdraw = member_withdraw;
	}


	public Date getMember_date_withdraw() {
		return member_date_withdraw;
	}


	public void setMember_date_withdraw(Date member_date_withdraw) {
		this.member_date_withdraw = member_date_withdraw;
	}


	public String getMember_enabled() {
		return member_enabled;
	}


	public void setMember_enabled(String member_enabled) {
		this.member_enabled = member_enabled;
	}

	
	
	
	
	
}
