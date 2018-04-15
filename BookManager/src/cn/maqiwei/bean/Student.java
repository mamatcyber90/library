package cn.maqiwei.bean;

public class Student {
    private String id;  //学号
    private String name; //姓名
    private String gender; //性别
    private String phone; //电话
    private String email; //邮箱
    private String department; //学院

    @Override
    public String toString() {
        return "Student{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", department='" + department + '\'' +
                '}';
    }

    public Student(){};
    public Student(String id,String name,String gender,String phone,String email,String department){
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.department = department;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getGender() {
        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getDepartment() {
        return department;
    }
    public void setDepartment(String department) {
        this.department = department;
    }
}
