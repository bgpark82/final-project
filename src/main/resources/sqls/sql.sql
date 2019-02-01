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
	member_enabled	CHAR(2)	NOT NULL,
	CONSTRAINT member_pk PRIMARY KEY(member_no),
	CONSTRAINT member_uq_id UNIQUE(member_id),
	CONSTRAINT member_uq_phone UNIQUE(member_phone),
	CONSTRAINT member_uq_nickname UNIQUE(member_nickname),
	CONSTRAINT member_uq_email UNIQUE(member_email),
	CONSTRAINT member_role_chk CHECK(member_role IN('ROLE_USER','ROLE_CLIENT')),
	CONSTRAINT member_enabled_chk CHECK(member_enabled IN('1','0'))
);

SELECT * FROM MEMBER;

CREATE TABLE client (
	client_no	NUMBER	NOT NULL,					--제휴업체 고유번호				
	member_no	NUMBER	NOT NULL,					--제휴업체 사장님 고유번호								
	client_name	VARCHAR2(500)	NOT NULL,			--제휴업체 명			
	client_tel	VARCHAR2(500)	NULL,				--제휴업체	 번호		
	client_address	VARCHAR2(500)	NOT NULL,		--제휴업체 주소			
	client_registration	VARCHAR2(500)	NOT NULL,	--제휴업체 신청 현황			
	client_max_client	VARCHAR2(500)	NULL,		--제휴업체 최대 예약 가능 인원 			
	client_reservation	VARCHAR2(500)	NOT NULL	--제휴업체 예약 가능 여부
);

CREATE TABLE coupon (
	--해당 쿠폰의 기본정보
	coupon_no	NUMBER	NOT NULL,					--쿠폰 고유번호		
	member_no	NUMBER	NOT NULL,					--구매한 멤버의 고유번호			 
	client_no	NUMBER	NOT NULL,					--제휴업체 고유번호
	menu_no 	NUMBER NOT NULL,					--메뉴 고유번호								
	
	--해당 쿠폰의 정보
	client_name	VARCHAR2(500)	NOT NULL,			--제휴업체명
	menu_title	VARCHAR2(500)	NOT NULL,			--쿠폰 이름(메뉴명)	
	menu_price	NUMBER			NOT NULL,			--쿠폰 가격 		
	menu_image	VARCHAR2(500)	NULL,				--쿠폰 이미지 				
	menu_detail	VARCHAR2(500)	NULL,				--쿠폰 상세정보 				
	coupon_date_create	DATE	NOT NULL,			--쿠폰 생성일(학원이 제휴업체에게 구매요청이 완료된 날)
	coupon_used		VARCHAR2(2) NOT NULL,			--쿠폰 사용여부
	coupon_buy_date DATE 		NULL, 				--쿠폰 판매된 날(학생이 학원쪽에서 쿠폰을 구매한날)
	
	--선물 기능을 위한 컬럼 
	coupon_used_send	VARCHAR2(2) NOT NULL,		--쿠폰 선물여부
	coupon_send_date	DATE	NULL,				--쿠폰 선물날짜(유저가 유저에게 선물한 날짜)
	coupon_from	VARCHAR2(500)	NULL,				--쿠폰 선물 보낸 사람(조인을 피해기 위해 컬럼을 가지고있음)
	
	--쿠폰 구매 요청 후 정상적인 구매가 이루어졌는지 판단 하는 컬럼
	coupon_state varchar(2) NOT NULL				--쿠폰 구매 요청 후 처리가 됬는지 확인
);

DROP SEQUENCE coupon_history_seq;
DROP TABLE coupon_history;
CREATE SEQUENCE coupon_history_seq;
CREATE TABLE coupon_history(
	coupon_history_no NUMBER NOT NULL,			--쿠폰 구매,판매 내역의 고유번호
	member_no NUMBER NOT NULL,					--유저 고유번호(누가 삿는지 판단)
	client_no NUMBER NOT NULL,					--해당 쿠폰의 제휴업체 고유번호
	menu_no NUMBER NOT NULL,					--해당 제휴업체의 메뉴번호
	--유저 정보
	member_name VARCHAR2(100) NOT NULL,			--유저 이름
	--업체 정보
	client_name VARCHAR2(100) NOT NULL,			--해당 쿠폰의 제휴업체 명(조인을 피하기 위해 가지고있는다)
	--메뉴 정보
	menu_title VARCHAR2(100) NOT NULL,			--해당 제휴업체의 메뉴타이틀
	menu_price NUMBER NOT NULL,					--해당 메뉴 가격
	--coupon_history 테이블의 기본 정보
	coupon_history_quantity NUMBER NOT NULL,	--거래(판매,구매) 수량
	coupon_history_date DATE NOT NULL,			--거래(판매,구매) 내역 날짜
	coupon_history_cost NUMBER NOT NULL,		--거래(판매,구매) 비용
	coupon_history_info VARCHAR2(100) NOT NULL	--거래 정보(판매 & 구매 판단 컬럼)
);

DROP SEQUENCE menu_seq;
DROP TABLE menu;
CREATE SEQUENCE menu_seq;
CREATE TABLE menu(
	menu_no NUMBER NOT NULL,						--메뉴 고유번호
	client_no NUMBER NOT NULL,						--제휴업체 고유번호
	client_name varchar2(500) NOT NULL,				--제휴업체 이름
	
	menu_title	VARCHAR2(500)	NOT NULL,			--메뉴 이름	
	menu_price	NUMBER	NOT NULL,					--메뉴 가격 		
	menu_image	VARCHAR2(500)	NULL,				--메뉴 이미지 				
	menu_detail	VARCHAR2(500)	NULL,				--메뉴 상세정보 	
	menu_create_date DATE NOT NULL					--메뉴 등록날짜
);

CREATE TABLE board (
	board_no	NUMBER	NOT NULL,								
	member_no	NUMBER	NOT NULL,									 					
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
	member_no	NUMBER	NOT NULL,									
	request_date_create	DATE	NOT NULL,						
	request_date_confirm	DATE	NULL,						
	request_date_terminate	DATE	NULL,						
	request_status	VARCHAR2(500)	NOT NULL					 
);

CREATE TABLE client_like (
	client_like_no	NUMBER	NOT NULL,							
	client_no	NUMBER	NOT NULL,								
	member_no	NUMBER	NOT NULL,									
	client_like_count	NUMBER	NULL,							 
	client_like_date_create	DATE	NULL						
);

CREATE TABLE board_like (
	board_like_no	NUMBER	NOT NULL,
	board_no	NUMBER	NOT NULL,
	member_no	NUMBER	NOT NULL,
	board_like_count	NUMBER	NOT NULL,
	board_like_date_create	DATE	NOT NULL
);

CREATE TABLE board_reply (
	reply_no	NUMBER	NOT NULL,								
	board_no	NUMBER	NOT NULL,								
	member_no	NUMBER	NOT NULL,										
	reply_title	VARCHAR2(500)	NOT NULL,						
	reply_content	VARCHAR2(3000)	NOT NULL,					
	reply_date_create	DATE	NOT NULL,						
	reply_date_update	DATE	NULL							
);


CREATE TABLE member_reservation (					--예약 테이블
	reservation_no	NUMBER	NOT NULL,				--예약 고유번호			
	member_no	NUMBER	NOT NULL,					--멤버 고유번호				
	client_no	NUMBER	NOT NULL,					--제휴업체 고유번호
	
	member_phone	VARCHAR2(13)	NOT NULL,		--멤버 핸드폰번호
	reservation_date_request	DATE	NOT NULL,	--예약 신청 날짜
	reservation_date	VARCHAR2(50)	NOT NULL,	--예약 생성 날짜			
	reservation_people	NUMBER	NOT NULL,			--예약 인원			
	reservation_time	NUMBER	NOT NULL,			--예약 시간				
	reservation_confirm	VARCHAR2(2)	NOT NULL,		--예약 확인(Y,N)			
	reservation_memo	VARCHAR2(50)	NULL,		--예약 시 요청 사항			
	reservation_reject	VARCAHR2(20)	NULL		--예약 거부 사유			
);

CREATE TABLE payment (
	payment_no	NUMBER	NOT NULL,								
	member_no	NUMBER	NOT NULL,										
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