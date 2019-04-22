package com.baizhi.controller;

import com.baizhi.entity.Book;
import com.baizhi.entity.CartItem;
import com.baizhi.service.BookService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("cartItem")
public class CartItemController {

    @Resource
    private BookService bookService;

    //像购物车中添加商品
    @RequestMapping("add")
    public String add(HttpSession session,String bookId) {
        Map<String,CartItem> cart= (Map<String, CartItem>) session.getAttribute("cart");
        Map<String,CartItem> decart= (Map<String, CartItem>) session.getAttribute("decart");
        //判断购物车是否存在
        if(cart == null) {
            cart = new HashMap<String,CartItem>();
        }
        //判断要添加的图书是否存在于购物车中
        if(cart.containsKey(bookId)) {
            //存在
            cart.get(bookId).setCount(cart.get(bookId).getCount() + 1);
        } else {
            if(decart == null || !decart.containsKey(bookId)){
                //不存在，先通过图书id查询这本图书
                Book book = bookService.selectById(bookId);
                //创建一条购物项
                CartItem ci = new CartItem();
                ci.setBook(book);
                ci.setCount(1);
                //添加到购物车中
                cart.put(bookId, ci);
                //将购物车保存到session中
                session.setAttribute("cart", cart);
            }else if(decart != null && decart.containsKey(bookId)) {
                cart.put(bookId, decart.get(bookId));
                session.setAttribute("cart", cart);
                decart.remove(bookId);
                if(decart.isEmpty()) {
                    decart = null;
                    session.setAttribute("decart", decart);
                }
            }
        }
        //计算节省价以及当当价
        calc(session);
        return "front/cart/cart_list";
    }

    //删除一条商品
    @RequestMapping("delete")
    public String delete(HttpSession session,String bookId) {
        Map<String,CartItem> cart= (Map<String, CartItem>) session.getAttribute("cart");
        Map<String,CartItem> decart = (Map<String, CartItem>) session.getAttribute("decart");
        if(decart == null) {
            decart = new HashMap<String, CartItem>();
        }
        decart.put(bookId, cart.get(bookId));
        session.setAttribute("decart", decart);
        cart.remove(bookId);
        calc(session);
        if(cart.isEmpty()) {
            cart = null;
            session.setAttribute("cart", cart);
        }
        return "front/cart/cart_list";
    }

    //恢复删除的图书
    @RequestMapping("recoverCart")
    public String recoverCart(HttpSession session,String bookId) {
        Map<String,CartItem> cart= (Map<String, CartItem>) session.getAttribute("cart");
        Map<String,CartItem> decart = (Map<String, CartItem>) session.getAttribute("decart");
        if(cart == null) {
            cart = new HashMap();
        }
        cart.put(bookId, decart.get(bookId));
        session.setAttribute("cart", cart);
        decart.remove(bookId);
        if(decart.isEmpty()) {
            decart = null;
            session.setAttribute("decart", decart);
        }
        calc(session);
        return "front/cart/cart_list";
    }


    //变更商品数量
    @RequestMapping("update")
    public String update(HttpSession session,String bookId,Integer count) {
        Map<String,CartItem> cart= (Map<String, CartItem>) session.getAttribute("cart");
        cart.get(bookId).setCount(count);
        //session.setAttribute("cart", cart);
        calc(session);
        return "front/cart/cart_list";
    }


    //判断库存是否充足
    @RequestMapping("istock")
    public String istock(HttpSession session,String bookId,String emptyError) {
        Map<String,CartItem> cart= (Map<String, CartItem>) session.getAttribute("cart");
        try {
            for (Map.Entry<String, CartItem> entry : cart.entrySet()) {
                CartItem ci = entry.getValue();
                if(ci.getBook().getStock() < ci.getCount()) {
                    throw new RuntimeException(ci.getBook().getName() + "库存不足，请调整您要购买的数量");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            emptyError = e.getMessage();
            return "front/cart/cart_list";
        }
        return "front/order/order_info";
    }



    //计算
    public void calc(HttpSession session) {
        Map<String,CartItem> cart= (Map<String, CartItem>) session.getAttribute("cart");
        Double save = 0d;
        Double total = 0d;
        //遍历map集合
        for (Map.Entry<String, CartItem> entry : cart.entrySet()) {
            CartItem ci = entry.getValue();
            total += ci.getBook().getDd_price() * ci.getCount();
            save += (ci.getBook().getPrice() - ci.getBook().getDd_price()) * ci.getCount();
        }
        //将计算结果存到session中
        session.setAttribute("total", total);
        session.setAttribute("save", save);
    }
}
