package cn.maqiwei.controller;

import cn.maqiwei.bean.*;
import cn.maqiwei.service.BookService;
import cn.maqiwei.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.List;

import static java.awt.SystemColor.info;

@Controller
public class BookController {

    @Autowired
    private BookService bookService;
    //入门程序 第一   包类 + 类包 + 方法名

    /**
     * 1.ModelAndView  无敌的    带着数据  返回视图路径           不建议使用
     * 2.String    返回视图路径     model带数据      官方推荐此种方式   解耦   数据  视图  分离  MVC  建议使用
     * 3.void       ajax  请求   合适   json格式数据 （response   异步请求使用
     *
     * @return
     */

    @RequestMapping(value = "/book/list.action")
    public String list(QueryVo vo, Model model,HttpServletRequest request) {

        Student student = (Student) request.getSession().getAttribute("stu");
        // 查询分页对象
        Page<Book> page = bookService.selectPageByQueryVo(vo);
//        Student student = bookService.selectStudentById();
        model.addAttribute("stu", student);
        model.addAttribute("page", page);
        model.addAttribute("bkName", vo.getBkName());
        return "StudentBooks";
    }
    //查看借阅者信息

    @RequestMapping(value = "/student/info.action")
    public String selectStudentById(String id) throws Exception {
        Student student = bookService.selectStudentById(id);
        return "studentInfo";
    }
    //查看借阅信息

    @RequestMapping(value = "/info/list.action")
    public String selectInfotById(String id,Model model) throws Exception {
        Student student = bookService.selectStudentById(id);
        List<Info> infoList = bookService.selectInfotById(id);
        model.addAttribute("infolist", infoList);
        return "lendList";
    }

    //借阅
    @RequestMapping(value = "/book/info.action")
    public @ResponseBody
    Book bookinfo(String name,HttpServletRequest request) throws Exception {
        request.setCharacterEncoding("UTF-8");
        Book book = bookService.selectBookInfoByName(name);
        System.out.println(book);
        return book;
    }
    //确认借阅
    @RequestMapping(value = "/book/suerlend.action")
    public void surelend(Book book, String id, HttpServletRequest request,HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        InsertInfo insertInfo=new InsertInfo();
        insertInfo.setId(id);
        insertInfo.setBook(book);
        Integer integer = bookService.selectLendInfoByBookName(insertInfo);
        System.out.println(integer);
        if(integer>0){
            response.getWriter().write("{\"b\":"+integer+"}");
        }else{
            //借阅,余量减1
            bookService.lendBook(book);
            //添加借阅信息
            bookService.insertInfo(insertInfo);
            response.getWriter().write("{\"b\":"+integer+"}");
            response.getWriter().write("借阅成功");
        }
    }
}
