package org.cloud.ssm.domain;

import org.cloud.ssm.domain.base.BaseEntity;

public class Department extends BaseEntity {

	private static final long serialVersionUID = 1L;
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
}
