package model;

public class Customer {
    private int id;
    private int typeId;
    private String name;
    private String birthday;
    private String CMND;
    private String phone;
    private String email;
    private String address;

    public Customer(int customer_id, int customer_type_id, String customer_name, String customer_birthday
            , String CMND ,String customer_phone, String customer_email, String customer_address) {
        this.id = customer_id;
        this.typeId = customer_type_id;
        this.name = customer_name;
        this.birthday = customer_birthday;
        this.CMND = CMND;
        this.phone = customer_phone;
        this.email = customer_email;
        this.address = customer_address;
    }

    public Customer() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCMND() {
        return CMND;
    }

    public void setCMND(String CMND) {
        this.CMND = CMND;
    }
}