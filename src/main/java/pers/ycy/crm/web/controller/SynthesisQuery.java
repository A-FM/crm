package pers.ycy.crm.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pers.ycy.crm.dao.DictDao;
import pers.ycy.crm.entity.CustomerEx;
import pers.ycy.crm.entity.Dict;
import pers.ycy.crm.entity.TCustomer;
import pers.ycy.crm.service.DictService;
import pers.ycy.crm.service.TCustomerService;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class SynthesisQuery {

	@Autowired
	DictDao dictDao;
	@Autowired
	TCustomerService tCustomerService;
	@Autowired
	DictService dictService;

	@RequestMapping(value = "CustServlet",method = RequestMethod.GET)
	public String CustomerQuery(String control,HttpServletRequest httpServletRequest){
		if("toDynamicQuery".equals(control)){
			List<Dict> allDict = dictDao.getAllDict();
			httpServletRequest.getSession().setAttribute("list",allDict);
			return "customer_select";
		}else if("statistics".equals(control)){
			List<CustomerEx> customerExes = tCustomerService.CustomerSource();
			httpServletRequest.getSession().setAttribute("list",customerExes);
			return "customer_sourceCount";
		}else if("statisticsLevel".equals(control)){
			List<CustomerEx> customerExes = tCustomerService.CustomerLevel();
			httpServletRequest.getSession().setAttribute("list",customerExes);
			return "customer_levelCount";
		}
		return null;

	}
	@RequestMapping(value = "CustServlet",method = RequestMethod.POST)
	public String CustomerQuery(String control,String custname,String custlevel,String custsource,HttpServletRequest httpServletRequest){
		if("dynamicQuery".equals(control)) {
			List<TCustomer> tCustomers = tCustomerService.QueryCustomerInfo(custname, custsource, custlevel);
			List<Dict> allDict = dictService.getAllDict();
			CustLevelToDname(tCustomers, allDict);
			httpServletRequest.getSession().setAttribute("list", tCustomers);
			return "customer_list";
		}
		return null;
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

