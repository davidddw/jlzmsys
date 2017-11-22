package org.cloud.ssm.mapper;

import java.util.List;

import org.cloud.ssm.base.BaseMapper;
import org.cloud.ssm.domain.Department;

public interface DepartmentMapper extends BaseMapper<Department> {

    List<Department> selectDepartmentList(String id);

}
