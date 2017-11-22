package org.cloud.ssm.mapper;

import java.util.List;

import org.cloud.ssm.base.BaseMapper;
import org.cloud.ssm.domain.CodeMaster;

public interface CodeMasterMapper extends BaseMapper<CodeMaster> {

    List<CodeMaster> selectAllCodeMaster();
    
    List<CodeMaster> selectByTypeEn(String typeEn);

}
