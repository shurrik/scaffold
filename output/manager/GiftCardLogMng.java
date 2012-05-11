package com.kaoshidian.cms.manager.memberzone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kaoshidian.common.dao.base.EntityView;
import com.kaoshidian.common.dao.memberzone.ExchangeDAO;
import com.kaoshidian.common.dao.page.PageContext;
import com.kaoshidian.common.entity.memberzone.Exchange;

@Service
@Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.REPEATABLE_READ)
public class GiftCardLogMng {

	@Autowired
	private GiftCardLogDAO giftCardLogDAO;
	
	public PageContext queryPage(Integer pageNum,Integer pageSize) throws Exception
	{
		EntityView ev = new EntityView();
		return giftCardLogDAO.queryUsePage(ev, pageNum, pageSize);
	}
	
	public GiftCardLog getById(Integer id)
	{
		return giftCardLogDAO.findById(id);
	}
	
	public GiftCardLog save(GiftCardLog giftCardLog)
	{
		giftCardLogDAO.saveOrUpdate(giftCardLog);
		return giftCardLog;
	}
	
	public void delete(GiftCardLog giftCardLog)
	{
		giftCardLogDAO.delete(giftCardLog);
	}
}
