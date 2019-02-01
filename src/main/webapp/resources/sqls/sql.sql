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

CREATE TABLE member(
	member_no	NUMBER	NOT NULL PRIMARY KEY,				
	member_name	VARCHAR2(500)	NOT NULL,						
	member_id	VARCHAR2(500)	NOT NULL,							
	member_password	VARCHAR2(500)	NOT NULL,					
	member_profile	VARCHAR2(500)	NULL,						
	member_phone	VARCHAR2(500)	NOT NULL,						
	member_date_create	DATE	NOT NULL,						
	member_date_update	DATE	NULL,							
	member_nickname	VARCHAR2(500)	NULL,						
	member_class	VARCHAR2(500)	NOT NULL,						
	member_email	VARCHAR2(500)	NOT NULL,						
	member_role	VARCHAR2(500)	NOT NULL,						
	member_withdraw	VARCHAR2(500)	NULL,						
	member_date_withdraw	DATE	NULL,							
	member_verification	VARCHAR2(500)	NOT NULL				
);

CREATE TABLE client (
	client_no	NUMBER	NOT NULL PRIMARY KEY,								
	user_no	NUMBER	NOT NULL,													
	client_name_store	VARCHAR2(500)	NOT NULL,				
	client_phone_store	VARCHAR2(500)	NULL,					
	client_address	VARCHAR2(500)	NOT NULL,					
	client_registration	VARCHAR2(500)	NOT NULL,				
	client_max_client	VARCHAR2(500)	NULL,					
	client_reservation	VARCHAR2(500)	NOT NULL,
	CONSTRAINT member_fk_member_no FOREIGN KEY(member_no) REFERENCES member(member_no)
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
	board_no	NUMBER	NOT NULL PRIMARY KEY,								
	user_no	NUMBER	NOT NULL,									 					
	board_title	VARCHAR2(500)	NOT NULL,						
	board_content	VARCHAR2(3000)	NOT NULL,					
	board_date_create	DATE	NOT NULL,						
	board_date_update	DATE	NULL,							
	board_category	VARCHAR2(500)	NOT NULL,					
	board_count	NUMBER	NULL,
	board_like NUMBER NULL
);

CREATE TABLE client_request (
	request_no	NUMBER	NOT NULL PRIMARY KEY,								 
	client_no	NUMBER	NOT NULL,								
	user_no	NUMBER	NOT NULL,									
	request_date_create	DATE	NOT NULL,						
	request_date_confirm	DATE	NULL,						
	request_date_terminate	DATE	NULL,						
	request_status	VARCHAR2(500)	NOT NULL,
	CONSTRAINT client_fk_client_no FOREIGN KEY(client_no) REFERENCES client(client_no),
    CONSTRAINT member_fk_member_no FOREIGN KEY(member_no) REFERENCES member(member_no)
);

CREATE TABLE client_like (
	client_like_no	NUMBER	NOT NULL PRIMARY KEY,
	client_no	NUMBER	NOT NULL,								
	user_no	NUMBER	NOT NULL,									
	client_like_count	NUMBER	NULL,							 
	client_like_date_create	DATE	NULL,
	CONSTRAINT client_fk_client_no FOREIGN KEY(client_no) REFERENCES client(client_no)
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






/*테스트멤버*/
DROP TABLE MEMBER;
DROP SEQUENCE member_seq;

CREATE SEQUENCE member_seq;

CREATE TABLE member(
   member_no NUMBER PRIMARY KEY,                           
   member_name    VARCHAR2(500) NOT NULL,                  
   member_id  VARCHAR2(500)   NOT NULL,                     
   member_password    VARCHAR2(500) NOT NULL
);
INSERT INTO member VALUES(member_seq.NEXTVAL,'맥주창고사장','A','123');
INSERT INTO member VALUES(member_seq.NEXTVAL,'7GRAM사장','B','123');
INSERT INTO member VALUES(member_seq.NEXTVAL,'요술포차사장','C','123');
SELECT * FROM member;




-----------------건의사항게시판---------------------------
DROP SEQUENCE complain_board_seq;
DROP TABLE complain_board;
CREATE SEQUENCE complain_board_seq;
CREATE TABLE complain_board (
	complain_no NUMBER NOT NULL,
	complain_category VARCHAR2(100) NOT NULL,
	complain_title VARCHAR2(100) NOT NULL,
	complain_content VARCHAR2(1024) NOT NULL,
	complain_writer VARCHAR2(10) NOT NULL,
	complain_date_create DATE NOT NULL,
	complain_date_update DATE NULL,
	complain_count NUMBER NULL,
	complain_like NUMBER NULL
);

INSERT INTO complain_board VALUES(complain_board_seq.NEXTVAL,'맥주창고','건의사항 게시판 제목','건의사항 게시판 내용부분 테스트중','성원실',SYSDATE,'','0','0');
INSERT INTO complain_board VALUES(complain_board_seq.NEXTVAL,'맥주창고','건의사항 게시판 제목','건의사항 게시판 내용부분 테스트중','성원실',SYSDATE,'','0','0');
INSERT INTO complain_board VALUES(complain_board_seq.NEXTVAL,'요술포차','건의사항 게시판 제목','건의사항 게시판 내용부분 테스트중','성원실',SYSDATE,'','0','0');
INSERT INTO complain_board VALUES(complain_board_seq.NEXTVAL,'맥주창고','건의사항 게시판 제목','건의사항 게시판 내용부분 테스트중','성원실',SYSDATE,'','0','0');
INSERT INTO complain_board VALUES(complain_board_seq.NEXTVAL,'7Gram','건의사항 게시판 제목','건의사항 게시판 내용부분 테스트중','성원실',SYSDATE,'','0','0');
INSERT INTO complain_board VALUES(complain_board_seq.NEXTVAL,'요술포차','건의사항 게시판 제목','건의사항 게시판 내용부분 테스트중','성원실',SYSDATE,'','0','0');
INSERT INTO complain_board VALUES(complain_board_seq.NEXTVAL,'맥주창고','건의사항 게시판 제목','건의사항 게시판 내용부분 테스트중','성원실',SYSDATE,'','0','0');
SELECT * FROM complain_board;



-----------------이용후기게시판---------------------------
DROP TABLE review_board;
DROP SEQUENCE review_board_seq;
CREATE SEQUENCE review_board_seq;
CREATE TABLE review_board (
	review_no NUMBER NOT NULL,
	review_category VARCHAR2(100) NOT NULL,
	review_title VARCHAR2(100) NOT NULL,
	review_content VARCHAR2(1024) NOT NULL,
	review_writer VARCHAR2(10) NOT NULL,
	review_date_create DATE NOT NULL,
	review_date_update DATE NULL,
	review_count NUMBER NULL,
	review_like NUMBER NULL
);

INSERT INTO review_board VALUES(review_board_seq.NEXTVAL,'맥주창고','이용후기게시판 제목','이용후기게시판 내용부분 테스트중','성원실',SYSDATE,'','0','0');
SELECT * FROM review_board;




-----------------제휴업체 신청DB---------------------------








---------------------------제휴업체 리스트--------------------------------------
DROP TABLE client;

DROP SEQUENCE client_seq;

CREATE SEQUENCE client_seq;

CREATE TABLE client (
   client_no   NUMBER   NOT NULL,               --제휴업체 고유번호            
   member_no   NUMBER   NOT NULL,                  --제휴업체 사장님 고유번호                        
   client_name   VARCHAR2(500)   NOT NULL,         --제휴업체 명         
   client_tel   VARCHAR2(500)   NULL,            --제휴업체    번호      
   client_address   VARCHAR2(500)   NOT NULL,      --제휴업체 주소         
   client_registration   VARCHAR2(3)   NOT NULL,   --제휴업체 신청 현황         
   client_max_client   VARCHAR2(500)   NULL,      --제휴업체 최대 예약 가능 인원          
   client_reservation   VARCHAR2(2)   NOT NULL,   --제휴업체 예약 가능 여부
   client_paycode NUMBER NOT NULL            -- 결제 코드
   );
INSERT INTO client VALUES(client_seq.NEXTVAL, 1, '맥주창고', '02-333-2345', '서울시 강남구 테헤란로 3-3', 'Y', '10명', 'N', '0000');
INSERT INTO client VALUES(client_seq.NEXTVAL, 2, '7gram', '02-123-2225', '서울시 강남구 테헤란로 22-22', 'Y', '3명', 'Y', '1111');
INSERT INTO client VALUES(client_seq.NEXTVAL, 3, '요술포차', '02-123-2345', '서울시 강남구 테헤란로 1-1', 'Y', '30명', 'Y', '2222');

SELECT * FROM client;

SELECT * FROM client WHERE client_reservation = 'Y'
   
SELECT client_name,client_tel,client_address,client_registration,client_max_client,client_reservation,client_paycode FROM client WHERE client_no = 1;   













DROP TABLE client;
DROP SEQUENCE client_no_seq;

CREATE SEQUENCE client_no_seq;
CREATE TABLE client (
   client_no   NUMBER   NOT NULL PRIMARY KEY,                        
   member_no   NUMBER   NOT NULL,                                       
   client_name_store   VARCHAR2(500)   NOT NULL,            
   client_phone_store   VARCHAR2(500)   NULL,               
   client_address   VARCHAR2(500)   NOT NULL,               
   client_registration   VARCHAR2(2)   NOT NULL,            
   client_max_client   VARCHAR2(500)   NULL,               
   client_reservation   VARCHAR2(2)   NOT NULL,
   
   CONSTRAINT client_registration_chk CHECK(client_registration IN ('Y','N')),
   CONSTRAINT client_reservation_chk CHECK(client_reservation IN ('Y','N'))
   );



INSERT INTO client VALUES (client_no_seq.NEXTVAL, '1', '원실포차', '02-123-4567', '서울시 송파구  송파대로 111', 'Y', '50', 'Y' );

DELETE FROM client WHERE client_no = 1;


SELECT * FROM client;

------------------------------메뉴 db--------------------------------------

DROP TABLE menu;
DROP SEQUENCE menu_no_seq;

CREATE SEQUENCE menu_no_seq;

CREATE TABLE menu(
   menu_no NUMBER NOT NULL,
   client_no NUMBER NOT NULL,
   
   menu_title   VARCHAR2(500)   NOT NULL,         --메뉴 이름   
   menu_price   NUMBER   NOT NULL,               --메뉴 가격       
   menu_image   VARCHAR2(500)   NULL,            --메뉴 이미지             
   menu_detail   VARCHAR2(500)   NULL,            --메뉴 상세정보    
   menu_create_date DATE NOT NULL            --메뉴 등록날짜
);

INSERT INTO menu VALUES(menu_no_seq.nextval,'1','아메리카노','2500',NULL,'좋은 원두를 씁니다.',SYSDATE);

SELECT * FROM menu;

--DELETE FROM menu WHERE client_no = 8;-- 

--SELECT * FROM client WHERE member_no = 8;--

