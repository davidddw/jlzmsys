package org.cloud.ssm.dto;

import org.cloud.ssm.domain.Department;

public class DepartmentDto extends BaseDto<Department> {

    private String deptId;
    private String name;
    private String simpleName;
  
    public String getDeptId() {
        return deptId;
    }

    public void setDeptId(String deptId) {
        this.deptId = deptId;
    }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSimpleName() {
		return simpleName;
	}

	public void setSimpleName(String simpleName) {
		this.simpleName = simpleName;
	}

	@Override
    public Department generateBean() {
		Department department = new Department();
    	department.setDeptId(deptId);
    	department.setName(name);
    	department.setSimpleName(simpleName);
		if(!"".equals(getId())) {
			department.setId(Integer.parseInt(getId()));
		}
		return department;
    }
}
