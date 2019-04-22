package com.baizhi.service;

import com.baizhi.entity.Category;

import java.util.List;

public interface CategoryService {
    /**
     * 查询所有类别
     * @return
     */
    List<Category> selectAll();

    /**
     * 添加类别
     * @param top_id 一级类别id
     * @param category_name 类别名
     */
    void addCategory(String top_id,String category_name);

    /**
     * 查询所有一级类别
     * @return
     */
    List<Category> selectAllFirst();


    /**
     * 根据类别id删除对应类别
     * @param id
     */
    void deleteCategory(String id);

    /**
     * 查询所有二级类别
     * @return
     */
    List<Category> selectAllSecond();

    /**
     * 查询所有一级类别,包含其下的所有二级分类
     * @return
     */
    List<Category> selectAllFirstIncludeSecond();

    /**
     * 根据id查询一级类别,包含其下的所有二级分类
     * @return
     */
    Category selectOneFirstIncludeSecond(String id);
}
