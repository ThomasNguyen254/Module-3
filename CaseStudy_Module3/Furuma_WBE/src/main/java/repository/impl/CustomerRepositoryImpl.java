package repository.impl;

import model.Customer;
import model.Employee;
import repository.BaseRepository;
import repository.ICustomerRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepositoryImpl implements ICustomerRepository {
    private final String SELECT_ALL = "SELECT * FROM FurumaManagementWBE1.customer;";
    private final String INSERT_INTO = "insert into customer(type_id,name,birthday,gender,id_card,phone,email,address) values(?,?,?,?,?,?,?,?,?);";

    @Override
    public List<Customer> findAll() {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                int type_id = resultSet.getInt("type_id");
                String name = resultSet.getString("name");
                String birthday = resultSet.getString("birthday");
                Boolean gender = resultSet.getBoolean("gender");
                String id_card = resultSet.getString("id_card");
                String phone = resultSet.getString("phone");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                Customer customer = new Customer(id,type_id, name, birthday,gender, id_card,phone,email,address);
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerList;
    }

    @Override
    public boolean add(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setInt(1,customer.getType_id());
            preparedStatement.setString(2,customer.getName());
            preparedStatement.setString(3,customer.getBirthday());
            preparedStatement.setBoolean(4,customer.isGender());
            preparedStatement.setString(5,customer.getId_card());
            preparedStatement.setString(6,customer.getPhone());
            preparedStatement.setString(7,customer.getEmail());
            preparedStatement.setString(8,customer.getAddress());
            return preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(int id, Customer customer) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public Customer findById(int id) {
        return null;
    }

    @Override
    public Customer findByName(String name) {
        return null;
    }
}
