# 파이널 프로젝트
KH 아카데미 파이널 프로젝트  

##  Spring Security

#### 1.  Sesssion은 `${user }`으로 받아온다.
>${user } = MemberDto

#### 2. 권한(member_role)별 경로 시작
- ROLE_USER : `/user`
- ROLE_CLIENT : `/client`
- ROLE_ACCOUNT : `/academy/account`
- ROLE_PROMOTION : `/academy/promotion`
- ROLE_OPERATION : `/academy/operation`

> 권한과 url이 다르면 로그인이 필요하므로 로그인 화면으로 보냄

#### 2.  main.jsp에서 접근 설정</h2>
	
- 유저만 접근하고 싶을 때
```
	<security:authorize access="hasRole('USER')">
		<a href="${pageContext.request.contextPath }/user/coupone_list">쿠폰 리스트</a>
	</security:authorize>
```	
- 제휴업체만 접근하고 싶을 때
```	
<security:authorize access="hasRole('CLIENT')">
		<a href="${pageContext.request.contextPath }/client/menu_list">메뉴 리스트</a>
	</security:authorize>
```
> 404에러가 뜰 경우 경로 앞에 ${pageContext.request.contextPath } 추가
