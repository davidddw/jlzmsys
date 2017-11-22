package org.cloud.ssm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.cloud.ssm.domain.MenuItem;

public interface MenuItemMapper {
	List<MenuItem> getMenuList(@Param("lv") int lv);
}
