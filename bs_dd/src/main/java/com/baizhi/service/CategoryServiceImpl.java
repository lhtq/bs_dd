package com.baizhi.service;

import com.baizhi.dao.BookDao;
import com.baizhi.dao.CategoryDao;
import com.baizhi.entity.Book;
import com.baizhi.entity.Category;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;
import java.util.UUID;

@Service("categoryService")
@Transactional
public class CategoryServiceImpl implements CategoryService{
    @Resource
    private CategoryDao categoryDao;
    @Resource
    private BookDao bookDao;
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Category> selectAllFirst() {
        return categoryDao.selectAllFirst();
    }

    @Override
    public void addCategory(String top_id, String category_name) {
        String rank ="";
        if(top_id != null) {
            rank="2";
        }else{
            rank="1";
        }
        String id = UUID.randomUUID().toString();
        categoryDao.addCategory(new Category(id,category_name,rank,top_id));
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Category> selectAll() {
        return categoryDao.selectAll();
    }

    @Override
    public void deleteCategory(String id) {
        List<Category> list = categoryDao.selectAll();
        boolean flag = true;
        for (Category category : list) {
            if(id.equals(category.getTop_id())) {
                flag = false;
                throw new RuntimeException("此类别为有二级类别的一级类别");
            }
        }
        if(flag == true) {
            List<Book> books = bookDao.selectBookByCategory_id(null, id);
            if(books.size()==0) {
                categoryDao.deleteCategory(id);
            }else{
                throw new RuntimeException("此类别下面有图书，不可以删除");
            }
        }
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Category> selectAllSecond() {
        return categoryDao.selectAllSecond();
    }

    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public List<Category> selectAllFirstIncludeSecond() {
        return categoryDao.selectAllFirstIncludeSecond();
    }

    @Override
    public Category selectOneFirstIncludeSecond(String id) {
        Category category = categoryDao.selectOneFirstIncludeSecond(id);
        return category;
    }
}
