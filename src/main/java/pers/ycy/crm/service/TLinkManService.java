package pers.ycy.crm.service;

import org.apache.ibatis.annotations.Param;
import pers.ycy.crm.entity.TLinkMan;

import java.util.List;

public interface TLinkManService {
	List<TLinkMan> getAllLinkMax();

	TLinkMan getLinkManById(String linkid);

	List<TLinkMan> getLinkManByName(String LinkName);

	void addLinkMan(String linkName, String linkGender, String linkPhone, String linkMobile, String clid);

	void updateLinkManById(String linkid, String linkName, String linkGender, String linkPhone, String linkMobile, String clid);

	List<TLinkMan> getLinkManByLinkNameAndClid(String linkName,String clid);
}
