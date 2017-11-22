package org.cloud.ssm.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.cloud.ssm.domain.CodeMaster;
import org.cloud.ssm.domain.WorkCalendar;
import org.cloud.ssm.dto.WorkCalendarDto;
import org.cloud.ssm.mapper.CalendarMapper;
import org.cloud.ssm.mapper.CodeMasterMapper;
import org.cloud.ssm.service.ICalendarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

@Service
public class CalendarServiceImpl extends BaseServiceImpl<CalendarMapper, WorkCalendar> implements ICalendarService {
	
	private static final Logger logger = LogManager.getLogger(CalendarServiceImpl.class);

    @Autowired
    private CalendarMapper calendarMapper;
    
    @Autowired
    private CodeMasterMapper codeMasterMapper;
    
    @Autowired
	private SqlSessionFactory sqlSessionFactory;

    @Override
    public List<WorkCalendar> getCalendarList(WorkCalendarDto workCalendarDto) {
        PageHelper.startPage(workCalendarDto.getPage(), workCalendarDto.getRows());
        return calendarMapper.selectCalendartList(workCalendarDto);
    }

	@Override
    public int getCalendarCount(WorkCalendarDto workCalendarDto) {
	    return calendarMapper.selectCount(workCalendarDto);
    }
	
	@Override
    public List<CodeMaster> getHldSgn() {
	    return codeMasterMapper.selectByTypeEn("HldSgn");
    }

	@Override
    public int saveBatch(List<WorkCalendar> workCalendars, String author) {
		SqlSession batchSqlSession = null;
		try {
			long beginTime = System.currentTimeMillis();
			batchSqlSession = sqlSessionFactory.openSession(ExecutorType.BATCH, false);
			int batchCount = 500;
			Map<String, String> hldSgn = new HashMap<>();
			List<CodeMaster> codeMasters = getHldSgn();
			for(CodeMaster codeMaster : codeMasters) {
				hldSgn.put(codeMaster.getCodeName(), codeMaster.getCode());
			}
			for (int index = 0; index < workCalendars.size(); index++) {
				WorkCalendar workCalendar = workCalendars.get(index);
				if(hldSgn.containsKey(workCalendar.getHldSgn())) {
					workCalendar.setHldSgn(hldSgn.get(workCalendar.getHldSgn()));
				} else {
					workCalendar.setHldSgn("0");
				}
				workCalendar.setAddBy(author);
				workCalendar.setUpdateBy(author);
				workCalendar.setDeleteSign("0");
				workCalendar.setLockVersionCount("0");
				batchSqlSession.getMapper(CalendarMapper.class).insert(workCalendar);
				if (index != 0 && index % batchCount == 0) {
					batchSqlSession.commit();
				}
			}
			batchSqlSession.commit();
			long endTime = System.currentTimeMillis();
			logger.info("插入完成， 耗时 " + (endTime - beginTime) + " 毫秒！");
		} finally {
			if (batchSqlSession != null) {
				batchSqlSession.close();
			}
		}
		return 1;
    }

	@Override
    public int updateBatch(List<WorkCalendar> workCalendars, String author) {
		SqlSession batchSqlSession = null;
		try {
			long beginTime = System.currentTimeMillis();
			batchSqlSession = sqlSessionFactory.openSession(ExecutorType.BATCH, false);
			int batchCount = 500;
			for (int index = 0; index < workCalendars.size(); index++) {
				WorkCalendar workCalendar = workCalendars.get(index);
				batchSqlSession.getMapper(CalendarMapper.class).updateByPrimaryKey(workCalendar);
				if (index != 0 && index % batchCount == 0) {
					batchSqlSession.commit();
				}
			}
			batchSqlSession.commit();
			long endTime = System.currentTimeMillis();
			logger.info("更新完成， 耗时 " + (endTime - beginTime) + " 毫秒！");
		} finally {
			if (batchSqlSession != null) {
				batchSqlSession.close();
			}
		}
		return 1;
    }
}
