package kh.coupon.mvc.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

@Component
public class LoggerConfig {
// LoggerConfig를 Spring container에 등록	
	
	@Bean
	public Logger logger() {
	// loggerConfig안에 logger Bean을 만들어주면 HomeController에 @Autowire 시킨 logger이름의 객체를 찾아서 연결
		return LoggerFactory.getLogger(getClass().getName());
		// 리턴 타입이 Logger이므로 logger라는 이름으로 Bean등록이 된다.
	}	
}
