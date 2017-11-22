package org.cloud.ssm.service;

import java.util.List;

import org.cloud.ssm.domain.Department;
import org.cloud.ssm.dto.DepartmentDto;

public interface IDepartmentService extends IBaseService<Department>{

    List<Department> getDepartmentList(DepartmentDto departmentDto);
    
    int getDepartmentCount(DepartmentDto departmentDto);
}
