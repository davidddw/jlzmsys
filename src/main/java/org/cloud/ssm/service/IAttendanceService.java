package org.cloud.ssm.service;

import java.util.List;

import org.cloud.ssm.domain.Attendance;

public interface IAttendanceService {
	int saveAttendance(Attendance attendance);

	int saveAttendancecList(List<Attendance> list);

	int updateAttendanceList(List<Attendance> list);
}
