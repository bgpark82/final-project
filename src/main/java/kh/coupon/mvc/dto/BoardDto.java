package kh.coupon.mvc.dto;

import java.util.Date;

public class BoardDto {

   private int board_no;
   private int member_no;
   private String board_category;
   private String board_title;
   private String board_content;
   private String board_writer;
   private Date board_date_create;
   private Date board_date_update;
   private int board_count;
   private int board_like_count;
   
   public BoardDto() {
	   
   }
   
   public BoardDto(int member_no, String board_category, String board_title, String board_content, String board_writer) {
	   		this.member_no = member_no;
	      this.board_category = board_category;
	      this.board_title = board_title;
	      this.board_content = board_content;
	      this.board_writer = board_writer;
   }

   public BoardDto(int board_no, int member_no, String board_category, String board_title,
         String board_content, String board_writer, Date board_date_create, Date board_date_update, int board_count,
         int board_like_count) {
      this.board_no = board_no;
      this.member_no = member_no;
      this.board_category = board_category;
      this.board_title = board_title;
      this.board_content = board_content;
      this.board_writer = board_writer;
      this.board_date_create = board_date_create;
      this.board_date_update = board_date_update;
      this.board_count = board_count;
      this.board_like_count = board_like_count;
   }

   public int getBoard_no() {
      return board_no;
   }

   public void setBoard_no(int board_no) {
      this.board_no = board_no;
   }

   public int getMember_no() {
      return member_no;
   }

   public void setMember_no(int member_no) {
      this.member_no = member_no;
   }

   public String getBoard_category() {
      return board_category;
   }

   public void setBoard_category(String board_category) {
      this.board_category = board_category;
   }

   public String getBoard_title() {
      return board_title;
   }

   public void setBoard_title(String board_title) {
      this.board_title = board_title;
   }

   public String getBoard_content() {
      return board_content;
   }

   public void setBoard_content(String board_content) {
      this.board_content = board_content;
   }

   public String getBoard_writer() {
      return board_writer;
   }

   public void setBoard_writer(String board_writer) {
      this.board_writer = board_writer;
   }

   public Date getBoard_date_create() {
      return board_date_create;
   }

   public void setBoard_date_create(Date board_date_create) {
      this.board_date_create = board_date_create;
   }

   public Date getBoard_date_update() {
      return board_date_update;
   }

   public void setBoard_date_update(Date board_date_update) {
      this.board_date_update = board_date_update;
   }

   public int getBoard_count() {
      return board_count;
   }

   public void setBoard_count(int board_count) {
      this.board_count = board_count;
   }

   public int getBoard_like_count() {
      return board_like_count;
   }

   public void setBoard_like_count(int board_like_count) {
      this.board_like_count = board_like_count;
   }

   
   
}