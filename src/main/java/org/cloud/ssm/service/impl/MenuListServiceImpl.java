package org.cloud.ssm.service.impl;

import java.util.List;

import org.cloud.ssm.domain.MenuItem;
import org.cloud.ssm.mapper.MenuItemMapper;
import org.cloud.ssm.service.IMenuItemService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuListServiceImpl implements IMenuItemService {
	
	private static final Logger logger = LoggerFactory.getLogger(MenuListServiceImpl.class);

	@Autowired
	private MenuItemMapper menuListMapper;

	@Override
	public List<MenuItem> getTreeData(int lv) {
		List<MenuItem> menuLists = menuListMapper.getMenuList(lv);
		logger.info(menuLists.toString());
		return menuLists;
	}
}
