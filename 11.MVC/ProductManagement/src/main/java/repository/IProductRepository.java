package repository;

import model.Product;

import java.sql.SQLException;
import java.util.List;

public interface IProductRepository {
        List<Product> findAll();

        boolean add(Product product);

        boolean update(Product product) throws SQLException;

        boolean delete(int id);

        Product findById(int id);

        Product findByName(String name);
}
