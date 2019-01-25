# 파이널 프로젝트
KH 아카데미 파이널 프로젝트  

##  Spring Security

#### 1.  Sesssion은 `${username }`으로 받아온다.
>${username } = member_id

#### 2.  main.jsp에서 접근 설정</h2>
	
- 유저만 접근하고 싶을 때
```
	<security:authorize access="hasRole('USER')">
		<a href="../user/coupone_list">쿠폰 리스트</a>
	</security:authorize>
```	
- 제휴업체만 접근하고 싶을 때
```	
<security:authorize access="hasRole('CLIENT')">
		<a href="../client/menu_list">메뉴 리스트</a>
	</security:authorize>
```
