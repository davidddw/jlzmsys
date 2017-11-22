package org.cloud.ssm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.cloud.ssm.base.BaseMapper;
import org.cloud.ssm.domain.Books;

public interface BooksMapper extends BaseMapper<Books> {

    List<Books> selectBooksList(@Param("sn") String sn, @Param("filter") String filter);

}
