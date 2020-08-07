package ProductManager.service;

import ProductManager.model.Product;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductServiceTpl implements ProductService {
    private static Map<Integer,Product> productMap;




    static {
        productMap=new HashMap<>();
        productMap.put(1,new Product(1,"Iphone 1","200","Con hang"));
    }
    @Override
    public List<Product> findAll() {
        return new  ArrayList<>(productMap.values());

    }

    @Override
    public void create(Product product) {
        productMap.put(product.getId(),product);
    }

    @Override
    public void update(int id, Product product) {
        productMap.put(id,product);
    }

    @Override
    public void delete(int id) {
         productMap.remove(id);
    }

    @Override
    public Product findById(int id) {
        return productMap.get(id);
    }
}
