package pers.ycy.crm.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pers.ycy.crm.entity.TCustomer;
import pers.ycy.crm.entity.TLinkMan;
import pers.ycy.crm.service.TCustomerService;
import pers.ycy.crm.service.TLinkManService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class TLinkManController {

	@Autowired
	private TLinkManService tLinkManService;
	@Autowired
	private TCustomerService tCustomerService;

	@RequestMapping(value = "LinkManServlet",method = RequestMethod.GET)
	public String getAllLinkMan(String id,String control, HttpServletRequest httpServletRequest){
		List<TLinkMan> allLinkMax = tLinkManService.getAllLinkMax();
		List<TCustomer> tCustomers = tCustomerService.GetAllCustomer();
		/*返回列表*/
		if("list".equals(control)){
			LinkAndCust(allLinkMax,tCustomers);
			httpServletRequest.getSession().setAttribute("list",allLinkMax);
			return "linkMan_list";
		}
		else if("toadd".equals(control)){
			httpServletRequest.getSession().setAttribute("list",tCustomers);
			return "linkMan_add";
		}else if("selectById".equals(control)){
			httpServletRequest.getSession().setAttribute("list",tCustomers);
			httpServletRequest.getSession().setAttribute("linkMan",tLinkManService.getLinkManById(id));
			return "linkMan_edit";
		}else if("toDynamicQuery".equals(control)){
			httpServletRequest.getSession().setAttribute("list",tCustomers);
			return "linkMan_select";
		}
		return null;
	}
	@RequestMapping(value = "LinkManServlet",method = RequestMethod.POST)
	public String changeAllLinkMan(String linkid, String linkname, String linkgender, String linkphone, String linkmobile, String clid, String control, HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse){
		if("addLinkMan".equals(control)){
			tLinkManService.addLinkMan(linkname,linkgender,linkphone,linkmobile,clid);
		}
		/* 修改联系人 */
		else if("updateLinkMan".equals(control)){
			tLinkManService.updateLinkManById(linkid,linkname,linkgender,linkphone,linkmobile,clid);
		}else if("queryByName".equals(control)){
			List<TLinkMan> linkManByName = tLinkManService.getLinkManByName(linkname);
			List<TCustomer> tCustomers = tCustomerService.GetAllCustomer();
			LinkAndCust(linkManByName,tCustomers);
			httpServletRequest.getSession().setAttribute("list",linkManByName);
			return "linkMan_list";
		}else if("dynamicQuery".equals(control)){
			List<TLinkMan> linkManByLinkNameAndClid = tLinkManService.getLinkManByLinkNameAndClid(linkname, clid);
			List<TCustomer> tCustomers = tCustomerService.GetAllCustomer();
			LinkAndCust(linkManByLinkNameAndClid,tCustomers);
			httpServletRequest.getSession().setAttribute("list",linkManByLinkNameAndClid);
			return "linkMan_list";
		}

		return getAllLinkMan(null,"list",httpServletRequest);
	}

	private void LinkAndCust(List<TLinkMan> tLinkMans,List<TCustomer> customers){
		for (TLinkMan tLinkMan : tLinkMans) {
			for (TCustomer customer : customers) {
				if(tLinkMan.getClid().equals(String.valueOf(customer.getCid()))){
					tLinkMan.setClid(customer.getCustName());
				}
			}
		}
	}

}
