package ProductManagement.service;

import ProductManagement.model.Product;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductServiceTpl implements ProductService {
    private static final String FIND_ALL_SQL="select id,name,price,description from product";
    private  static final String INSERT_SQL="insert into product (name,price,description) values (?,?,?)";

    private Base base=new Base();
    @Override
    public List<Product> findAll() {
           List<Product> productList=new ArrayList<>();
          try {
              PreparedStatement preparedStatement=this.base.getConnection().prepareStatement(FIND_ALL_SQL);
              ResultSet resultSet=preparedStatement.executeQuery();
              Product product;
              while (resultSet.next()){
                   product=new Product();
                   product.setId(Integer.parseInt(resultSet.getString("id")));
                   product.setName(resultSet.getString("name"));
                   product.setPrice(resultSet.getString("price"));
                   product.setDescription(resultSet.getString("description"));
                   productList.add(product);
              }

          } catch (SQLException e) {
              e.printStackTrace();
          }
          return productList;
    }
    @Override
    public void save(Product product) {
        try {
            PreparedStatement preparedStatement=this.base.getConnection().prepareStatement(INSERT_SQL);
            preparedStatement.setString(1,product.getName());
            preparedStatement.setString(2,product.getPrice());
            preparedStatement.setString(3,product.getDescription());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    @Override
    public void delete(int id) {

    }

    @Override
    public void update(int id, Product product) {

    }

    @Override
    public Product findById(int id) {
        return null;
    }
}
