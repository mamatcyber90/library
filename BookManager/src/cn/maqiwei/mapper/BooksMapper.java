package cn.maqiwei.mapper;

import cn.maqiwei.bean.*;

import java.util.List;

public interface BooksMapper {

    //查询书籍列表
//    List<Book> selectBookList(Book book);

    //查询书籍数量
    Integer bookCountByQueryVo(QueryVo vo);
    //查询书籍列表
    List<Book> selectbookListByQueryVo(QueryVo vo);

    //查询用户名是否存在
    public Integer checkUser(Student student);

//    public Book selectBookByName(String bookname);
    //通过名字查
    Book selectBookInfoByName(String bookname);
    //书籍余量减1
    void lendBook(Book book);
    //插入一条借阅信息
    void insertInfo(InsertInfo insertInfo);

    //查询学生信息
    Student selectStudentById(String id);

    //查询借阅信息
    List<Info> selectInfotById(String id);

    Integer selectLendInfoByBookName(InsertInfo insertInfo);
}
