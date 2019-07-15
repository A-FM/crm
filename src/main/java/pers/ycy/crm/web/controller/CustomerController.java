package pers.ycy.crm.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pers.ycy.crm.entity.Dict;
import pers.ycy.crm.entity.TCustomer;
import pers.ycy.crm.service.DictService;
import pers.ycy.crm.service.TCustomerService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class CustomerController {

	@Autowired
	DictService dictService;

	@Autowired
	TCustomerService tCustomerService;


	@RequestMapping(value = {"ToAddServlet"}, method = RequestMethod.GET)
	public String AddServlet(HttpServletRequest httpServletRequest) {
		List<Dict> allDict = dictService.getAllDict();
		httpServletRequest.getSession().setAttribute("list", allDict);
		return "customer_add";
	}

	@RequestMapping(value = {"AddCustServlet"}, method = RequestMethod.POST)
	public String ToAddServlet(String custname, String custlevel, String custsource, String custphone, String custmobile, HttpServletRequest httpServletRequest) {
		tCustomerService.AddCustomer(custname, custsource, custphone, custmobile, custlevel);
		SelectAllCust(httpServletRequest);
		return "customer_list";
	}

	@RequestMapping(value = "SelectAllCust", method = RequestMethod.GET)
	public String SelectAllCust(HttpServletRequest httpServletRequest) {
		List<TCustomer> tCustomers = tCustomerService.GetAllCustomer();
		List<Dict> allDict = dictService.getAllDict();
		CustLevelToDname(tCustomers, allDict);
		httpServletRequest.getSession().setAttribute("list", tCustomers);
		return "customer_list";
	}

	@RequestMapping(value = "DeleteCustServlet", method = RequestMethod.GET)
	public void DeleteCustomer(int id, HttpServletResponse httpServletResponse) {
		tCustomerService.DeletedCustomer(id);
		try {
			httpServletResponse.sendRedirect("SelectAllCust");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "ToUpdateServlet", method = RequestMethod.GET)
	public String UpdateCustomerGet(int id,HttpServletRequest httpServletRequest) {
		TCustomer customerById = tCustomerService.getCustomerById(id);
		List<Dict> allDict = dictService.getAllDict();
		httpServletRequest.getSession().setAttribute("list",allDict);
		httpServletRequest.getSession().setAttribute("customer",customerById);
		return "customer_edit";
	}
	@RequestMapping(value = "UpdateCustServlet", method = RequestMethod.POST)
	public void UpdateCustomerPost(int cid,String custname,String custlevel,String custsource,String custphone,String custmobile, HttpServletResponse httpServletResponse) {
		tCustomerService.UpdateCustomer(cid,custname,custsource,custphone,custmobile,custlevel);
		try {
			httpServletResponse.sendRedirect("SelectAllCust");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value = "PageLimitServlet", method = RequestMethod.GET)
	public String PageLimitServlet(String currentPage,HttpServletRequest httpServletRequest) {
		List<TCustomer> tCustomers = tCustomerService.GetAllCustomer();
		List<Dict> allDict = dictService.getAllDict();
		CustLevelToDname(tCustomers, allDict);
		httpServletRequest.getSession().setAttribute("cList", tCustomers);
		return "customer_limitPage";
	}


	@RequestMapping(value = "QueryByName", method = RequestMethod.POST)
	public String QueryByName(String custname,HttpServletRequest httpServletRequest) {

		List<TCustomer> tCustomers = tCustomerService.getCustomerByName(custname);
		List<Dict> allDict = dictService.getAllDict();
		CustLevelToDname(tCustomers, allDict);
		httpServletRequest.getSession().setAttribute("list", tCustomers);
		return "customer_list";
	}


	private void CustLevelToDname(List<TCustomer> tCustomers, List<Dict> dicts) {
		for (TCustomer tCustomer : tCustomers) {
			for (Dict dict : dicts) {
				if (tCustomer.getCustLevel().equals(dict.getDid())) {
					tCustomer.setCustLevel(dict.getDname());
				}
			}
		}
	}


}
