package org.cloud.ssm.service.impl;

import java.util.List;

import org.apache.ibatis.session.ExecutorType;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.cloud.ssm.domain.Attendance;
import org.cloud.ssm.mapper.AttendanceMapper;
import org.cloud.ssm.service.IAttendanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AttendanceServiceImpl implements IAttendanceService {
	
	private static final Logger logger = LogManager.getLogger(AttendanceServiceImpl.class);
	
	@Autowired
	private AttendanceMapper attendanceMapper;
	
	@Autowired
	private SqlSessionFactory sqlSessionFactory;

	@Override
	public int saveAttendance(Attendance attendance) {
		return attendanceMapper.save(attendance);
	}

	@Override
	public int saveAttendancecList(List<Attendance> list) {
		SqlSession batchSqlSession = null;
		try {
			long beginTime = System.currentTimeMillis();
			batchSqlSession = sqlSessionFactory.openSession(ExecutorType.BATCH, false);
			int batchCount = 500;
			for (int index = 0; index < list.size(); index++) {
				Attendance attdnc = list.get(index);
				batchSqlSession.getMapper(AttendanceMapper.class).save(attdnc);
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
	public int updateAttendanceList(List<Attendance> list) {
		SqlSession batchSqlSession = null;
		try {
			long beginTime = System.currentTimeMillis();
			batchSqlSession = sqlSessionFactory.openSession(ExecutorType.BATCH, false);
			int batchCount = 500;
			for (int index = 0; index < list.size(); index++) {
				Attendance attdnc = list.get(index);
				batchSqlSession.getMapper(AttendanceMapper.class).update(attdnc);
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
