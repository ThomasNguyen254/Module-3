package service;

import model.Customer;
import model.Employee;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();

    boolean add(Customer customer);

    boolean update(int id,Customer customer);

    boolean delete(int id);

    Customer findById(int id);

    Customer findByName(String name);

}
