package repository.Impl;

import model.Product;
import repository.BaseRepository;
import repository.IProductRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements IProductRepository {

    private final String SELECT_ALL = "SELECT * FROM product;";
    private final String INSERT_INTO = "insert into product(name,price,manufacturer) values(?,?,?);";
    private final String UPDATE_BY_ID = "call UpdateProduct(?,?,?,?);";
    private final String DELETE_BY_ID = "call DeleteProduct(?);";
    private final String SELECT_PRODUCT_BY_ID = "SELECT * FROM product where id = ?;";
    private final String SEARCH_BY_NAME = "SELECT * FROM product WHERE name = ?;";

    @Override
    public List<Product> findAll() {
        List<Product> productList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                String manufacturer = resultSet.getString("manufacturer");
                Product product = new Product(id, name, price, manufacturer);
                productList.add(product);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    @Override
    public boolean add(Product product) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setDouble(2, product.getPrice());
            preparedStatement.setString(3, product.getManufacturer());
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Product product) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = BaseRepository.getConnectDB();
             CallableStatement callableStatement = connection.prepareCall(UPDATE_BY_ID);) {

            callableStatement.setInt(1, product.getId());
            ;
            callableStatement.setString(2, product.getName());
            callableStatement.setDouble(3, product.getPrice());
            callableStatement.setString(4, product.getManufacturer());
            rowUpdated = callableStatement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    @Override
    public boolean delete(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_BY_ID);
            callableStatement.setInt(1, id);
            return callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Product findById(int id) {
        Product product = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PRODUCT_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                String manufacturer = resultSet.getString("manufacturer");
                product = new Product(id, name, price, manufacturer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

    @Override
    public Product findByName(String name) {
        Product product = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_BY_NAME);
            preparedStatement.setString(1,name );
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                String manufacturer = resultSet.getString("manufacturer");
                product = new Product(id, name, price, manufacturer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return product;
    }

}
