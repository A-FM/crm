package pers.ycy.crm.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ycy.crm.dao.TVisitDao;
import pers.ycy.crm.entity.TVisit;
import pers.ycy.crm.service.TVisitService;

import java.util.List;

@Service
public class TVisitServiceImpl implements TVisitService {
	@Autowired
	TVisitDao tVisitDao;


	@Override
	public List<TVisit> getAllVisit() {
		return tVisitDao.getAllVisit();
	}

	@Override
	public TVisit getVisitById(String vid) {
		return tVisitDao.getVisitById(vid);
	}

	@Override
	public void AddVisit(String vaddress, String uvid, String cvid, String vcontent) {
		tVisitDao.AddVisit(vaddress, uvid, cvid, vcontent);
	}

	@Override
	public void updateVisitById(String vid, String vaddress, String uvid, String cvid, String vcontent) {
		tVisitDao.updateVisitById(vid,vaddress,uvid,cvid,vcontent);
	}

	@Override
	public List<TVisit> getTVisitByName(String vaddress) {
		return tVisitDao.getTVisitByName(vaddress);
	}

	@Override
	public List<TVisit> MMP(String cvid, String uvid, String vaddress) {
		return tVisitDao.MMP(cvid,uvid,vaddress);
	}
}
