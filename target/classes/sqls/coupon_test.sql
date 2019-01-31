
select menu_no, menu_title, coupon_used from coupon where  member_no=21 and coupon_used='N' and menu_no=1;

update coupon set coupon_used='Y' 
		where member_no = 21 and client_no=1 and menu_no = 1 AND coupon_used='N'
		and rownum <= 6;
		
SELECT * FROM coupon where member_no = 21 and client_no=1 and menu_no = 1;
