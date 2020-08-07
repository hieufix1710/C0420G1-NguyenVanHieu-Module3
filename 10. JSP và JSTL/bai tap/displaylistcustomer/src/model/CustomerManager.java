package model;

import java.util.ArrayList;
import java.util.List;

public class CustomerManager {
    static List<Customer> customerList=new ArrayList<>();
    public List display(){
        return customerList;
    }
}
