package com.baizhi.service;

import com.baizhi.entity.Book;

import java.util.List;

public interface BookService {
    /**
     * 根据起始条数和每页条数查询
     * @param page
     * @param rows
     * @return
     */
    List<Book> selectByPage(Integer page, Integer rows);
    /**
     * 查询所有图书
     * @return
     */
    List<Book> selectAllBook();
    /**
     * 根据id查一本图书
     * @return
     */
    Book selectById(String id);
    /**
     * 添加一本图书
     * @param book
     */
    void addBook(Book book);

    /**
     * 删除一本图书
     * @param id
     */
    void deleteBook(String id);

    /**
     * 模糊查询
     * @param key   查询条件
     * @param content  用户输入的内容
     * @return
     */
    List<Book> selectByKey(String key,String content);

    /**
     * 更新图书信息
     * @param book
     */
    void updateBook(Book book);

    /**
     * 查找编辑推荐的图书
     * @return
     */
    List<Book> selectRecommend();

    /**
     * 查询销量前八的图书
     * @return
     */
    List<Book> selectBookBySales();

    /**
     * 查询新上架的八本图书
     * @return
     */
    List<Book> selectBookByCreate_date();

    /**
     * 新书热卖榜八本图书
     * @return
     */
    List<Book> selectBookByCreate_dateAndSales();

    /**
     * 根据分类id查询图书
     * @return
     */
    List<Book> selectBookByCategory_id(String fid, String sid);
    /**
     * 根据类别id和页码查询图书
     * @param
     * @param
     * @return (每页的图书集合)
     */
    List<Book> selectBookByCategory_idAndPage(Integer page,String sid, String fid);
    /**
     * 计算总页数
     * @param id
     * @return
     */
    Integer pageCount(String id);
}
