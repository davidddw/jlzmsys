package org.cloud.ssm.dto;

import org.cloud.ssm.domain.CodeMaster;

public class CodeMasterDto extends BaseDto<CodeMaster> {

    private String codeName;
    private String type;
    private String typeEn;
    private String code;
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTypeEn() {
		return typeEn;
	}
	public void setTypeEn(String typeEn) {
		this.typeEn = typeEn;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Override
    public CodeMaster generateBean() {
		CodeMaster codeMaster = new CodeMaster();
		codeMaster.setCode(code);
		codeMaster.setCodeName(codeName);
		codeMaster.setType(type);
		codeMaster.setTypeEn(typeEn);
		if(!"".equals(getId())) {
			codeMaster.setId(Integer.parseInt(getId()));
		}
		return codeMaster;
    }
}
