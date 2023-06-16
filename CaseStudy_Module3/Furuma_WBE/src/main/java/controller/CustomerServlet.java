package controller;

import model.Customer;
import model.Employee;
import service.ICustomerService;
import service.impl.CustomerImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    ICustomerService customerService = new CustomerImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showAddFormCustomer(request, response);
                break;
            case "delete":
                break;
            case "edit":
                showEditFormCustomer(request, response);
                break;
            case "view":
//                viewCustomerCustomer(request,response);
                break;
            case "showListCustomer":
                showListCustomer(request, response);
        }
    }
    private void showAddFormCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("employee/add.jsp").forward(request, response);
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = customerService.findAll();
        request.setAttribute("customerList", customerList);
        request.getRequestDispatcher("customer/list.jsp").forward(request, response);
    }

    private void deleteEmployeeById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idCustomer = Integer.parseInt(request.getParameter("id"));
        customerService.delete(idCustomer);
        response.sendRedirect("/customer");
    }

    private void showEditFormCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = this.customerService.findById(id);
        RequestDispatcher dispatcher;

        if (customer == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("customer", customer);
            dispatcher = request.getRequestDispatcher("customer/edit.jsp");
        }

        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
