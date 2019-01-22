package kh.coupon.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {

	@RequestMapping("/")
	public String index(@CookieValue(value="remember-me", required=false) String cookie) {
		if(cookie != null) {
			System.out.println(cookie);
			return "main";
		} else {
			return "index";
		}
	}
}
