package controller;

import model.Product;
import service.Impl.ProductImpl;
import service.ProductService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    ProductService productService = new ProductImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showAddForm(request, response);
                break;
            case "delete":
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "view":
                viewCustomer(request,response);
            default:
                showList(request, response);
        }
    }

    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("view/product/add.jsp").forward(request, response);
    }

    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.findAll();
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("view/product/list.jsp").forward(request, response);
    }

    private void deleteById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idProduct = Integer.parseInt(request.getParameter("id"));
        productService.delete(idProduct);
        response.sendRedirect("/product");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        RequestDispatcher dispatcher;

        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("/view/product/update.jsp");
        }
        dispatcher.forward(request, response);
    }
    private void viewCustomer(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = this.productService.findById(id);
        RequestDispatcher dispatcher;

        if (product == null) {
            dispatcher = request.getRequestDispatcher("error404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("view/product/view.jsp");
        }

        dispatcher.forward(request,response);
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
                deleteById(request, response);
                break;
            case "edit":
                try {
                    editById(request,response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                break;
            case "search":
                searchByName(request,response);
            default:
                showList(request, response);
        }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String manufacturer = request.getParameter("manufacturer");
        Product product = new Product( name, price, manufacturer);
        boolean check = productService.add(product);
        String mess = "Thêm mới thành công";
        if (!check) {
            mess = "Thêm mới không thành công";
            request.setAttribute("mess", mess);
            showAddForm(request, response);
        }
        request.setAttribute("mess", mess);
        showList(request, response);
    }

    private void editById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String manufacturer = request.getParameter("manufacturer");

        Product product = productService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            Product book = new Product(id, name, price, manufacturer);
            this.productService.update(book);
            dispatcher = request.getRequestDispatcher("view/product/update.jsp");
        }
        dispatcher.forward(request, response);
    }
    private void searchByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("search");
        Product product = productService.findByName(name);
        RequestDispatcher dispatcher;

        if (product == null) {
            dispatcher = request.getRequestDispatcher("error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("view/product/view.jsp");
        }

        dispatcher.forward(request,response);
    }
}

