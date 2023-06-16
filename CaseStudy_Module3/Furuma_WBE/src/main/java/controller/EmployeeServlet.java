package controller;

import model.Employee;
import service.IEmployeeService;
import service.impl.EmployeeImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", value = "/employee")
public class EmployeeServlet extends HttpServlet {
    IEmployeeService employeeService = new EmployeeImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showAddFormEmployee(request, response);
                break;
            case "delete":
                break;
            case "edit":
                showEditFormEmployee(request, response);
                break;
            case "view":
//                viewCustomerEmployee(request,response);
                break;
            case "showListEmployee":
                showListEmployee(request, response);
        }
    }

    private void showAddFormEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("employee/add.jsp").forward(request, response);
    }

    private void showListEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Employee> employeeList = employeeService.findAll();
        request.setAttribute("employeeList", employeeList);
        request.getRequestDispatcher("employee/list.jsp").forward(request, response);
    }

    private void deleteEmployeeById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idEmployee = Integer.parseInt(request.getParameter("id"));
        employeeService.delete(idEmployee);
        response.sendRedirect("/employee");
    }

    private void showEditFormEmployee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = this.employeeService.findById(id);
        RequestDispatcher dispatcher;

        if (employee == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("employee", employee);
            dispatcher = request.getRequestDispatcher("employee/edit.jsp");
        }

        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                save(request, response);
                break;
            case "delete":
                deleteEmployeeById(request, response);
                break;
            case "edit":
                editById(request, response);
                break;
            case "search":
                searchByName(request, response);
            default:
                showListEmployee(request, response);
        }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String id_card = request.getParameter("id_card");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int position_id = Integer.parseInt(request.getParameter("position_id"));
        int education_degree_id = Integer.parseInt(request.getParameter("education_degree_id"));
        int division_id = Integer.parseInt(request.getParameter("division_id"));
        Employee employee = new Employee(name, birthday, id_card, salary, phone, email, address, position_id, education_degree_id, division_id);
        boolean check = employeeService.add(employee);
        String mess = "Thêm mới thành công";
        if (!check) {
            mess = "Thêm mới không thành công";
            request.setAttribute("mess", mess);
            showAddFormEmployee(request, response);
        }
        request.setAttribute("mess", mess);
        showListEmployee(request, response);
    }

    private void editById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        String id_card = request.getParameter("id_card");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int position_id = Integer.parseInt(request.getParameter("position_id"));
        int education_degree_id = Integer.parseInt(request.getParameter("education_degree_id"));
        int division_id = Integer.parseInt(request.getParameter("division_id"));

        Employee employee = this.employeeService.findById(id);
        RequestDispatcher dispatcher;
        if (employee == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            employee.setName(name);
            employee.setBirthday(birthday);
            employee.setId_card(id_card);
            employee.setSalary(salary);
            employee.setPhone(phone);
            employee.setEmail(email);
            employee.setAddress(address);
            employee.setPosition_id(position_id);
            employee.setEducation_degree_id(education_degree_id);
            employee.setDivision_id(division_id);

            this.employeeService.update(id,employee);
            request.setAttribute("employee", employee);
            dispatcher = request.getRequestDispatcher("/employee/edit.jsp");
        }
        dispatcher.forward(request, response);
    }
    private void searchByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("search");
        Employee employee = this.employeeService.findByName(name);
        RequestDispatcher dispatcher;

        if (employee == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("employee", employee);
            dispatcher = request.getRequestDispatcher("/employee/view.jsp");
        }

        dispatcher.forward(request,response);
    }
}
