package com.baizhi.controller;

import com.baizhi.entity.Book;
import com.baizhi.entity.Category;
import com.baizhi.service.BookService;
import com.baizhi.service.CategoryService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
@RequestMapping("book")
public class BookController {

    @Resource
    private BookService bookService;
    @Resource
    private CategoryService categoryService;

    @RequestMapping("selectAll")
    @ResponseBody
    public List<Book> selectAll(){
        return bookService.selectAllBook();
    }

    @RequestMapping("selectByPage")
    @ResponseBody
    public Map<String,Object> selectByPage(Integer page, Integer rows){
        List<Book> books = bookService.selectAllBook();
        HashMap<String, Object> map = new HashMap<>();
        //当前页
        map.put("page",page);
        //总条数
        int size = books.size();
        map.put("records", size);
        //总页数
        Integer total = size%4==0?size/4:size/4+1;
        map.put("total",total);
        map.put("rows",bookService.selectByPage(page,rows));
        return map;
    }

    @RequestMapping("beforeUpdate")
    public String beforeUpdate(String id, Model model){
        Book book = bookService.selectById(id);
        model.addAttribute("book",book);
        List<Category> allSecond = categoryService.selectAllSecond();
        model.addAttribute("allSecond",allSecond);
        return "back/book/update";
    }

    @RequestMapping("update")
    public String update(HttpServletRequest request,Book book, MultipartFile cover) throws IOException {
        //得到文件的文件名
        String cover_name = cover.getOriginalFilename();
        if(cover_name == null || cover_name == "") {
            //用户没有修改封面
            bookService.updateBook(book);
        }else{
            //根据相对路径获取绝对路径
            String realPath = request.getRealPath("/cover");
            //将文件上传到服务器
            cover.transferTo(new File(realPath,cover_name));
            book.setCover_name(cover_name);
            bookService.updateBook(book);
        }
        return "back/book/show";
    }

    @RequestMapping("add")
    public String add(MultipartFile cover, Book book, HttpServletRequest request) throws IOException {
        //得到文件的文件名
        String cover_name = cover.getOriginalFilename();
        //根据相对路径获取绝对路径
        String realPath = request.getRealPath("/cover");
        //将文件上传到服务器
        cover.transferTo(new File(realPath,cover_name));
        book.setCover_name(cover_name);
        bookService.addBook(book);
        return "back/book/show";
    }

    @RequestMapping("edit")
    public String edit(Book book, String oper) {
        if("del".equals(oper)) {
            bookService.deleteBook(book.getId());
        }
        return "back/book/show";
    }

    @RequestMapping("selectByKey")
    public String selectByKey(String key, String content, Model model) {
        List<Book> books = bookService.selectByKey(key, content);
        for (Book book : books) {
            System.out.println(book);
        }
        model.addAttribute("books",books);
        return "back/book/selectshow";
    }

    @RequestMapping("recommend")
    @ResponseBody
    public List<Book> recommend() {
        return bookService.selectRecommend();
    }

    @RequestMapping("hot")
    @ResponseBody
    public List<Book> hot() {
        return bookService.selectBookBySales();
    }

    @ResponseBody
    @RequestMapping("new")
    public List<Book> newBook() {
        List<Book> books = bookService.selectBookByCreate_date();
        return books;
    }

    @RequestMapping("hotBoard")
    @ResponseBody
    public List<Book> hotBoard() {
        return bookService.selectBookByCreate_dateAndSales();
    }

    @RequestMapping("bookDetail")
    @ResponseBody
    public Book bookDetail(String id) {
        return bookService.selectById(id);
    }

    @RequestMapping("secondCategoryPage")
    public String secondCategoryPage(String sid,String fid,Integer page,Model model){
        //得到一个一级分类对象
        Category oneFirstIncludeSecond = categoryService.selectOneFirstIncludeSecond(fid);
        model.addAttribute("oneFirstIncludeSecond",oneFirstIncludeSecond);
        //得到点击的分类的图书
        List<Book> books = bookService.selectBookByCategory_id(fid, sid);
        int count = books.size();
        if(page == null) {
            page = 1;
        }
        model.addAttribute("page",page);
        //得到当前页的图书集合
        List<Book> blist = bookService.selectBookByCategory_idAndPage(page, sid, fid);
        model.addAttribute("byCategory_idAndPage",blist);
        //总页数
        Integer pageCount = 0;
        if(count % 3 == 0) {
            pageCount = count/3;
        }else{
            pageCount = count/3 + 1;
        }
        model.addAttribute("pageCount",pageCount);
        //存放每一个种类的图书的对应数量
        Map<String,Integer> bookCount = new HashMap<String,Integer>();
        for (Category category : oneFirstIncludeSecond.getSeconds()) {
            List<Book> bs = bookService.selectBookByCategory_id(fid, category.getId());
            Integer bookCounts = bs.size();
            bookCount.put(category.getId(), bookCounts);
        }
        model.addAttribute("bookCount",bookCount);
        //全部的总数
        Set<String> keys = bookCount.keySet();
        Integer allCount = 0;
        for (String key : keys) {
            Integer value = bookCount.get(key);
            allCount = allCount + value;
        }
        model.addAttribute("allCount",allCount);
        model.addAttribute("sid",sid);
        model.addAttribute("fid",fid);

        return "front/main/book_list";
    }

}
