package service;

import model.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> findAll();

    void save(Customer customer);

    Customer findById();

    void update(int id, Customer customer);

    void remove(int id);

}
