package kh.coupon.mvc.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;

import kh.coupon.mvc.common.NaverLoginBO;

@Controller
public class IndexController {
	
	private NaverLoginBO naverLoginBO;
	
	@Autowired
	public void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	@RequestMapping("/")
	public String index(@CookieValue(value="remember-me", required=false) String cookie, Model model, HttpSession session) {
		if(cookie != null) {
			System.out.println(cookie);
			return "main";
		} else {
			 String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
			 System.out.println("==========>> session : " + session);
			 System.out.println("==========>> " +naverAuthUrl);
			 model.addAttribute("url", naverAuthUrl);
			return "index";
		}
	}

	
	@RequestMapping("/callback")
	public ModelAndView callback(@RequestParam String code, @RequestParam String state, HttpSession session) throws IOException {
		/* 네아로 인증이 성공적으로 완료되면 code 파라미터가 전달되며 이를 통해 access token을 발급 */
		System.out.println(naverLoginBO);
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);

		return new ModelAndView("callback");
	}
	
	
}
