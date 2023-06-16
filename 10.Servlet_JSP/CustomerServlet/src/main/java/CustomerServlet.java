import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList = new ArrayList<>();
    static {
        customerList.add(new Customer(1,"Thomas","20/4/1997","New York","/img/img1.jpeg"));
        customerList.add(new Customer(2,"David","5/4/1992","Los Angeles","/img/img2"));
        customerList.add(new Customer(3,"Jenifer","8/8/1997","Da Nang","img3"));
        customerList.add(new Customer(4,"Heller","2/9/1991","Bangkok","img4"));
        customerList.add(new Customer(5,"Thor","1/2/1995","New York","img5"));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("customerList",customerList);
        request.setAttribute("myDate",new Date());
        request.getRequestDispatcher("/list.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
