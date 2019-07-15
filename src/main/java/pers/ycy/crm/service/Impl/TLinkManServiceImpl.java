package pers.ycy.crm.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ycy.crm.dao.TLinkManDao;
import pers.ycy.crm.entity.TLinkMan;
import pers.ycy.crm.service.TLinkManService;

import java.util.List;

@Service
public class TLinkManServiceImpl implements TLinkManService {

	@Autowired
	TLinkManDao tLinkManDao;

	@Override
	public List<TLinkMan> getAllLinkMax() {
		return tLinkManDao.getAllLinkMan();
	}

	@Override
	public TLinkMan getLinkManById(String linkid) {
		return tLinkManDao.getLinkManById(linkid);
	}

	@Override
	public List<TLinkMan> getLinkManByName(String LinkName) {
		return tLinkManDao.getLinkManByName(LinkName);
	}

	@Override
	public void addLinkMan(String linkName, String linkGender, String linkPhone, String linkMobile, String clid) {
		tLinkManDao.addLinkMan(linkName, linkGender, linkPhone, linkMobile, clid);
	}

	@Override
	public void updateLinkManById(String linkid, String linkName, String linkGender, String linkPhone, String linkMobile, String clid) {
		tLinkManDao.updateLinkManById(linkid, linkName, linkGender, linkPhone, linkMobile, clid);
	}

	@Override
	public List<TLinkMan> getLinkManByLinkNameAndClid(String linkName, String clid) {
		return tLinkManDao.getLinkManByLinkNameAndClid(linkName,clid);
	}
}
