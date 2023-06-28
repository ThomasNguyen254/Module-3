package repository;

import model.Product;

import java.sql.SQLException;
import java.util.List;

public class ProductRepositoryImpl implements IProductRepository{

    @Override
    public List<Product> findAll() {
        return null;
    }

    @Override
    public boolean add(Product product) {
        return false;
    }

    @Override
    public boolean update(Product product) throws SQLException {
        return false;
    }

    @Override
    public boolean delete(String id) {
        return false;
    }

    @Override
    public Product findById(String id) {
        return null;
    }

    @Override
    public Product findByName(String name) {
        return null;
    }
}
