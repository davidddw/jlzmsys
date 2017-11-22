package org.cloud.ssm.service.impl;

import java.util.List;

import org.cloud.ssm.domain.CodeMaster;
import org.cloud.ssm.dto.CodeMasterDto;
import org.cloud.ssm.mapper.CodeMasterMapper;
import org.cloud.ssm.service.ICodeMasterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

@Service
public class CodeMasterServiceImpl extends BaseServiceImpl<CodeMasterMapper, CodeMaster> implements ICodeMasterService {

    @Autowired
    private CodeMasterMapper codeMasterMapper;

    @Override
    public List<CodeMaster> getCodeMasterList(CodeMasterDto codeMasterDto) {
        PageHelper.startPage(codeMasterDto.getPage(), codeMasterDto.getRows());
        return codeMasterMapper.selectAllCodeMaster();
    }

	@Override
    public int getCodeMasterCount(CodeMasterDto codeMaster) {
	    return codeMasterMapper.selectCount(new CodeMaster());
    }
}
