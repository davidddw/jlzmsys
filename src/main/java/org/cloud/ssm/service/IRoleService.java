package org.cloud.ssm.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

public interface IRoleService {
	
	List<Long> getPermissionIdListByRoleId(String userId);
	
	Map<String, Set<String>> getPermissionMapByUserId(String userId);
}
