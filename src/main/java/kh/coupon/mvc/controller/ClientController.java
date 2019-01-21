package kh.coupon.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("client")
public class ClientController {

	@RequestMapping("menu_list")
	public String menu_list() {
		return "clientViews/menu_list";
	}
	
	
	
	
	
	@RequestMapping("test")
	public String test() {
		return "clientViews/clientControllerTest";
	}

}
