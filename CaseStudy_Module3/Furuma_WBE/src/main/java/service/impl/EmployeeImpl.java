package service.impl;

import model.Employee;
import repository.IEmployeeRepository;
import repository.impl.EmployeeRepositoryImpl;
import service.IEmployeeService;

import java.util.List;

public class EmployeeImpl implements IEmployeeService {
    private IEmployeeRepository employeeRepository = new EmployeeRepositoryImpl();

    @Override
    public List<Employee> findAll() {
        return employeeRepository.findAll();
    }

    @Override
    public boolean add(Employee employee) {
        if (employee.getId() > 1000) {
            return false;
        }
        return employeeRepository.add(employee);
    }

    @Override
    public boolean update(int id, Employee employee) {
        return employeeRepository.update(id,employee);
    }

    @Override
    public boolean delete(int id) {
        return employeeRepository.delete(id);
    }

    @Override
    public Employee findById(int id) {
        return employeeRepository.findById(id);
    }

    @Override
    public Employee findByName(String name) {
        return employeeRepository.findByName(name);
    }
}
