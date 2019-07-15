package pers.ycy.crm.service;

import org.apache.ibatis.annotations.Param;
import pers.ycy.crm.entity.TVisit;

import java.util.List;

public interface TVisitService {
	List<TVisit> getAllVisit();

	TVisit getVisitById(String vid);

	void AddVisit(String vaddress, String uvid, String cvid, String vcontent);

	void updateVisitById(String vid, String vaddress, String uvid, String cvid, String vcontent);

	List<TVisit> getTVisitByName(String vaddress);

	List<TVisit> MMP(String cvid, String uvid, String vaddress);
}
