package kh.coupon.mvc.common;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	@Autowired DataSource dataSource;
	
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public AuthenticationSuccessHandler successHandler() {
		return new SuccessHandle();
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(dataSource)
			.usersByUsernameQuery("select member_id, member_password, member_enabled from member where member_id=? ")
			.authoritiesByUsernameQuery("select member_id, member_role from member where member_id=? ");
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
				.antMatchers("/").hasAnyRole()
				.antMatchers("/user/**").hasRole("USER")
				.antMatchers("/client/**").hasRole("CLIENT")
			.and()
				.formLogin()
				.loginPage("/")
				.loginProcessingUrl("/home/login")
				.successHandler(successHandler())
//				.successForwardUrl("/home/main")
				.permitAll()
			.and()
				.logout().deleteCookies("JSESSIONID")
				.permitAll()
			.and()
				.rememberMe().key("unique cookie").tokenValiditySeconds(60*60*24*28)
			.and()
				.exceptionHandling()
				.accessDeniedPage("/home/accessDenied");
		
		
	}
	
	

}
