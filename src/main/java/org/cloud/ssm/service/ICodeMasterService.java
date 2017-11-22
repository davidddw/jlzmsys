package org.cloud.ssm.service;

import java.util.List;

import org.cloud.ssm.domain.CodeMaster;
import org.cloud.ssm.dto.CodeMasterDto;

public interface ICodeMasterService extends IBaseService<CodeMaster> {

    List<CodeMaster> getCodeMasterList(CodeMasterDto codeMasterDto);

    int getCodeMasterCount(CodeMasterDto codeMasterDto);
}
