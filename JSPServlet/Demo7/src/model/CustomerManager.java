package model;

import java.util.ArrayList;
import java.util.List;

public class CustomerManager {
    static List<Customer> customerList=new ArrayList<>();
//    static {
//        customerList.add(new Customer(1,"Hieu","12-12-1999","HN"));
//        customerList.add(new Customer(2,"Hieu","12-12-1999","HN"));
//        customerList.add(new Customer(3,"Hieu","12-12-1999","HN"));
//        customerList.add(new Customer(4,"Hieu","12-12-1999","HN"));
//        customerList.add(new Customer(5,"Hieu","12-12-1999","HN"));
//    }
     public List<Customer> list(){
        return customerList;
    }
}
