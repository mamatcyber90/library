package cn.maqiwei.service;

import cn.maqiwei.bean.*;
import cn.maqiwei.utils.Page;

import java.util.List;

public interface BookService {
//    List<Book> selectBookList();
    // 通过四个条件 查询分页对象
    public Page<Book> selectPageByQueryVo(QueryVo vo);

    public boolean checkUser(Student student);

//    Book selectBookByName(String bookname);

    public Book selectBookInfoByName(String bookname);

    //书籍余量减1
    public void lendBook(Book book);

    public Student selectStudentById(String id);

    public void insertInfo(InsertInfo insertInfo);

    public List<Info> selectInfotById(String id);

    public Integer selectLendInfoByBookName(InsertInfo insertInfo);
}
