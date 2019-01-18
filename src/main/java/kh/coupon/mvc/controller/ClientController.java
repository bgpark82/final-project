package kh.coupon.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("client")
public class ClientController {
	
	@RequestMapping("test")
	public String test() {
		return "clientViews/clientControllerTest";
	}

}
