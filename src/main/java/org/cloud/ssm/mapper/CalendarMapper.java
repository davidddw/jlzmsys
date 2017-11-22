package org.cloud.ssm.mapper;

import java.util.List;

import org.cloud.ssm.base.BaseMapper;
import org.cloud.ssm.domain.CodeMaster;
import org.cloud.ssm.domain.WorkCalendar;
import org.cloud.ssm.dto.WorkCalendarDto;

public interface CalendarMapper extends BaseMapper<WorkCalendar> {

    List<WorkCalendar> selectCalendartList(WorkCalendarDto workCalendarDto);
    
    List<CodeMaster> selectHldSgn();
    
    int selectCount(WorkCalendarDto workCalendarDto);

}
