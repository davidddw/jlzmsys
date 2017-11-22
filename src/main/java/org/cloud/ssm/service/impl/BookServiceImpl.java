package org.cloud.ssm.service.impl;

import java.util.List;

import org.cloud.ssm.domain.Books;
import org.cloud.ssm.dto.BooksDto;
import org.cloud.ssm.mapper.BooksMapper;
import org.cloud.ssm.service.IBooksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

@Service
public class BookServiceImpl extends BaseServiceImpl<BooksMapper, Books> implements IBooksService {

    @Autowired
    private BooksMapper booksMapper;

    @Override
    public List<Books> getBooksList(BooksDto booksDto) {
        PageHelper.startPage(booksDto.getPage(), booksDto.getRows());
        return booksMapper.selectBooksList(booksDto.getSn(), booksDto.getFilter());
    }

    @Override
    public int getBooksCount(BooksDto booksDto) {
        return booksMapper.selectCount(new Books());
    }
}
