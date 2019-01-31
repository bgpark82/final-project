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
	/*CONSTRAINT member_role_chk CHECK(member_role IN('ROLE_USER','ROLE_CLIENT')),*/
	CONSTRAINT member_enabled_chk CHECK(member_enabled IN('1','0'))
);

INSERT INTO member VALUES(1,'김회계','test11','test11',NULL,'1',SYSDATE,NULL,NULL,NULL,'1@1','ROLE_ACCOUNT',NULL,NULL,'1' );
INSERT INTO member VALUES(2,'이홍보','test22','test22',NULL,'2',SYSDATE,NULL,NULL,NULL,'2@2','ROLE_PROMOTION',NULL,NULL,'1' );
INSERT INTO member VALUES(3,'박운영','test33','test33',NULL,'3',SYSDATE,NULL,NULL,NULL,'3@3','ROLE_OPERATION',NULL,NULL,'1' );
UPDATE member SET member_role = 'ROLE_OPERATION' WHERE member_id = '333333';
COMMIT;
SELECT * FROM member;

DROP TABLE client;
DROP SEQUENCE client_seq;

CREATE SEQUENCE client_seq;

CREATE TABLE client (
	client_no	NUMBER	NOT NULL,					--제휴업체 고유번호				
	member_no	NUMBER	NOT NULL,						--제휴업체 사장님 고유번호								
	client_name	VARCHAR2(500)	NOT NULL,			--제휴업체 명			
	client_tel	VARCHAR2(500)	NULL,				--제휴업체	 번호		
	client_address	VARCHAR2(500)	NOT NULL,		--제휴업체 주소			
	client_registration	VARCHAR2(500)	NOT NULL,	--제휴업체 신청 현황			
	client_max_client	VARCHAR2(500)	NULL,		--제휴업체 최대 예약 가능 인원 			
	client_reservation	VARCHAR2(500)	NOT NULL	--제휴업체 예약 가능 여부
);

INSERT INTO client VALUES(client_seq.NEXTVAL,6,'요술포차','010-2222-2222','서울시 강남구 역삼동 222','Y','100','N' );
SELECT * FROM client;

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

SELECT * FROM coupon;

--구매,판매 내역 테이블
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

--학원이 쿠폰 구매시
INSERT INTO coupon_history VALUES(coupon_history_seq.nextval,100,1,1,'회계팀_장세훈','7gram','아메리카노',2000,100,SYSDATE,200000,'구매');
INSERT INTO coupon_history VALUES(coupon_history_seq.nextval,100,1,1,'회계팀_장세훈','7gram','아메리카노',2000,100,TO_DATE('2019-02-04 14:44:13','YYYY-MM-DD HH24:MI:SS'),200000,'구매');


--학원이 쿠폰 판매시
INSERT INTO coupon_history VALUES(coupon_history_seq.nextval,100,1,1,'회계팀_장세훈','7gram','아메리카노',2000,100,TO_DATE('2019-04-04 14:44:13','YYYY-MM-DD HH24:MI:SS'),200000,'판매');
SELECT * FROM coupon_history WHERE coupon_history_info = '판매';

--학생이 쿠폰 구매시
INSERT INTO coupon_history VALUES(coupon_history_seq.nextval,1,2,1,'김단비','7gram','아메리카노',2000,1,SYSDATE,2000,'판매');

--학원(쿠폰 재고 리스트)
SELECT client_no, client_name, menu_no, menu_title, menu_price, count(*) AS coupon_count
FROM coupon 
WHERE member_no = 100 AND coupon_state = 'N' AND client_no = 2 AND menu_no = 1
GROUP BY client_no, client_name, menu_no, menu_title, menu_price
ORDER BY client_no;

--구매요청(coupon 테이블에 쿠폰이 생기지만 coupon_state 값은 N 이다)
INSERT INTO coupon VALUES(coupon_seq.nextval,100,2,1,'맥주창고','점심쿠폰',4000,NULL,'다양한 음식을 준비합니다!',SYSDATE,'N',NULL,'N',NULL,NULL,'Y');

--구매 요청 내역
SELECT client_no,client_name, menu_no, menu_title, menu_price, count(*) AS coupon_count, sum(menu_price) AS total_amount
FROM coupon 
WHERE member_no = 100 AND coupon_state = 'N'
GROUP BY client_no, client_name, menu_no, menu_title, menu_price
ORDER BY client_no;

--구매내역
SELECT coupon_history_no, member_no, member_name, client_no, client_name, menu_no, menu_title, coupon_history_quantity, coupon_history_cost, coupon_history_date 
FROM coupon_history 
WHERE coupon_history_info = '구매' AND EXTRACT(year FROM coupon_history_date) = 2019 AND EXTRACT(month FROM coupon_history_date) = 1;
--AND client_no = '1' 업체별로 볼때 조건에 추가
--AND EXTRACT(day FROM coupon_history_date) = 1 

SELECT EXTRACT(month FROM coupon_history_date) FROM COUPON_HISTORY


--2019년 7gram 월별 구매 통계
SELECT SUM(coupon_history_quantity) FROM coupon_history WHERE coupon_history_info = '구매' AND EXTRACT(year FROM coupon_history_date) = 2019 AND client_no = 1 GROUP BY TO_CHAR(coupon_history_date,'MM') ORDER BY TO_CHAR(coupon_history_date,'MM');

----2019년 7gram 월별 판매 통계
SELECT SUM(coupon_history_quantity) FROM coupon_history WHERE coupon_history_info = '판매' AND EXTRACT(year FROM coupon_history_date) = 2019 AND client_no = 1 GROUP BY TO_CHAR(coupon_history_date,'MM') ORDER BY TO_CHAR(coupon_history_date,'MM');



--판매내역
SELECT coupon_history_no, member_no, member_name, client_no, client_name, menu_no,menu_title, coupon_history_quantity, coupon_history_cost, coupon_history_date 
FROM coupon_history 
WHERE member_no = 1 AND coupon_history_info = '판매' AND EXTRACT(year FROM coupon_history_date) = 2019 AND EXTRACT(month FROM coupon_history_date) = 1;
--AND EXTRACT(day FROM coupon_history_date) = 1 




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
	reservation_no	NUMBER	NOT NULL,							
	member_no	NUMBER	NOT NULL,									
	client_no	NUMBER	NOT NULL,	
	
	member_phone	VARCHAR2(13)	NOT NULL,		
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