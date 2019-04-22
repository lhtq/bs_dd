package com.baizhi.dao;

import com.baizhi.entity.Category;

import java.util.List;

public interface CategoryDao {
	/**
	 * 添加一个标题
	 * @param cate
	 */
	void addCategory(Category cate);
	/**
	 * 根据id删除一个标题
	 * @param id
	 */
	void deleteCategory(String id);
	/**
	 * 查询所有类别
	 * @return
	 */
	List<Category> selectAll();
	/**
	 * 查询所有一级类别
	 * @return
	 */
	List<Category> selectAllFirst();
	/**
	 * 查询所有二级类别
	 * @return
	 */
	List<Category> selectAllSecond();
	/**
	 * 查询所有的一级标题，包含其下的所有二级标题
	 * @return
	 */
	List<Category> selectAllFirstIncludeSecond();
	
	/**
	 * 根据id查询一个一级分类，包含其下的所有二级分类
	 * @return
	 */
	Category selectOneFirstIncludeSecond(String id);
	
}
