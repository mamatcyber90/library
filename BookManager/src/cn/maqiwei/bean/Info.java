package cn.maqiwei.bean;

public class Info {
    private String id;  //学号
    private String bookname;  //书名
    private String type;  //类型
    private String con;  //借阅数量


    public Info() {
    }

    @Override
    public String toString() {
        return "Info{" +
                "id='" + id + '\'' +
                ", bookname='" + bookname + '\'' +
                ", type='" + type + '\'' +
                ", con='" + con + '\'' +
                '}';
    }

    public String getCon() {
        return con;
    }

    public void setCon(String con) {
        this.con = con;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}




