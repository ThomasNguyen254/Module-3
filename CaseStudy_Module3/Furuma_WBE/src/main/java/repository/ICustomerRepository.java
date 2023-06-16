package repository;

import model.Customer;

import java.util.List;

public interface ICustomerRepository {
    List<Customer> findAll();

    boolean add(Customer customer);

    boolean update(int id,Customer customer);

    boolean delete(int id);

    Customer findById(int id);

    Customer findByName(String name);

}
