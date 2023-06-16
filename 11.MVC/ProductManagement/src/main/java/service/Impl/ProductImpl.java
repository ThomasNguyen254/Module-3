package service.Impl;

import model.Product;
import repository.IProductRepository;
import repository.Impl.ProductRepositoryImpl;
import service.ProductService;

import java.sql.SQLException;
import java.util.List;

public class ProductImpl implements ProductService {
    private IProductRepository productRepository = new ProductRepositoryImpl();

    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public boolean add(Product product) {
        if (product.getId() > 1000) {
            return false;
        }
        return productRepository.add(product);
    }

    @Override
    public boolean update(Product product) throws SQLException {
        return productRepository.update(product);
    }

    @Override
    public boolean delete(int id) {
        return productRepository.delete(id);
    }

    @Override
    public Product findById(int id) {
        return productRepository.findById(id);
    }

    @Override
    public Product findByName(String name) {
        return productRepository.findByName(name);
    }

}
