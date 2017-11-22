package org.cloud.ssm.mapper;

import org.cloud.ssm.domain.Attendance;

public interface AttendanceMapper {

	int save(Attendance attendance);

	int update(Attendance attendance);

}
