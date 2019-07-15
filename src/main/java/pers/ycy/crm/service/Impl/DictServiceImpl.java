package pers.ycy.crm.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pers.ycy.crm.dao.DictDao;
import pers.ycy.crm.entity.Dict;
import pers.ycy.crm.service.DictService;

import java.util.List;

@Service
public class DictServiceImpl implements DictService {

	@Autowired
	DictDao dictDao;

	@Override
	public List<Dict> getAllDict() {
		return dictDao.getAllDict();
	}
}
