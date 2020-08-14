package model;

public class CustomerType {
    private int id;
    private String name;

    public CustomerType(int customer_type_id, String customer_type_name) {
        this.id = customer_type_id;
        this.name = customer_type_name;
    }

    public CustomerType() {
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
}
