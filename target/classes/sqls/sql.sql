/*
===================== 필독 =========================

1. SEQUENCE 이름 
	테이블 이름 마지막에 '_seq'

	예시 ) CREATE SEQUENCE user_seq;

2. user 테이블의 user_role 컬럼 기본값
	사용자 			ROLE_USER
	제휴업체			ROLE_CLIENT
	학원
		홍보팀		ROLE_MARKETING
		회계팀		ROLE_ACCOUNT
		운영팀		ROLE_OPERATION

3. 제약조건 ERD 참조해서 추가
	링크 : https://www.erdcloud.com/d/HnGb4TFv5b4sBdf2s		

4. 대문자로 쓰지말기

5. 각 필요한 테이블만 생성해서 기능 개발

6. 기능 구현중 DB 수정이 되어야한다면 일단 수정 후 알려주기!!! (ERD CLOUD에 반영하기)
	https://www.erdcloud.com/d/HnGb4TFv5b4sBdf2s
====================================================
*/

DROP TABLE member;
DROP SEQUENCE member_seq;

CREATE SEQUENCE member_seq;

CREATE TABLE member(
	member_no	NUMBER	NOT NULL,									
	member_name	VARCHAR2(500)	NOT NULL,						
	member_id	VARCHAR2(500)	NOT NULL,							
	member_password	VARCHAR2(500)	NOT NULL,					
	member_profile	VARCHAR2(500)	NULL,						
	member_phone	VARCHAR2(500)	NOT NULL,						
	member_date_create	DATE	NOT NULL,						
	member_date_update	DATE	NULL,							
	member_nickname	VARCHAR2(500)	NULL,						
	member_class	VARCHAR2(500)	NULL,						
	member_email	VARCHAR2(500)	NOT NULL,						
	member_role	VARCHAR2(500)	NOT NULL,						
	member_withdraw	VARCHAR2(500)	NULL,						
	member_date_withdraw	DATE	NULL,							
	member_verification	VARCHAR2(500)	NOT NULL,
	CONSTRAINT member_pk PRIMARY KEY(member_no),
	CONSTRAINT member_uq_id UNIQUE(member_id),
	CONSTRAINT member_uq_phone UNIQUE(member_phone),
	CONSTRAINT member_uq_nickname UNIQUE(member_nickname),
	CONSTRAINT member_uq_email UNIQUE(member_email),
	CONSTRAINT member_role_chk CHECK(member_role IN('ROLE_USER','ROLE_CLIENT'))
);

SELECT * FROM member

CREATE TABLE client (
	client_no	NUMBER	NOT NULL,								
	user_no	NUMBER	NOT NULL,													
	client_name_store	VARCHAR2(500)	NOT NULL,				
	client_phone_store	VARCHAR2(500)	NULL,					
	client_address	VARCHAR2(500)	NOT NULL,					
	client_registration	VARCHAR2(500)	NOT NULL,				
	client_max_client	VARCHAR2(500)	NULL,					
	client_reservation	VARCHAR2(500)	NOT NULL				
);

CREATE TABLE coupon (
	coupon_no	NUMBER	NOT NULL,								 
	client_no	NUMBER	NOT NULL,											
	user_no	NUMBER	NOT NULL,													
	coupon_title	VARCHAR2(500)	NOT NULL,					
	coupon_price	NUMBER	NOT NULL,							
	coupon_image	VARCHAR2(500)	NULL,						
	coupon_detail	VARCHAR2(500)	NULL,						
	coupon_category	VARCHAR2(500)	NOT NULL,					
	coupon_date_create	DATE	NOT NULL,						
	coupon_kh_count	NUMBER	NULL,								
	coupon_kh_date_buy	NUMBER	NULL,							
	coupon_user_count	NUMBER	NULL,							
	coupon_user_date_buy	DATE	NULL,						
	coupon_user_date_send	DATE	NULL,						
	coupon_user_date_expired	DATE	NULL,					
	coupon_user_send_to	VARCHAR2(500)	NULL,					
	coupon_user_send_from	VARCHAR2(500)	NULL				
);

CREATE TABLE board (
	board_no	NUMBER	NOT NULL,								
	user_no	NUMBER	NOT NULL,									 					
	board_title	VARCHAR2(500)	NOT NULL,						
	board_content	VARCHAR2(3000)	NOT NULL,					
	board_date_create	DATE	NOT NULL,						
	board_date_update	DATE	NULL,							
	board_category	VARCHAR2(500)	NOT NULL,					
	board_count	NUMBER	NULL									
);

CREATE TABLE client_request (
	request_no	NUMBER	NOT NULL,								 
	client_no	NUMBER	NOT NULL,								
	user_no	NUMBER	NOT NULL,									
	request_date_create	DATE	NOT NULL,						
	request_date_confirm	DATE	NULL,						
	request_date_terminate	DATE	NULL,						
	request_status	VARCHAR2(500)	NOT NULL					 
);

CREATE TABLE client_like (
	client_like_no	NUMBER	NOT NULL,							
	client_no	NUMBER	NOT NULL,								
	user_no	NUMBER	NOT NULL,									
	client_like_count	NUMBER	NULL,							 
	client_like_date_create	DATE	NULL						
);

CREATE TABLE board_like (
	board_like_no	NUMBER	NOT NULL,
	board_no	NUMBER	NOT NULL,
	user_no	NUMBER	NOT NULL,
	board_like_count	NUMBER	NOT NULL,
	board_like_date_create	DATE	NOT NULL
);

CREATE TABLE board_reply (
	reply_no	NUMBER	NOT NULL,								
	board_no	NUMBER	NOT NULL,								
	user_no	NUMBER	NOT NULL,										
	reply_title	VARCHAR2(500)	NOT NULL,						
	reply_content	VARCHAR2(3000)	NOT NULL,					
	reply_date_create	DATE	NOT NULL,						
	reply_date_update	DATE	NULL							
);


CREATE TABLE user_reservation (
	reservation_no	NUMBER	NOT NULL,							
	user_no	NUMBER	NOT NULL,									
	client_no	NUMBER	NOT NULL,								
	reservation_date_request	DATE	NOT NULL,				
	reservation_date	VARCHAR2(50)	NOT NULL,				
	reservation_people	NUMBER	NOT NULL,						
	reservation_time	NUMBER	NOT NULL,							
	reservation_confirm	VARCHAR2(2)	NOT NULL,					
	reservation_memo	VARCHAR2(50)	NULL,					
	reservation_reject	VARCAHR2(20)	NULL					
);

CREATE TABLE payment (
	payment_no	NUMBER	NOT NULL,								
	user_no	NUMBER	NOT NULL,										
	coupon_no	NUMBER	NOT NULL,								
	payment_cost	NUMBER	NOT NULL							
);

CREATE TABLE student (
	student_no	NUMBER	NOT NULL,								
	student_name	VARCHAR2(10)	NOT NULL,					
	student_birth	VARCHAR2(10)	NOT NULL,					
	student_gender	VARCHAR2(2)	NOT NULL,						
	student_email	VARCHAR2(30)	NOT NULL,					
	student_phone	VARCHAR2(11)	NOT NULL,					 
	student_class	VARCHAR2(5)	NOT NULL						
);