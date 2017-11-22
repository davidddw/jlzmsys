package org.cloud.ssm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.cloud.ssm.domain.Permission;
import org.cloud.ssm.domain.Role;

public interface RoleMapper {
	
	List<Integer> selectPermissionIdListByRoleId(@Param("id") int id);

    List<Permission> selectPermissionListByRoleIdList(@Param("list") List<Integer> list);

    List<Map<Integer, String>> selectPermissionListByRoleId(@Param("id") int roleId);

	Role selectById(@Param("id") int id);

}
