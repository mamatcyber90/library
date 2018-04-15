package cn.maqiwei.bean;

public class Book {
    private String bookname;  //书名
    private String author;  //作者
    private String press;	//出版社
    private String pubdate; //出版时间
    private String type;  //类型
    private String bookshelf;  //书架
    private int b_count;  //数量

    @Override
    public String toString() {
        return "Book{" +
                "bookname='" + bookname + '\'' +
                ", author='" + author + '\'' +
                ", press='" + press + '\'' +
                ", pubdate='" + pubdate + '\'' +
                ", type='" + type + '\'' +
                ", bookshelf='" + bookshelf + '\'' +
                ", b_count=" + b_count +
                '}';
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public String getPubdate() {
        return pubdate;
    }

    public void setPubdate(String pubdate) {
        this.pubdate = pubdate;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getBookshelf() {
        return bookshelf;
    }

    public void setBookshelf(String bookshelf) {
        this.bookshelf = bookshelf;
    }

    public int getB_count() {
        return b_count;
    }

    public void setB_count(int b_count) {
        this.b_count = b_count;
    }
}
