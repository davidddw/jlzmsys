package org.cloud.ssm.service.impl;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.cloud.ssm.domain.Role;
import org.cloud.ssm.mapper.RoleMapper;
import org.cloud.ssm.mapper.RolePermissionMapper;
import org.cloud.ssm.mapper.UserMapper;
import org.cloud.ssm.service.IRoleService;
import org.cloud.ssm.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImpl implements IRoleService {
	
	@Autowired
	private UserMapper userMapper;
	@Autowired
    private RoleMapper roleMapper;
    @Autowired
    private RolePermissionMapper rolePermissionMapper;
	
	@Override
    public List<Long> getPermissionIdListByRoleId(String userId) {
	    // TODO Auto-generated method stub
	    return null;
    }
    
	@Override
    public Map<String, Set<String>> getPermissionMapByUserId(String userId) {
		Map<String, Set<String>> resourceMap = new HashMap<>();
		int roleId = userMapper.selectRoleIdByUserId(userId);

        Set<String> urlSet = new HashSet<>();
        Set<String> roles = new HashSet<>();
        List<Map<Integer, String>> resourceList = roleMapper.selectPermissionListByRoleId(roleId);
        System.out.println(resourceList.size());
        if (resourceList != null && resourceList.size()!=0) {
            System.out.println(resourceList);
            for (Map<Integer, String> map : resourceList) {
                if (map!=null && StringUtils.isNotBlank(map.get("url"))) {
                    urlSet.add(map.get("url"));
                }
            }
        }
        Role role = roleMapper.selectById(roleId);
        if (role != null) {
            roles.add(role.getName());
        }
        resourceMap.put("urls", urlSet);
        resourceMap.put("roles", roles);
        return resourceMap;
    }
}
