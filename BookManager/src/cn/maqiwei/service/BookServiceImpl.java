package cn.maqiwei.service;

import cn.maqiwei.bean.*;
import cn.maqiwei.mapper.BooksMapper;
import cn.maqiwei.utils.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BookServiceImpl implements BookService {

    @Autowired(required = false)
    private BooksMapper booksMapper;
    @Override
    //查新书籍列表
//    public List<Book> selectBookList() {
//        return booksMapper.selectBookList(null);
//    }


    // 通过四个条件 查询分页对象
    public Page<Book> selectPageByQueryVo(QueryVo vo) {
        Page<Book> page = new Page<Book>();
        //每页数
        page.setSize(10);
        vo.setSize(10);
        if (null != vo) {
            // 判断当前页
            if (null != vo.getPage()) {
                page.setPage(vo.getPage());
                vo.setStartRow((vo.getPage() -1)*vo.getSize());
            }if(null != vo.getBkName() && !"".equals(vo.getBkName().trim())){
                vo.setBkName(vo.getBkName().trim());
            }
            //总条数
            page.setTotal(booksMapper.bookCountByQueryVo(vo));
            page.setRows(booksMapper.selectbookListByQueryVo(vo));
        }
        return page;

    }

    //查询用户是否存在
    @Override
    public boolean checkUser(Student student) {

        Integer integer = booksMapper.checkUser(student);
        if(integer>0){
            return true;
        }else {
            return false;
        }
    }

    //通过书名查询数据
//    @Override
//    public Book selectBookByName(String bookname) {
//        Book book = booksMapper.selectBookByName(bookname);
//        return book;
//    }

    @Override
    public Book selectBookInfoByName(String bookname) {
        return booksMapper.selectBookInfoByName(bookname);
    }
    //通过id查询学生信息
    @Override
    public Student selectStudentById(String id) {
        return booksMapper.selectStudentById(id);
    }


    //确认借书
    @Override
    public void lendBook(Book book) {
        booksMapper.lendBook(book);
    }
    @Override
    //向借阅表中插入数据
    public void insertInfo(InsertInfo insertInfo) {
        booksMapper.insertInfo(insertInfo);
    }
    //查询借阅信息
    @Override
    public List<Info> selectInfotById(String id) {
        List<Info> infoList = booksMapper.selectInfotById(id);
        return infoList;
    }
    //查询是否借过这本书
    @Override
    public Integer selectLendInfoByBookName(InsertInfo insertInfo) {
        return booksMapper.selectLendInfoByBookName(insertInfo);

    }
}
