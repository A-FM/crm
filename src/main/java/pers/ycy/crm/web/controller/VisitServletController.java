package pers.ycy.crm.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pers.ycy.crm.entity.TCustomer;
import pers.ycy.crm.entity.TUser;
import pers.ycy.crm.entity.TVisit;
import pers.ycy.crm.service.TCustomerService;
import pers.ycy.crm.service.TUserService;
import pers.ycy.crm.service.TVisitService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Controller
public class VisitServletController {
	@Autowired
	TVisitService tVisitService;
	@Autowired
	private TUserService tUserService;
	@Autowired
	private TCustomerService tCustomerService;


	@RequestMapping(value = "VisitServlet", method = RequestMethod.GET)
	public String ShowAllVisit(String id, String control, HttpServletRequest httpServletRequest, String cvid, String uvid, String vaddress) {
		List<TVisit> allVisit = tVisitService.getAllVisit();
		List<TUser> allUser = tUserService.getAllUser();
		List<TCustomer> tCustomers = tCustomerService.GetAllCustomer();
		if ("listAll".equals(control)) {
			amentia(allVisit, allUser, tCustomers);
			httpServletRequest.getSession().setAttribute("list", allVisit);
			return "visit_list";
		} else if ("toAddVisit".equals(control)) {
			httpServletRequest.getSession().setAttribute("uList", allUser);
			httpServletRequest.getSession().setAttribute("cList", tCustomers);
			return "visit_add";
		} else if ("toUpdateVisit".equals(control)) {
			httpServletRequest.getSession().setAttribute("listUser", allUser);
			httpServletRequest.getSession().setAttribute("listCustomer", tCustomers);
			httpServletRequest.getSession().setAttribute("visit", tVisitService.getVisitById(id));
			return "visit_edit";
		} else if ("toDynamicQuery".equals(control)) {
			httpServletRequest.getSession().setAttribute("listCustomer", tCustomers);
			httpServletRequest.getSession().setAttribute("listUser", allUser);
			return "visit_select";
		}
		return null;
	}

	@RequestMapping(value = "VisitServlet", method = RequestMethod.POST)
	public String AddAllVisit(HttpServletRequest httpServletRequest, String control, HttpServletResponse httpServletResponse, String vid, String cvid, String uvid, String vaddress, String vcontent) {
		if ("addVisit".equals(control)) {
			tVisitService.AddVisit(vaddress, uvid, cvid, vcontent);
		} else if ("updateVisit".equals(control)) {
			tVisitService.updateVisitById(vid, vaddress, uvid, cvid, vcontent);
		} else if ("queryByAddress".equals(control)) {
			List<TVisit> tVisitByName = tVisitService.getTVisitByName(vaddress);
			List<TUser> allUser = tUserService.getAllUser();
			List<TCustomer> tCustomers = tCustomerService.GetAllCustomer();
			amentia(tVisitByName, allUser, tCustomers);
			httpServletRequest.getSession().setAttribute("list", tVisitByName);
			return "visit_list";
		} else if ("dynamicQuery".equals(control)) {
			List<TUser> allUser = tUserService.getAllUser();
			List<TCustomer> tCustomers = tCustomerService.GetAllCustomer();
			List<TVisit> mmp = tVisitService.MMP(cvid, uvid, vaddress);

			amentia(mmp, allUser, tCustomers);
			httpServletRequest.getSession().setAttribute("list", mmp);
			return "visit_list";
		}
		return ShowAllVisit(null, "listAll", httpServletRequest, null, null, null);
	}


	private void amentia(List<TVisit> allVisit, List<TUser> allUsers, List<TCustomer> tCustomers) {
		for (TVisit tVisit : allVisit) {
			for (TUser allUser : allUsers) {
				if (tVisit.getUvid().equals(String.valueOf(allUser.getUid()))) {
					tVisit.setUvid(allUser.getUsername());
					break;
				}
			}
			for (TCustomer tCustomer : tCustomers) {
				if (tVisit.getCvid().equals(String.valueOf(tCustomer.getCid()))) {
					tVisit.setCvid(tCustomer.getCustName());
					break;
				}
			}
		}
	}


}
