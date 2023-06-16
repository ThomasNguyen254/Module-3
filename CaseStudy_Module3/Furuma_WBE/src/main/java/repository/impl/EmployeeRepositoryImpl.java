package repository.impl;

import model.Employee;
import repository.BaseRepository;
import repository.IEmployeeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepositoryImpl implements IEmployeeRepository {

    private final String SELECT_ALL = "SELECT * FROM FurumaManagementWBE1.employee;";
    private final String INSERT_INTO = "insert into employee(name,birthday,id_card,salary,phone,email,address,position_id,education_degree_id,division_id) values(?,?,?,?,?,?,?,?,?,?,?);";

    @Override
    public List<Employee> findAll() {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String birthday = resultSet.getString("birthday");
                String id_card = resultSet.getString("id_card");
                double salary = resultSet.getDouble("salary");
                String phone = resultSet.getString("phone");
                String email = resultSet.getString("email");
                String address = resultSet.getString("address");
                int position_id = resultSet.getInt("position_id");
                int education_degree_id = resultSet.getInt("education_degree_id");
                int division_id = resultSet.getInt("division_id");
                Employee employee = new Employee(id, name, birthday, id_card,salary,phone,email,address,position_id,education_degree_id,division_id);
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }

    @Override
    public boolean add(Employee employee) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT_INTO);
            preparedStatement.setString(1,employee.getName());
            preparedStatement.setString(2,employee.getBirthday());
            preparedStatement.setString(3,employee.getId_card());
            preparedStatement.setDouble(4,employee.getSalary());
            preparedStatement.setString(5,employee.getPhone());
            preparedStatement.setString(6,employee.getEmail());
            preparedStatement.setString(7,employee.getAddress());
            preparedStatement.setInt(8,employee.getPosition_id());
            preparedStatement.setInt(9,employee.getEducation_degree_id());
            preparedStatement.setInt(10,employee.getDivision_id());
            return preparedStatement.executeUpdate()>0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(int id, Employee employee) {
        return false;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }

    @Override
    public Employee findById(int id) {
        return null;
    }

    @Override
    public Employee findByName(String name) {
        return null;
    }
}
