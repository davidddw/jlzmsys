package org.cloud.ssm.service;

import java.util.List;

import org.cloud.ssm.domain.Books;
import org.cloud.ssm.dto.BooksDto;

public interface IBooksService extends IBaseService<Books> {

    List<Books> getBooksList(BooksDto booksDto);

    int getBooksCount(BooksDto booksDto);
}
