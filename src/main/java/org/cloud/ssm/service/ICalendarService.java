package org.cloud.ssm.service;

import java.util.List;

import org.cloud.ssm.domain.CodeMaster;
import org.cloud.ssm.domain.WorkCalendar;
import org.cloud.ssm.dto.WorkCalendarDto;

public interface ICalendarService extends IBaseService<WorkCalendar> {

    List<WorkCalendar> getCalendarList(WorkCalendarDto workCalendarDto);
    
    List<CodeMaster> getHldSgn();
    
    int getCalendarCount(WorkCalendarDto workCalendarDto);
    
    int saveBatch(List<WorkCalendar> list, String author);

	int updateBatch(List<WorkCalendar> list, String author);

}
