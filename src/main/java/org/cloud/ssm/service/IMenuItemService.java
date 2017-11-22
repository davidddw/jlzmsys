package org.cloud.ssm.service;

import java.util.List;

import org.cloud.ssm.domain.MenuItem;

public interface IMenuItemService {

	List<MenuItem> getTreeData(int lv);

}
