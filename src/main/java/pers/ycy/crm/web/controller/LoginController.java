package pers.ycy.crm.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pers.ycy.crm.entity.TUser;
import pers.ycy.crm.service.TUserService;


@Controller
public class LoginController {
	@Autowired
	TUserService tUserService;


	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(String username, String password) {
		TUser user = tUserService.login(username, password);
		if (user != null) {
			return "index";
		}
		return "login";
	}

	@RequestMapping(value = {"", "login"}, method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	@RequestMapping(value = {"main"}, method = RequestMethod.GET)
	public String main() {
		return "main";
	}


}
