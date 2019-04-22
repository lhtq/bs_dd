package com.baizhi.dao;

import com.baizhi.entity.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookDao {
        /**
         * 查询所有图书
         * @return
         */
        List<Book> selectAllBook();

        /**
         * 根据起始条数和每页条数查询
         * @param start
         * @param rows
         * @return
         */
        List<Book> selectByPage(@Param("start") Integer start,@Param("rows") Integer rows);

        /**
         * 根据id查找一本图书
         * @param id
         * @return
         */
        Book selectById(String id);
        /**
         * 添加一本图书
         * @param book
         */
        void addBook(Book book);

        /**
         * 根据id删除一本图书
         * @param id
         */
        void deleteBook(String id);

        /**
         * 更新一本图书
         * @param book
         */
        void updateBook(Book book);

        /**
         * 根据条件模糊查询
         * @param key   条件
         * @param content  用户输入的内容
         * @return
         */
        List<Book> selectByKey(@Param("key")String key,@Param("content")String content);

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
         * 新书热卖榜
         * @return
         */
        List<Book> selectBookByCreate_dateAndSales();

        /**
         * 查询某分类的所有图书
         * @return
         */
        List<Book> selectBookByCategory_id(@Param("fid")String fid, @Param("sid")String sid);
        /**
         * 根据类别id和首末条查询图书
         * @param start
         * @param rows
         * @param
         * @return
         */
        List<Book> selectBookByCategory_idAndPage(@Param("start")Integer start, @Param("rows")Integer rows, @Param("sid")String sid, @Param("fid")String fid);

        /**
         * 前台购买图书后修改库存和销量
         * @param id
         * @param count
         */
        void updateCount(@Param("id")String id,@Param("count")Integer count);
}
