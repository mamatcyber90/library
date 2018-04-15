package cn.maqiwei.controller;

import cn.maqiwei.bean.Book;
import cn.maqiwei.bean.QueryVo;
import cn.maqiwei.bean.Student;
import cn.maqiwei.service.BookService;
import cn.maqiwei.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.SQLException;

@Controller
public class CheckUser {
    @Autowired
    private BookService bookService;
    //入门程序 第一   包类 + 类包 + 方法名
    /**
     * 1.ModelAndView  无敌的    带着数据  返回视图路径           不建议使用
     * 2.String    返回视图路径     model带数据      官方推荐此种方式   解耦   数据  视图  分离  MVC  建议使用
     * 3.void       ajax  请求   合适   json格式数据 （response   异步请求使用
     * @return
     */

    @RequestMapping(value = "/student/check.action")
    public void list(Student student, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 查询学生是否存在
        //获得要校验的用户名
        HttpSession session = request.getSession();
        request.setCharacterEncoding("UTF-8");

        System.out.println(student);
        boolean isExist = false;
        isExist = bookService.checkUser(student);
        try {
            response.getWriter().write("{\"isExist\":"+isExist+"}");
        } catch (IOException e) {
            e.printStackTrace();
        }
        if(isExist){
            //要自动登录
            //创建存储密码的cookie
            Cookie cookie_password = new Cookie("cookie_password",student.getId());
            cookie_password.setMaxAge(10*60);
            response.addCookie(cookie_password);
        }
        //***************************************************
        //将user对象存到session中
        session.setAttribute("stu", student);
        response.sendRedirect(request.getContextPath()+"/book/list.action");

    }
}
