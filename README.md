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
> 404에러가 뜰 경우 경로 앞에 위와같이 ${pageContext.request.contextPath } 추가



## 네이버 로그인
[Spring MVC 를 이용하여 네이버아이디로 로그인 적용하기](https://github.com/Blackseed/NaverLoginTutorial/wiki/Spring-MVC-%EB%A5%BC-%EC%9D%B4%EC%9A%A9%ED%95%98%EC%97%AC-%EB%84%A4%EC%9D%B4%EB%B2%84%EC%95%84%EC%9D%B4%EB%94%94%EB%A1%9C-%EB%A1%9C%EA%B7%B8%EC%9D%B8-%EC%A0%81%EC%9A%A9%ED%95%98%EA%B8%B0)  
[스프링 - 네이버 로그인 구현](https://seonhyungjo.github.io/Spring-NaverSSO_1/)

## 카카오 페이
[아임포트를 통한 카카오 페이](https://www.iamport.kr/getstarted)


## 파일 업로드

1. POM.xml
```
<!-- commons-io -->
<dependency>
	<groupId>commons-io</groupId>
	<artifactId>commons-io</artifactId>
	<version>2.4</version>
</dependency>

<!-- commons-fileupload -->
<dependency>
	<groupId>commons-fileupload</groupId>
	<artifactId>commons-fileupload</artifactId>
	<version>1.3.1</version>
</dependency>
```

2. applicationContext.xml
```
<bean id="multipartResolver" class="org.springframework.web.multipart.commons.CommonsMultipartResolver">
	<property name="maxUploadSize" value="100000000" />
	<property name="defaultEncoding" value="UTF-8"/>
</bean>	
```

