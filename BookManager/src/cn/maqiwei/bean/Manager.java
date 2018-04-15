package cn.maqiwei.bean;

public class Manager {

    private String username;
    private String password;
    private String code;
    private String state;

    @Override
    public String toString() {
        return "Manager{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", code='" + code + '\'' +
                ", state='" + state + '\'' +
                '}';
    }

    public Manager(){}

    public Manager(String username,String password,String code,String state){
        this.username = username;
        this.password=password;
        this.code = code;
        this.state = state;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
