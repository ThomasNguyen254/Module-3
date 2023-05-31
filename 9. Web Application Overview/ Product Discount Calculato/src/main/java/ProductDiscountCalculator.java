import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.awt.*;
import java.io.IOException;

@WebServlet(name = " ProductDiscountCalculator", value = "/ProductDiscountCalculator")
public class ProductDiscountCalculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doGet");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("doPost");
        String ProductDescription = request.getParameter("p_Description");
        double ListPrice = Double.parseDouble(request.getParameter("ListPrice"));
        double DiscountPercent = Double.parseDouble(request.getParameter("DiscountPercent"));

//        double DiscountPrice = Double.parseDouble(request.getParameter("DiscountPrice"));
        double DiscountAmount = ListPrice * DiscountPercent * 0.01;

        request.setAttribute("ListPrice",ListPrice);
        request.setAttribute("DiscountPercent",DiscountPercent);
        request.setAttribute("DiscountAmount",DiscountAmount);
//        request.setAttribute("DiscountPrice", ListPrice - DiscountAmount);
        request.getRequestDispatcher("/result.jsp").forward(request,response);
    }
}
