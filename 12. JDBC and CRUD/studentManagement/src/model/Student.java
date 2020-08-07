package model;

public class Student {
    private int id;
    private String name;
    private String birthday;
    private String account;
    private String password;
    private String className;
    private String typeClass;

    public Student() {
    }

    public Student(int id, String name, String birthday, String account,String password, String className, String typeClass) {
        this.id = id;
        this.name = name;
        this.birthday = birthday;
        this.account = account;
        this.password = password;
        this.className = className;
        this.typeClass = typeClass;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getTypeClass() {
        return typeClass;
    }

    public void setTypeClass(String typeClass) {
        this.typeClass = typeClass;
    }

    public String getPassword() {
        return password;
    }
}



