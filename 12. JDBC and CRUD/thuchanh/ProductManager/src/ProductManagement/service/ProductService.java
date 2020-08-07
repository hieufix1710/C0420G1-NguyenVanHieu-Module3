package ProductManagement.service;

import ProductManagement.model.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll();
    void save(Product product);
    void delete(int id);
    void update (int id,Product product);
    Product findById(int id);
}
