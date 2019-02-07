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

CREATE TABLE member( --학원의 member_no는 임의로 10000이라하자
	member_no	 NUMBER	 NOT  NULL,		--사용자 고유번호							
	member_name	 VARCHAR2(500) 	NOT  NULL,	--이름					
	member_id	 VARCHAR2(500) 	NOT  NULL,	--아이디						
	member_password	 VARCHAR2(500) 	NOT  NULL,	--비밀번호				
	member_profile 	VARCHAR2(500)	 NULL,	--프로필사진					
	member_phone	 VARCHAR2(500)	 NOT  NULL,	--전화번호					
	member_date_create	 DATE	 NOT  NULL,		--회원가입 날짜	
	member_date_update  	DATE	 NULL,		--내정보 수정일					
	member_nickname 	VARCHAR2(500)	 NULL,	-- 닉네임		
	member_class 	VARCHAR2(500) 	NULL,		--학생이 소속된 반				
	member_email	 VARCHAR2(500)	 NOT  NULL,		-- 이메일
	member_role	 VARCHAR2(500)	 NOT  NULL,		--학생,제휴업체	
	member_withdraw 	VARCHAR2(500)	NULL,	--회원탈퇴여부					
	member_date_withdraw 	DATE	 NULL,		--회원탈퇴날짜					
	member_enabled	 CHAR(2) 	NOT  NULL,  --1이면회원 0이면 탈퇴한회원
	CONSTRAINT member_pk PRIMARY KEY(member_no) ON DELETE CASCADE,
	CONSTRAINT member_uq_id UNIQUE(member_id) ON DELETE CASCADE,
	CONSTRAINT member_uq_phone UNIQUE(member_phone) ON DELETE CASCADE,
	CONSTRAINT member_uq_nickname UNIQUE(member_nickname) ON DELETE CASCADE,
	CONSTRAINT member_uq_email UNIQUE(member_email) ON DELETE CASCADE,
	CONSTRAINT member_role_chk CHECK(member_role IN('ROLE_USER','ROLE_CLIENT')) ON DELETE CASCADE,
	CONSTRAINT member_enabled_chk CHECK(member_enabled IN('1','0')) ON DELETE CASCADE
);

SELECT * FROM MEMBER;
UPDATE MEMBER SET member_role='ROLE_CLIENT' WHERE member_no=68;
DELETE FROM MEMBER WHERE member_no=72;
-------------------------------------------------------
DROP TABLE client;
DROP SEQUENCE client_seq;
CREATE SEQUENCE client_seq;
CREATE TABLE client (
	client_no	 NUMBER 	PRIMARY KEY,	-- 제휴업체 고유번호					
	member_no	 NUMBER 	NOT  NULL,		--사용자 고유번호											
	client_name	 VARCHAR2(500) 	 NOT  NULL,	-- 제휴업체 이름			
	client_tel	 VARCHAR2(500)	 NULL,		-- 제휴업체 전화번호			
	client_address	 VARCHAR2(500)	 NOT  NULL,		--제휴업체 전화번호	 		
	client_registration	 VARCHAR2(2)	 NOT  NULL,		-- 제휴업체로 등록 되었는지 아닌지		
	client_max_client	 VARCHAR2(500)	 NULL,		--예약 가능인원			
	client_reservation 	VARCHAR2(2)  NULL,      -- 제휴업체 예약가능여부
	client_paycode NUMBER NOT NULL, -- 7그램 1111, 맥주창고 2222
	CONSTRAINT fk_client FOREIGN KEY(member_no) REFERENCES member(member_no) ON DELETE CASCADE
);
INSERT INTO client VALUES(client_seq.NEXTVAL,'65','7Gram','010-7777-7777','강남구 테헤란로11','Y','30','',1111);
INSERT INTO client VALUES(client_seq.NEXTVAL,'67','맥주창고','010-8888-8888','강남구 테헤란로12','Y','50','',2222);
INSERT INTO client VALUES(client_seq.NEXTVAL,'68','요술포차','010-0000-0000','강남구 테헤란로13','Y','150','',3333);
COMMIT;
select * from client where client_no=#{dto.client_no};
SELECT * FROM CLIENT;
------------------세훈오빠가 만든 메뉴 테이블---------------

DROP TABLE menu;
DROP SEQUENCE menu_seq;
CREATE SEQUENCE menu_seq;
CREATE TABLE menu(
	menu_no NUMBER PRIMARY KEY,
	client_no NUMBER NOT NULL, --7gram은 고유번호를 1로해놓자 일단
	menu_title VARCHAR2(500) NOT NULL,
	menu_price NUMBER NOT NULL,
	menu_image VARCHAR2(500) NULL,
	menu_detail VARCHAR2(500) NULL,
	menu_create_date DATE NOT NULL,
	CONSTRAINT fk_menu FOREIGN KEY(client_no) REFERENCES client(client_no) ON DELETE CASCADE
);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'1','아메리카노','2000','../img/americano.png','좋은원두를 사용합니다!',SYSDATE);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'1','딸기스무디','3000','../img/strawberrySmothy.png','국산 딸기를 사용합니다!',SYSDATE);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'1','레몬티','2000','../img/remonTea.png','레몬레몬 상큼상큼~',SYSDATE);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'1','카페모카','3000','../img/cafemoca.png','커피와 초코의 만남!',SYSDATE);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'1','유자프라페','3000','../img/ujaPrafa.png','유자먹고 감기조심하세요~',SYSDATE);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'1','요거트스무디','3000','../img/yogutSmothy.png','몸에좋은 요거트!',SYSDATE);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'1','자몽에이드','3000','../img/jamongAide.png','자몽먹으면 다이어트!',SYSDATE);
INSERT INTO menu VALUES(menu_seq.NEXTVAL,'1','망고스무디','3000','../img/mangoSmothy.png','망고망고해~',SYSDATE);

INSERT INTO menu VALUES(menu_seq.NEXTVAL,'2','점심쿠폰','4500','../img/coupon.png','KH학생들만을위한 점심쿠폰',SYSDATE);
COMMIT;
SELECT * FROM menu;
DELETE FROM menu WHERE menu_no=9;

-------------------세훈오빠가 만든 coupon DB(민이가 제약조건 추가)--------------------------------
DROP TABLE coupon;
DROP SEQUENCE coupon_seq;
CREATE SEQUENCE coupon_seq;
CREATE TABLE coupon (
	--해당 쿠폰의 기본정보
	coupon_no	 NUMBER	 PRIMARY  KEY,					--쿠폰 고유번호					 
	client_no	 NUMBER 	NOT  NULL,					--제휴업체 고유번호								
	member_no	 NUMBER 	NOT  NULL,					--구매한 멤버의 고유번호
	menu_no NUMBER NOT NULL,
	--해당 쿠폰의 정보
	client_name	 VARCHAR2(500) 	NOT   NULL,	--제휴업체명
	menu_title	 VARCHAR2(500)	 NOT   NULL,		--쿠폰 이름(메뉴명)	
	menu_price	 NUMBER	 NOT  NULL,				--쿠폰 가격 		
	menu_image	 VARCHAR2(500)  	NULL,			--쿠폰 이미지 				
	menu_detail	 VARCHAR2(500)  	NULL,			--쿠폰 상세정보 				
	coupon_date_create	 DATE	 NOT  NULL,			--쿠폰 생성일(즉, 학원이 제휴업체에게 구매한 날짜가 됨)
	coupon_used		 VARCHAR2(2) 	 NOT   NULL,		--쿠폰 사용여부
	coupon_buy_date DATE NULL, --쿠폰 판매된날(학생이 학원쪽에서 쿠폰을 구매한날)
	--선물 기능을 위한 컬럼 
	coupon_used_send	 VARCHAR2(2)  NOT   NULL,		--쿠폰 선물여부
	coupon_send_date	 DATE	 NULL,				--쿠폰 선물날짜(유저가 유저에게 선물한 날짜)
	coupon_from	   VARCHAR2(500)	   NULL,				--쿠폰 선물 보낸 사람(조인을 피해기 위해 컬럼을 가지고있음)
	coupon_state VARCHAR2(2) NOT NULL,
	CONSTRAINT fk_coupon FOREIGN KEY(member_no) REFERENCES member(member_no) ON DELETE CASCADE,
	CONSTRAINT fk_coupon2 FOREIGN KEY(client_no) REFERENCES client(client_no) ON DELETE CASCADE,
	CONSTRAINT fk_coupon3 FOREIGN KEY(menu_no) REFERENCES menu(menu_no) ON DELETE CASCADE
);
INSERT INTO coupon VALUES(coupon_seq.nextval,1,10000,1,'7gram','아메리카노',2000,'../img/americano.png','좋은원두를 사용합니다!',SYSDATE,'N',NULL,'N',NULL,NULL,'Y');
INSERT INTO coupon VALUES(coupon_seq.nextval,1,10000,2,'7gram','딸기스무디',3000,'../img/strawberrySmothy.png','딸기딸기 상큼상큼 비타민 가득!',SYSDATE,'N',NULL,'N',NULL,NULL,'Y');
INSERT INTO coupon VALUES(coupon_seq.nextval,1,10000,3,'7gram','레몬티',2000,'../img/remonTea.png','레몬레몬 상큼상큼 비타민 가득!',SYSDATE,'N',NULL,'N',NULL,NULL,'Y');
INSERT INTO coupon VALUES(coupon_seq.nextval,1,10000,4,'7gram','카페모카',3000,'../img/cafemoca.png','커피와 초코의 조합!',SYSDATE,'N',NULL,'N',NULL,NULL,'Y');
INSERT INTO coupon VALUES(coupon_seq.nextval,1,10000,5,'7gram','유자프라페',3000,'../img/ujaPrafa.png','유자먹고 감기조심하세요~!',SYSDATE,'N',NULL,'N',NULL,NULL,'Y');
INSERT INTO coupon VALUES(coupon_seq.nextval,1,10000,6,'7gram','요거트스무디',3000,'../img/yogutSmothy.png','유기농 요거트로만든 요거트스무디!',SYSDATE,'N',NULL,'N',NULL,NULL,'Y');
INSERT INTO coupon VALUES(coupon_seq.nextval,1,10000,7,'7gram','자몽에이드',3000,'../img/jamongAide.png','자몽자몽해~!',SYSDATE,'N',NULL,'N',NULL,NULL,'Y');
INSERT INTO coupon VALUES(coupon_seq.nextval,1,10000,8,'7gram','망고스무디',3000,'../img/mangoSmothy.png','망고망고해~',SYSDATE,'N',NULL,'N',NULL,NULL,'Y');

INSERT INTO coupon VALUES(coupon_seq.nextval,2,10000,10,'맥주창고','점심쿠폰',4500,'../img/coupon.png','KH학생들만을위한 점심쿠폰',SYSDATE,'N',NULL,'N',NULL,NULL,'Y');

COMMIT;


update coupon set coupon_used='Y' 
where member_no = #{member_no} and client_no=#{client_no} and menu_no = #{menu_no}
and rownum <= #{coupon_count}

SELECT client_no, member_no, client_name, menu_no, menu_title, menu_image, menu_price, 
		(select count(*) from coupon WHERE member_no = 10000 AND menu_no=7 AND coupon_state = 'Y') as coupon_count   
		FROM coupon 
		WHERE member_no=10000 AND menu_no=7 AND client_no=1 AND rownum = 1 
		GROUP BY client_no, member_no, client_name, menu_no, menu_title, menu_image, menu_price;

--쿠폰선물할때
update coupon set member_no=#{memb24er_no},coupon_used_send='Y',coupon_send_date=SYSDATE,coupon_from=#{member_no}
where member_no = #{member_no} and client_no=#{client_no} and menu_no = #{menu_no}
and rownum <= #{coupon_count}

SELECT * FROM coupon;
---------------------------------------------------------
DROP TABLE coupon_history;
DROP SEQUENCE coupon_history_seq;
CREATE SEQUENCE coupon_history_seq;
CREATE TABLE coupon_history(
	coupon_history_no NUMBER PRIMARY KEY,
	member_no NUMBER NOT NULL,
	client_no NUMBER NOT NULL,
	menu_no NUMBER NOT NULL,
	member_name VARCHAR2(100) NOT NULL,
	client_name VARCHAR2(100) NOT NULL,
	menu_title VARCHAR2(100) NOT NULL,
	menu_price NUMBER NOT NULL,
	coupon_history_quantity NUMBER NOT NULL,
	coupon_history_date DATE NOT NULL,
	coupon_history_cost NUMBER NOT NULL,
	coupon_history_info VARCHAR2(500) NOT NULL,
	CONSTRAINT fk_coupon_history FOREIGN KEY(member_no) REFERENCES member(member_no) ON DELETE CASCADE,
	CONSTRAINT fk_coupon_history2 FOREIGN KEY(client_no) REFERENCES client(client_no) ON DELETE CASCADE,
	CONSTRAINT fk_coupon_history3 FOREIGN KEY(menu_no) REFERENCES menu(menu_no) ON DELETE CASCADE
);
--coupon_history 값 넣기 
INSERT INTO coupon_history VALUES(coupon_history_seq.nextval,61,1,1,'이민이','7gram','아메리카노', 2000, 1, SYSDATE, 2000, '판매');
INSERT INTO coupon_history VALUES(coupon_history_seq.nextval,61,1,3,'이민이','7gram','레몬티', 2000, 1, SYSDATE, 2000, '판매');

INSERT INTO coupon_history VALUES(coupon_history_seq.nextval,61,1,4,'이민이','7gram','카페모카',3000,1,'2018/12/30',3000,'판매');
INSERT INTO coupon_history VALUES(coupon_history_seq.nextval,61,1,2,'이민이','7gram','딸기스무디',3000,1,SYSDATE,3000,'판매');
COMMIT;

SELECT * FROM coupon_history;



--------------------------------------------------------

CREATE TABLE member_reservation (      --—예약 테이블
   reservation_no   NUMBER   NOT NULL,    --—예약 고유번호         
   member_no   NUMBER NOT NULL,     --—멤버 고유번호            
   client_no   NUMBER NOT NULL,     --—제휴업체 고유번호
   member_phone   VARCHAR2(13) NOT NULL,      --—멤버 핸드폰번호
   reservation_date_request   DATE   NOT NULL,   --—예약 생성 날짜예
   reservation_date   VARCHAR2(50)   NOT NULL,   --—예약 신청 날짜        
   reservation_people   NUMBER   NOT NULL,         --—-예약 인원         
   reservation_time   NUMBER   NOT NULL,      --—예약 시간            
   reservation_confirm   VARCHAR2(2)   NOT NULL,      --—예약 확인(Y,N)         
   reservation_memo   VARCHAR2(50)   NULL,      --—예약 시 요청 사항         
   reservation_reject   VARCHAR2(20)   NULL      --—예약 거부 사유         
);


SELECT * FROM member_reservation; 




-----------------------------------------------
/*
 *  작성자 : 이민이
 *  작성일 : 2019-01-15
 *  제목 : 이용후기 게시판 테이블
 *  (게시판번호,제목,내용,작성자,작성일,수정일,조회수)
 */
DROP TABLE board;
DROP SEQUENCE board_seq;
CREATE SEQUENCE board_seq;
CREATE TABLE board (
	board_no NUMBER PRIMARY KEY,
	member_no NUMBER NOT NULL,
	board_category VARCHAR2(100) NOT NULL, -- 7그램,맥주창고,요술포차...,공지사항,건의사항
	board_title VARCHAR2(100) NOT NULL,
	board_content VARCHAR2(1024) NOT NULL,
	board_writer VARCHAR2(10) NOT NULL,
	board_date_create DATE NOT NULL,
	board_date_update DATE NULL,
	board_count NUMBER NOT NULL,
	board_like_count NUMBER NULL,
	CONSTRAINT fk_board FOREIGN KEY(member_no) REFERENCES member(member_no) ON DELETE CASCADE
);
INSERT INTO board VALUES(board_seq.NEXTVAL,61,'7Gram','7Gram이용후기게시판 이용안내','이용후기게시판 내용부분 테스트중','이민이',SYSDATE,'','0','0');
INSERT INTO board VALUES(board_seq.NEXTVAL,61,'맥주창고','맥주창고 이용후기게시판 이용안내','맥주창고 이용후기게시판 내용부분 테스트중','이민이',SYSDATE,'','0','0');
COMMIT;
SELECT * FROM board;
SELECT * FROM board WHERE BOARD_CATEGORY='7Gram';
DELETE FROM board WHERE BOARD_WRITER='이민이' AND BOARD_CATEGORY='notice';
------------------------------------------------

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




SELECT client_no, member_no, client_name, menu_no, menu_title, menu_image, menu_price, 
		(select count(*) from coupon WHERE member_no = 10000 AND menu_no=3 AND coupon_state = 'Y') as coupon_count   
		FROM coupon 
		WHERE member_no=10000 AND menu_no=3 AND rownum = 1 
		GROUP BY client_no, member_no, client_name, menu_no, menu_title, menu_image, menu_price;
		
		
		