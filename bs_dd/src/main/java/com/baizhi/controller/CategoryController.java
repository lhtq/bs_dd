package com.baizhi.controller;

import com.baizhi.entity.Book;
import com.baizhi.entity.Category;
import com.baizhi.service.CategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("category")
public class CategoryController {
    @Resource
    private CategoryService categoryService;

    @RequestMapping("selectAll")
    @ResponseBody
    public List<Category> selectAll() {
        List<Category> list = categoryService.selectAll();
        return list;
    }

    @RequestMapping("add")
    public String addCategory(Category category) {
        categoryService.addCategory(category.getTop_id(),category.getCategory_name());
        return "back/category/showAll";
    }

    @RequestMapping("selectAllFirst")
    @ResponseBody
    public List<Category> selectAllFirst() {
        List<Category> allFirst = categoryService.selectAllFirst();
        return allFirst;
    }

    @RequestMapping("selectAllSecond")
    @ResponseBody
    public List<Category> selectAllSecond() {
        return categoryService.selectAllSecond();
    }

    @RequestMapping("edit")
    public String delete(Category category,String oper) {
        if(oper.equals("del")) {
            categoryService.deleteCategory(category.getId());
        }
        return "back/category/showAll";
    }
    @RequestMapping("allFirstIncludeSecond")
    @ResponseBody
    public List<Category> allFirstIncludeSecond() {
        return categoryService.selectAllFirstIncludeSecond();
    }


}
