package com.baizhi.service;

import com.baizhi.dao.BookDao;
import com.baizhi.entity.Book;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.*;

@Service("bookService")
@Transactional
public class BookServiceImpl implements BookService {
    @Resource
    private BookDao bookDao;

    @Override
    public List<Book> selectByPage(Integer page, Integer rows) {
        Integer start = (page-1)*rows;
        return bookDao.selectByPage(start,rows);
    }

    @Override
    public List<Book> selectAllBook() {
        return bookDao.selectAllBook();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public Book selectById(String id) {
        return bookDao.selectById(id);
    }

    @Override
    public void addBook(Book book) {
        book.setId(UUID.randomUUID().toString());
        book.setCreate_date(new Date());
        book.setSales(0);
        bookDao.addBook(book);
    }

    @Override
    public void deleteBook(String id) {
        bookDao.deleteBook(id);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Book> selectByKey(String key, String content) {
        return bookDao.selectByKey(key,content);
    }

    @Override
    public void updateBook(Book book) {
        bookDao.updateBook(book);
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Book> selectRecommend() {
        //查询所有图书
        List<Book> allBook = bookDao.selectAllBook();
        //获得两个随机数
        Integer a = new Random().nextInt(allBook.size());
        Integer b = new Random().nextInt(allBook.size());
        //保证两个随机数不相同
        while(true) {
            if(a == b) {
                b = new Random().nextInt(allBook.size());
            }
            if(a != b) {
                break;
            }
        }
        List<Book> books = new ArrayList();
        books.add(allBook.get(a));
        books.add(allBook.get(b));
        return books;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Book> selectBookBySales() {
        return bookDao.selectBookBySales();
    }

    @Override
    public List<Book> selectBookByCreate_date() {
        return bookDao.selectBookByCreate_date();
    }

    @Override
    public List<Book> selectBookByCreate_dateAndSales() {
        return bookDao.selectBookByCreate_dateAndSales();
    }

    @Override
    public List<Book> selectBookByCategory_id(String fid, String sid) {
        List<Book> books = bookDao.selectBookByCategory_id(fid, sid);
        return books;
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Book> selectBookByCategory_idAndPage(Integer page, String sid, String fid) {
        Integer start = (page-1)*3;
        List<Book> books = bookDao.selectBookByCategory_idAndPage(start, 3, sid, fid);
        return books;
    }

    @Override
    public Integer pageCount(String id) {
        return null;
    }
}
