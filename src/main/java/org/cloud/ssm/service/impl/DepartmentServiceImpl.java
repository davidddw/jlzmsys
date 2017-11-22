package org.cloud.ssm.service.impl;

import java.util.List;

import org.cloud.ssm.domain.Department;
import org.cloud.ssm.dto.DepartmentDto;
import org.cloud.ssm.mapper.DepartmentMapper;
import org.cloud.ssm.service.IDepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

@Service
public class DepartmentServiceImpl extends BaseServiceImpl<DepartmentMapper, Department> implements IDepartmentService {

    @Autowired
    private DepartmentMapper departmentMapper;

    @Override
    public List<Department> getDepartmentList(DepartmentDto departmentDto) {
        PageHelper.startPage(departmentDto.getPage(), departmentDto.getRows());
        return departmentMapper.selectDepartmentList(departmentDto.getDeptId());
    }

    @Override
    public int getDepartmentCount(DepartmentDto departmentDto) {
        return departmentMapper.selectCount(new Department());
    }
}
